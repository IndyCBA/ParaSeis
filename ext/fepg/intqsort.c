void quicksort(int v[], int w[],int left, int right);
void qsort_(int v[], int w[],int* left, int* right);

void qsort_(int v[], int w[],int* left, int* right)
{
        int leftn,rightn;
        
        leftn=*left;
        rightn=*right;
        quicksort(v,w,leftn,rightn);
}

void swap(int v[], int i, int j)
{
	int temp;

	temp = v[i];
	v[i] = v[j];
	v[j] = temp;
}

void quicksort(int v[], int w[],int left , int right)
{
	int i, last,temp;

	if (left >= right) return;
	swap(v, left, (left+right)/2);
	swap(w, left, (left+right)/2);

	last = left;
	for (i = left+1; i <= right; i++)
		if (v[i] < v[left])
                {
                        temp=++last;
			swap(v, temp, i);
			swap(w, temp, i);
                }

	swap(v, left, last);
	swap(w, left, last);

	quicksort(v, w,left, last-1);
	quicksort(v, w,last+1, right);
}

