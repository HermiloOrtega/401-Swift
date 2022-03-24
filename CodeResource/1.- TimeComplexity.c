// 1
func swap(a, b) {
	temp = a;
	a = b;
	b = temp;
}

Time function f(n) = 3  --> O(1)
Space function s(n) = 3  --> O(1)


// 2
func sum(Array, size) {
	res = 0;
	for (i = 0; i < size; i++) {
		res = res + Array[i];
	}
	return res;
}

Time - f(n) = 2n + 3 - O(n)
Space - s(n) = n + 3 - O(n)

* A[i, j] => A[i][j]
func add(A, B, n) {
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			C[i, j] = A[i, j] + B[i, j];
		}
	}
}

Time - f(n) = 2n^2 + 2n + 1 => O(n^2)
Space - s(n) = 3n^2 + 3 => O(n^2)

// A, B : 2D array, matrix
func multiply(A, B, n) {
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			C[i, j] = 0;
			for (k = 0; k < n; k++) {
				C[i, j] = C[i, j] + A[i, k] * B[k, j];
			}
		}
	}
}
Time - f(n) = 2n^3 + 3n^2 + 2n + 1 => O(n^3)
Space - s(n) = 3n^2 + 4            => O(n^2) 


// Examples Big-O (Code snippets)
// 1
for (i = 1; i < n; i = i + 2) {
	// some statements
}

f(n) = n / 2 - O(n)

// 2
for (i = 0; i < n; i++) {
	for (j = 0; j < n; j++) {
		// some statements
	}
}

f(n) = 2n^2 + 2n + 1 -> O(n^2)

// 3
for (i = 0; i < n; i++) {
	for (j = 0; j < i; j++) {
		// some statements
	}
}

f(n) = n(n+1)/2 = (1/2)n^2 + (1/2)n => O(n^2)

// 4
p = 0;
for (i = 1; p <= n; i++) {
	p = p + i;
}

Assume p > n (when the loop ends)
when i = k, since p = k(k+1)/2, we can say k(k+1)/2 > n,
simply k^2 > n, hence k > sqrt(n)

O(sqrt(n))


// 5
for (i = 1; i < n; i = i * 2) {
	// some statements
}

O(lg n)

// 6
for (i = n; i >= 1; i = i / 2) {
	// some statements
}

O(lg n)


// 7
for (i = 0; i * i < n; i++) {
	// some statements
}

O(sqrt(n))

// 8
for (i = 0; i < n; i++) {
	// some statements
}
for (j = 0; j < n; j++) {
	// some statements
}

f(n) = 2n
O(n) // this is not n^2


// 9
p = 0
for (i = 1; i < n; i = i * 2) {
	p++;
}
for (j = 1; j < p; j = j * 2) {
	// some statements
}

O(lg lg n)

// 10

for (i = 0; i < n; i++) {
	for (j = 1; j < n; j = j * 2) {
		// some statements
	}
}

O(nlg n)

// Names

O(1) - Contant
O(lg N) - Logarithmic
O(N) - Linear
O(N^2) - Quadratic // polynomial time
O(N^3) - Cubic // polynomial time
O(2^n), O(3^n), ..., O(n^n) - Exponential

The Fastest to Slowest

1 < lg N < sqrt(N) < N < Nlg N < N^2 < N^3 < ... < 2^n < 3^n < ... < n^n 


