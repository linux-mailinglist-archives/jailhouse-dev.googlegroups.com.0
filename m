Return-Path: <jailhouse-dev+bncBCDJXM4674ERBCHKWTYQKGQETV4LMVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5DF149976
	for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 07:43:22 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id q204sf929515oic.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 25 Jan 2020 22:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=va+dB9R+UDRj2lLShwOdbbjnEcU0bDrZAtraNTlrgWk=;
        b=lVvqkJPEvcSVn2BqzKiIMZHiQVEUaWN6xYWenm3sAVjAyLTF7XFJmCtQ3kDxkkkcZ4
         WdG9XNjfO5x+rtAmLHdjLItr7D9KvQcpnujjaaX3H2LQT4JnNzrU6zA2CMGHwGYpuHRp
         U6BruunlTroJi83Dw0moc9uebM29kvveZrsHGOCosCQHjbMlbFGjL6vWX2RP71XdT+SN
         er1zsVtjnqqgsbnnpKjI7/D2Rn1vf+wclVVUzLkrUEYT94UfTejQO8mrtbaZpYJr8tHY
         Hm27sMEeST1/CadduRvf8VZYOh8lZ9/bZDtmPfPsF+kBu+V8goXVHj8axXHC+EmiQ5fk
         GJYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=va+dB9R+UDRj2lLShwOdbbjnEcU0bDrZAtraNTlrgWk=;
        b=NPhgJLovde+WFlokbkJEmoQOamlUPHKVGPRGWUHPoqakCRMJOiMGsKsb9hQG7AuuWF
         fBxMuh6I0lMS0pNWlo3YUD6rmfNxgypbe8Qbk1OKq0A1oJgDb9oWCDQxAfM9SIlNW7gH
         gP9Y3P4DJ6h40cPw/Ioi5EQOkBxBevzD1lF/CBDUJkee3FoLosdbKI2acNV6viRkW9ct
         STWzJR0l7gqrl2IzkSSGY0MuATitP8euA/KJDkeeW/ZspPjAQ8CAXdI2Or/iugWUVQwR
         FDpp2hojykpvcP1dbDs8eo45fQ9DxJSnIUI8/C0Lgr4vQvoZ8MRFlMTyWV2eE6bYelMG
         omFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=va+dB9R+UDRj2lLShwOdbbjnEcU0bDrZAtraNTlrgWk=;
        b=Q5bWAXZAxiyq6ATVwlcg9fLzYIbCatx0VH5pGstGoPhycEzpAKIkQplL3/aD03V8Xq
         izS1QcWU31BfoErZt0P32i1W5Qg9Aqk3cfTmS8o5KVJzdHxS/ob17bpQlJcVjvWtEM4r
         uhzP6zj5cjzH6uge20Ep99YSDvBu8Dx++dT3X8sutjR9ExpJTet97+abdz5S47aXmvYa
         syp57cUG0s50RYqZhH+aT8zY9ebdwjXb6GJS3AyGrydSfL8mZiqAEnousIKdDZUWAAW+
         hA372Fz8j+HGkbK8KtWmn/2dmBKMCd9w5b8VIxgEYnIhSNUNoEyq8jnheuv/RA/fcWgc
         G7Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGoX5/KcBYpBe7rUGUJ/kpNmv4dgkC/Ooggtd/dQPCTctSDFhM
	N9Uzb2HG4o1bLYZEnTSwu58=
X-Google-Smtp-Source: APXvYqyj4t+u/uW9JEdPcBUwOHbEi9vfiQMeViTiunLk0wLhyxwYljUv1HrVvJM/J3HIRecSXza3sg==
X-Received: by 2002:a9d:7cd0:: with SMTP id r16mr8766578otn.50.1580021000575;
        Sat, 25 Jan 2020 22:43:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:910:: with SMTP id w16ls713933oih.2.gmail; Sat, 25
 Jan 2020 22:43:20 -0800 (PST)
X-Received: by 2002:aca:3554:: with SMTP id c81mr235080oia.0.1580020999769;
        Sat, 25 Jan 2020 22:43:19 -0800 (PST)
Date: Sat, 25 Jan 2020 22:43:18 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <14044a3a-7bc1-45c0-8447-2138f3834838@googlegroups.com>
In-Reply-To: <1c6fd98d-5f05-eb49-5780-273387eae195@oth-regensburg.de>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <1c6fd98d-5f05-eb49-5780-273387eae195@oth-regensburg.de>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3874_183463694.1580020998920"
X-Original-Sender: Michael.G.Hinton@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_3874_183463694.1580020998920
Content-Type: multipart/alternative; 
	boundary="----=_Part_3875_676603656.1580020998921"

------=_Part_3875_676603656.1580020998921
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

On Thursday, January 23, 2020 at 5:02:40 AM UTC-7, Ralf Ramsauer wrote:
>
> On 23/01/2020 08:57, Michael Hinton wrote:=20
> > Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU run=
ning Kubuntu=20
> > 19.10. I have an inmate that is given a single core and runs a=20
> > single-threaded workload. For comparison, I also run the same workload=
=20
> > in Linux under Jailhouse.=20
>
> What CPU exactly?=20
>
CPU 2 (.cpus =3D {0b0100}). I could try moving it to another core to see if=
=20
that makes a difference.
=20

> > For a SHA3 workload with the same 20 MiB input, the root Linux cell (an=
d=20
> > no inmate running) takes about 2 seconds, while the inmate (and an idle=
=20
> > root cell) takes about 2.8 seconds. That is a worrisome discrepancy, an=
d=20
> > I need to understand why it=E2=80=99s 0.8 s slower.=20
>
> What about CPU power features? cpufreq? turbo boost? ...=20
>
I have already turned off Hardware P-states when booting Linux, and that=20
stopped hardware p-state stuff affecting my inmate benchmarks:

hintron@bazooka:~/code/jailhouse/mgh/scripts$ grep "no_hwp"=20
/etc/default/grub   =20
GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash intel_iommu=3Doff=20
memmap=3D82M\\\$0x3a000000 kvm_intel.nested=3D1 in
tel_pstate=3Dno_hwp acpi=3Dforce"

As for Turbo Boost, I've been trying to turn it off, but it appears that=20
the inmate just runs at the max turbo boost frequency when it starts up,=20
which in this case is 3.9 GHz. I've even measured the frequency in the=20
inmate with the APERF and MPERF MSRs to verify this. When I change the=20
Turbo Boost max frequency in Linux to 3.7 GHz using CoreFreq, that is what=
=20
the inmate runs at when I start the inmate.

SHA3 is only computationally 'expensive', right? So it's neither memory=20
> intensive nor should it trap.=20
>
Yes, SHA3 is computationally expensive. When running it under VTune, it=20
doesn't show it as memory bound. The other two workloads are more memory=20
bound.

By "trap" do you mean a vmexit or something else?
=20

> > You can see that the inmate and the Linux wrapper both execute the same=
=20
> > function, sha3_mgh(). It's the same C code.=20
> >=20
> >=20
> > The other workloads I run are intentionally more memory intensive. They=
=20
> > see a much worse slowdown. For my CSB workload, the root cell takes onl=
y=20
> > 0.05 s for a 20 MiB input, while the inmate takes 1.48 s (30x=20
> > difference). And for my Random Access workload, the root cell takes 0.0=
8=20
> > s while the inmate takes 3.29 s for a 20 MiB input (40x difference).=20
>
> Now this sounds pretty much like what I once had: too little caches for=
=20
> the inmate.=20
>
> BTW: For a sound comparison, you would need to take care to have a=20
> comparable initial hardware state: E.g., you need to take care that=20
> workloads in root-cell and non-root inmate are both either uncached or=20
> cached when starting the code.=20
>
I run 10 consecutive iterations for each workload, so that should flush=20
things out, right?

But that's fine tuning, and won't explain a 40x difference.=20
>
> I recommend to deactivate hyperthreading.=20


> If your inmate just gets one sibling, the other one will still belong to=
=20
> Linux, which could, in case of utilisation, steals a lot of power. So=20
> either disable HT or assign both siblings to the inmate.=20
>
Yeah, I deactivated HT a while ago, because I realized there could be=20
significant coupling between logical threads on the same core, like you=20
mentioned. So there are 6 cores on my CPU without HT.
=20

> >=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-inmate.c=20
> >=20
> >=20
> > I did do some modifications to Jailhouse with VMX and the preemption=20
> > timer, but any slowdown that I may have inadvertently introduced should=
=20
> > apply equally to the inmate and root cell.=20
> >=20
> >=20
> > It=E2=80=99s possible that I am measuring the duration of the inmate=20
> > incorrectly. But the number of vmexits I measure for the inmate and roo=
t=20
> > seem to roughly correspond with the duration. I also made sure to avoid=
=20
>
> Yeah, I would also expect that: Your code only utilises memory + CPU,=20
> almost no I/O.=20
>
> > tsc_read_ns() by instead recording the TSC cycles and deriving the=20
> > duration by dividing by 3,700,000,000 (the unchanging TSC frequency of=
=20
> > my processor). Without this, the time recorded would overflow after=20
> > something like 1.2 seconds.=20
> >=20
> >=20
> > I'm wondering if something else is causing unexpected delays: using=20
> > IVSHMEM, memory mapping extra memory pages and using it to hold my=20
> > input, printing to a virtual console in addition to a serial console,=
=20
> > disabling hardware p-states, turbo boost in the root cell, maybe the=20
> > workload code is being compiled to different instructions for the inmat=
e=20
> > vs. Linux, etc.=20
>
> The latter one: You definitely need to check that. If your Linux=20
> compiler generates (e.g.) AVX code and your inmate.=20
>
Ok, I compared the assembly and they were very different. It turns out that=
=20
I was using a different version of GCC *and* my machine by default does PIC=
.
=20

> You could also try to link the same library object to your target=20
> binaries -- the build system is your friend.=20
>
That is a great idea. I just did that today to see if I get better results.=
=20
I made sure to use the same object files for the workload. That, combined=
=20
with no PIC and using the same version of GCC, made the duration of the=20
SHA3 workload running in Linux go from 2.0 s to *1.2* seconds. So now the=
=20
discrepancy is even larger! 2.8 s (inmate) vs. 1.2 s (Linux). I imagine=20
that not doing PIC was probably the biggest difference, but I'm not sure=20
exactly how that interacts with the hypervisor. At any rate, I'm still=20
quite lost at how there is a 1.6 s difference between the inmate and Linux.

I did notice something strange, though: somehow the CPU features in=20
/proc/cpuinfo are different for different cores. So this causes `jailhouse=
=20
hardware check` to fail, since that check assumes that all CPUs have the=20
same features. When the machine boots, they do. But after running for a=20
while, they don't. I'm not sure what causes them to activate those features=
.

So for CPU 0 and 2, right now it shows that they have three extra features:=
 md_clear,=20
flush_l1d, and ssbd. All three of those are hardware bug mitigation=20
features. But can that explain a 1.6 s difference? And why would some CPUs=
=20
run the mitigations while others do not? That seems fishy to me. I'll do=20
more testing to see if running the inmate on a core without those features=
=20
currently active improves performance (it should, but by how much?).=20

=20

> > Sorry for all the detail, but I am grasping at straws at this point. An=
y=20
> > ideas at what I could look into are appreciated.=20
>
> Benchmarking is fun. Especially getting the hardware under control. :-) =
=20
>
  Ralf=20
>
"fun" :)

Thanks,
Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/14044a3a-7bc1-45c0-8447-2138f3834838%40googlegroups.com.

------=_Part_3875_676603656.1580020998921
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ralf,<div><br></div><div>On Thursday, January 23, 2020 =
at 5:02:40 AM UTC-7, Ralf Ramsauer wrote:<blockquote class=3D"gmail_quote" =
style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-l=
eft: 1ex;">On 23/01/2020 08:57, Michael Hinton wrote:
<br>&gt; Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CP=
U running Kubuntu
<br>&gt; 19.10. I have an inmate that is given a single core and runs a
<br>&gt; single-threaded workload. For comparison, I also run the same work=
load
<br>&gt; in Linux under Jailhouse.
<br>
<br>What CPU exactly?
<br></blockquote><div>CPU 2 (.cpus =3D {0b0100}). I could try moving it to =
another core to see if that makes a difference.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-l=
eft: 1px #ccc solid;padding-left: 1ex;">&gt; For a SHA3 workload with the s=
ame 20 MiB input, the root Linux cell (and
<br>&gt; no inmate running) takes about 2 seconds, while the inmate (and an=
 idle
<br>&gt; root cell) takes about 2.8 seconds. That is a worrisome discrepanc=
y, and
<br>&gt; I need to understand why it=E2=80=99s 0.8 s slower.
<br>
<br>What about CPU power features? cpufreq? turbo boost? ...
<br></blockquote><div>I have already turned off Hardware P-states when boot=
ing Linux, and that stopped hardware p-state stuff affecting my inmate benc=
hmarks:</div><div><br></div><div><span style=3D"font-family:monospace"><spa=
n style=3D"font-weight: bold; color: rgb(84, 255, 84);">hintron@bazooka</sp=
an><span style=3D"color: rgb(0, 0, 0);">:</span><span style=3D"font-weight:=
 bold; color: rgb(84, 84, 255);">~/code/jailhouse/mgh/scripts</span><span s=
tyle=3D"color: rgb(0, 0, 0);">$ grep &quot;no_hwp&quot; /etc/default/grub =
=C2=A0=C2=A0=C2=A0</span><br>GRUB_CMDLINE_LINUX_DEFAULT=3D&quot;quiet splas=
h intel_iommu=3Doff memmap=3D82M\\\$0x3a000000 kvm_intel.nested=3D1 in<br>t=
el_pstate=3D<span style=3D"font-weight: bold; color: rgb(255, 84, 84);">no_=
hwp</span><span style=3D"color: rgb(0, 0, 0);"> acpi=3Dforce&quot;</span><b=
r>
<br></span></div><div>As for Turbo Boost, I&#39;ve been trying to turn it o=
ff, but it appears that the inmate just runs at the max turbo boost frequen=
cy when it starts up, which in this case is 3.9 GHz. I&#39;ve even measured=
 the frequency in the inmate with the APERF and MPERF MSRs to verify this. =
When I change the Turbo Boost max frequency in Linux to 3.7 GHz using CoreF=
req, that is what the inmate runs at when I start the inmate.<br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left=
: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">SHA3 is only comput=
ationally &#39;expensive&#39;, right? So it&#39;s neither memory
<br>intensive nor should it trap.
<br></blockquote><div>Yes, SHA3 is computationally expensive. When running =
it under VTune, it doesn&#39;t show it as memory bound. The other two workl=
oads are more memory bound.</div><div><br></div><div>By &quot;trap&quot; do=
 you mean a vmexit or something else?</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #=
ccc solid;padding-left: 1ex;">&gt; You can see that the inmate and the Linu=
x wrapper both execute the same
<br>&gt; function, sha3_mgh(). It&#39;s the same C code.
<br>&gt;=20
<br>&gt;=20
<br>&gt; The other workloads I run are intentionally more memory intensive.=
 They
<br>&gt; see a much worse slowdown. For my CSB workload, the root cell take=
s only
<br>&gt; 0.05 s for a 20 MiB input, while the inmate takes 1.48 s (30x
<br>&gt; difference). And for my Random Access workload, the root cell take=
s 0.08
<br>&gt; s while the inmate takes 3.29 s for a 20 MiB input (40x difference=
).
<br>
<br>Now this sounds pretty much like what I once had: too little caches for
<br>the inmate.
<br>
<br>BTW: For a sound comparison, you would need to take care to have a
<br>comparable initial hardware state: E.g., you need to take care that
<br>workloads in root-cell and non-root inmate are both either uncached or
<br>cached when starting the code.
<br></blockquote><div>I run 10 consecutive iterations for each workload, so=
 that should flush things out, right?</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #cc=
c solid;padding-left: 1ex;">But that&#39;s fine tuning, and won&#39;t expla=
in a 40x difference.
<br><br>I recommend to deactivate hyperthreading.=C2=A0</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-lef=
t: 1px #ccc solid;padding-left: 1ex;">
<br>If your inmate just gets one sibling, the other one will still belong t=
o
<br>Linux, which could, in case of utilisation, steals a lot of power. So
<br>either disable HT or assign both siblings to the inmate.
<br></blockquote><div>Yeah, I deactivated HT a while ago, because I realize=
d there could be significant coupling between logical threads on the same c=
ore, like you mentioned. So there are 6 cores on my CPU without HT.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-=
left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">&gt; <a href=3D=
"https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac7=
9f4a1cde/configs/x86/bazooka-inmate.c" target=3D"_blank" rel=3D"nofollow" o=
nmousedown=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%=
2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446ca682f73679616a0f3df8ac=
79f4a1cde%2Fconfigs%2Fx86%2Fbazooka-inmate.c\x26sa\x3dD\x26sntz\x3d1\x26usg=
\x3dAFQjCNHhH5hG16S03OXU6Fq_aUXIBWtMog&#39;;return true;" onclick=3D"this.h=
ref=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintr=
on%2Fjailhouse%2Fblob%2F76e6d446ca682f73679616a0f3df8ac79f4a1cde%2Fconfigs%=
2Fx86%2Fbazooka-inmate.c\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHhH5hG16S0=
3OXU6Fq_aUXIBWtMog&#39;;return true;">https://github.com/hintron/<wbr>jailh=
ouse/blob/<wbr>76e6d446ca682f73679616a0f3df8a<wbr>c79f4a1cde/configs/x86/<w=
br>bazooka-inmate.c</a>
<br>&gt;=20
<br>&gt;=20
<br>&gt; I did do some modifications to Jailhouse with VMX and the preempti=
on
<br>&gt; timer, but any slowdown that I may have inadvertently introduced s=
hould
<br>&gt; apply equally to the inmate and root cell.
<br>&gt;=20
<br>&gt;=20
<br>&gt; It=E2=80=99s possible that I am measuring the duration of the inma=
te
<br>&gt; incorrectly. But the number of vmexits I measure for the inmate an=
d root
<br>&gt; seem to roughly correspond with the duration. I also made sure to =
avoid
<br>
<br>Yeah, I would also expect that: Your code only utilises memory + CPU,
<br>almost no I/O.
<br>
<br>&gt; tsc_read_ns() by instead recording the TSC cycles and deriving the
<br>&gt; duration by dividing by 3,700,000,000 (the unchanging TSC frequenc=
y of
<br>&gt; my processor). Without this, the time recorded would overflow afte=
r
<br>&gt; something like 1.2 seconds.
<br>&gt;=20
<br>&gt;=20
<br>&gt; I&#39;m wondering if something else is causing unexpected delays: =
using
<br>&gt; IVSHMEM, memory mapping extra memory pages and using it to hold my
<br>&gt; input, printing to a virtual console in addition to a serial conso=
le,
<br>&gt; disabling hardware p-states, turbo boost in the root cell, maybe t=
he
<br>&gt; workload code is being compiled to different instructions for the =
inmate
<br>&gt; vs. Linux, etc.
<br>
<br>The latter one: You definitely need to check that. If your Linux
<br>compiler generates (e.g.) AVX code and your inmate.
<br></blockquote><div>Ok, I compared the assembly and they were very differ=
ent. It turns out that I was using a different version of GCC *and* my mach=
ine by default does PIC.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pad=
ding-left: 1ex;">You could also try to link the same library object to your=
 target
<br>binaries -- the build system is your friend.
<br></blockquote><div>That is a great idea. I just did that today to see if=
 I get better results. I made sure to use the same object files for the wor=
kload. That, combined with no PIC and using the same version of GCC, made t=
he duration of the SHA3 workload running in Linux go from 2.0 s to *1.2* se=
conds. So now the discrepancy is even larger! 2.8 s (inmate) vs. 1.2 s (Lin=
ux). I imagine that not doing PIC was probably the biggest difference, but =
I&#39;m not sure exactly how that interacts with the hypervisor. At any rat=
e, I&#39;m still quite lost at how there is a 1.6 s difference between the =
inmate and Linux.</div><div><br></div><div>I did notice something strange, =
though: somehow the CPU features in /proc/cpuinfo are different for differe=
nt cores. So this causes `jailhouse hardware check` to fail, since that che=
ck assumes that all CPUs have the same features. When the machine boots, th=
ey do. But after running for a while, they don&#39;t. I&#39;m not sure what=
 causes them to activate those features.</div><div><br></div><div>So for CP=
U 0 and 2, right now it shows that they have three extra features:=C2=A0<sp=
an style=3D"color: rgb(0, 0, 0); font-family: monospace;">md_clear, flush_l=
1d, and=C2=A0</span><font color=3D"#000000" face=3D"monospace">ssbd.</font>=
 All three of those are hardware bug mitigation features. But can that expl=
ain a 1.6 s difference? And why would some CPUs run the mitigations while o=
thers do not? That seems fishy to me. I&#39;ll do more testing to see if ru=
nning the inmate on a core without those features currently active improves=
 performance (it should, but by how much?).=C2=A0</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-lef=
t: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">&gt; Sorry for all=
 the detail, but I am grasping at straws at this point. Any
<br>&gt; ideas at what I could look into are appreciated.=20
<br>
<br>Benchmarking is fun. Especially getting the hardware under control. :-)=
=C2=A0=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">=
=C2=A0 Ralf
<br></blockquote><div>&quot;fun&quot; :)</div><div><br></div><div>Thanks,</=
div></div><div>Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/14044a3a-7bc1-45c0-8447-2138f3834838%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/14044a3a-7bc1-45c0-8447-2138f3834838%40googlegroups.com<=
/a>.<br />

------=_Part_3875_676603656.1580020998921--

------=_Part_3874_183463694.1580020998920--
