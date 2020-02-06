Return-Path: <jailhouse-dev+bncBCDJXM4674ERBTWE6HYQKGQERD56RZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18D154B84
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 20:00:32 +0100 (CET)
Received: by mail-oi1-x23b.google.com with SMTP id m127sf3300606oig.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 11:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OLxdwVEgJAjD8iqPBpOF8ULgBCG75To3Ib6KhFn9lPc=;
        b=AYyUMR+agLRMeqg7rU9BVngsBMkwLvjfYbTOIBFZG0F5c3+pejZG+nugNTYRIgd0ek
         eHvgY9/u9w5JHteZKri/bQB+r0tzoWr4kEam00NN9E55VxhBkpL55QnWbXcRmsH2u4im
         qnEETJ7RlV48AYShmSn37XKykjilBXLmAt7RSZuQ7ypERvNnvFNOwffX+sdxoDA+6IlG
         6DSbKk6/w4H94S1F8Zmj3ut3jKd5x3EaCMjYP2COrEk8un+HFOw6g0JB0IciMeQ/DVt2
         Dm7ZZ6MCiGp/Wk+cPe8wsFJTJgPhTM1gdwnU/N6aCxeQfnqJzY/cYv+JuXuom1SNY707
         Yh/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OLxdwVEgJAjD8iqPBpOF8ULgBCG75To3Ib6KhFn9lPc=;
        b=Q2W1T2ki6DL/kztwKO0gFyrM8aAiATfnLBi4BAtQiqHzStpDPoCBYw/ag4nlWjP6Xu
         SFLUKekE+QuuxgrMcvvDl67a0HL9YwzsvrjHFt4k3IrfzIcgZd3IU80DdN2pHFN5Ssrm
         cNa+FCOmnvuhqPWothPAbBtP672X8gzZ27DqwYGxhYp2aHDFrYIEK1LNhsvYkuY5+Q+8
         2588OMTOhUkpRkpm5xx2vQoKJNRFxxpavTwv3yYeJEvtOfQ4nHKJIYvWfsR9RWbn1pkR
         yMCEhm33P5U/8zDCOST0DbGpC85h8kev38CLioUNyS6d9dpwqL4q7RSZc+pD376eeFuC
         YkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OLxdwVEgJAjD8iqPBpOF8ULgBCG75To3Ib6KhFn9lPc=;
        b=kWDQ32VpZ015p3oqh5XF2dR0y4cQYHR4JcIdMAGeTkXyHhK8WbHbSjEsOvmOVWcYxk
         +JM6r7JURU1LFtKBPAT/CDPjk/Q8Yi70ARfbTtDoE/uho6P9pD5hJiLAydU3A61resUG
         KiKT4Dkm7yxC/M7utBIOmHcWeXiRYGjkSbPw3y5BSCH3OUNIXZPEb9GcQuIymGf++itg
         Ci1tlUlKRh+QEdRoey7cDigeURgipzjjA7IJdfTkuhVsweqnn0rGPFpD0pbGE9iFVb+P
         RBvwfe2gNj72NjM78qPB1AysHyLgyDjF0oRdgctsMS8ZljjqJZ9ys6af6+HwaFt0e0fo
         Yt+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjpJhjf69GQkwNpzJMjNdx1kFuObbJRObujGsTe1O6QzJ5tKn1
	e0NUIN4JKjDPzrfxtwNIfBI=
X-Google-Smtp-Source: APXvYqzEfL6UO2SrEfxSl0OAvEnro+l95K8NVof/I8NNpLuCdGZ2qh3ousIJxIFD65dMQwmFEGMH7A==
X-Received: by 2002:a05:6808:10b:: with SMTP id b11mr8173003oie.110.1581015631210;
        Thu, 06 Feb 2020 11:00:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5a87:: with SMTP id w7ls2124363oth.1.gmail; Thu, 06 Feb
 2020 11:00:30 -0800 (PST)
X-Received: by 2002:a9d:7e90:: with SMTP id m16mr24411531otp.227.1581015630477;
        Thu, 06 Feb 2020 11:00:30 -0800 (PST)
Date: Thu, 6 Feb 2020 11:00:29 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
In-Reply-To: <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1891_1372169074.1581015629607"
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

------=_Part_1891_1372169074.1581015629607
Content-Type: multipart/alternative; 
	boundary="----=_Part_1892_1076642110.1581015629608"

------=_Part_1892_1076642110.1581015629608
Content-Type: text/plain; charset="UTF-8"

Hi Henning,

On Monday, January 27, 2020 at 12:16:08 AM UTC-7, Henning Schild wrote:
>
> Ok, so we are just looking for differences between the inmate and the 
> linux as non-root cell, because the jailhouse/virtualization overhead 
> is acceptable or known. 
>
I'm sorry, I was confused. That is actually not correct. I am looking for 
the difference between the inmate running my simple workload vs. running 
that same workload in the *root cell* rather than in a non-root Linux cell. 
What I am doing is activating the root cell, then simply running the 
workload in Linux with a wrapper program (sha3-512.c 
<https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/mgh/workloads/src/sha3-512.c>). 
Then, I activate my inmate and run the same workload, but this time within 
the inmate in a real-time wrapper application (mgh-demo.c 
<https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c>). 
Both wrapper applications now use the exact same object file, compiled once 
under the Jailhouse build system. But the results are still the same.

However, the input used by the program in the inmate is in a special 
'add-on' memory region I had to create and map manually with map_range().

Here is the additional memory region in my config that I named the 'heap' 
(I need it big enough to hold a 20 MiB+ data input):

/* MGH: RAM - Heap */
{
/* MGH: We have 36 MB of memory allocated to the inmate
* in the root config, but are only using 1 MB for the
* inmate's stack and program. So create an additional
* "heap" area with the other 35 MB to allow the program
* more memory to work with. */
.phys_start = 0x3a700000,
.virt_start = 0x00200000,
// 35 MB (3a7 + 23 = 3ca)
.size = 0x02300000,
.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
},

https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/configs/x86/bazooka-inmate.c#L90-L103

I am able to map that large 35 MiB memory region into my inmate, and it 
works ok:

#define MGH_HEAP_BASE 0x00200000
#define MGH_HEAP_SIZE (35 * MB)
...
/*
 * MGH: By default, x86 inmates only map the first 2 MB of virtual memory, 
even
 * when more memory is configured. So map configured memory pages behind the
 * virtual memory address MGH_HEAP_BASE. Without this, there is nothing 
behind
 * the virtual memory address and you'll get a page fault.
 */
static void expand_memory(void)
{
map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED);

/* Set heap_pos to point to MGH_HEAP_BASE, instead of right after the
* inmate's stack, so alloc() can allocate more than 1 MB. */
heap_pos = MGH_HEAP_BASE;
}

https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c#L113-L114
https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c#L930-L943
.

I have tried using both my 'heap' memory region (with 
programmatically-generated input) as well as using input passed into the IVSHMEM 
shared memory region 
<https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/configs/x86/bazooka-inmate.c#L79-L89>, 
with the same results.

Maybe there is something wrong with the memory paging that is making things 
a lot slower than expected, like you implied. Maybe regular Linux has a 
faster way of setting up paging/memory.

In your last response, you said this:

"For the inmate itself the pagetable is constructed by the mapping
library. The code looks like it tries to do huge pages, make sure the
call map_range just once with your full memory range. Aligned and maybe
more than you actually need. Consider putting a few printfs into the
mapping code to see which path (page-size) it goes."

Could you explain the following suggestion a bit more?: "make sure the call 
map_range just once with your full memory range." It looks like mgh-demo.c 
calls map_range twice: once in map_shmem_and_bars() (from your original 
IVSHMEM demo code, which I based this off of), and then in expand_memory() 
as shown above. Are you saying I should combine those into one single call?

Also, can you explain this: "Aligned and maybe more than you actually need. 
Consider putting a few printfs into the mapping code to see which path 
(page-size) it goes." I'm not sure what I should be looking for inside 
map_range(). What do you mean by "which path (page-size) it goes," exactly? 
What's the code path?

Sorry for the bother. I really need to understand why this is happening, 
because this discrepancy completely overshadows my other slightly-positive 
timing results in my research. Any help is greatly appreciated.

Thanks,
Michael  

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/96056326-0700-4779-b1b8-3b0df7134a73%40googlegroups.com.

------=_Part_1892_1076642110.1581015629608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Henning,<br></div><div><br></div>On Monday, Januar=
y 27, 2020 at 12:16:08 AM UTC-7, Henning Schild wrote:<blockquote class=3D"=
gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc so=
lid;padding-left: 1ex;">Ok, so we are just looking for differences between =
the inmate and the
<br>linux as non-root cell, because the jailhouse/virtualization overhead
<br>is acceptable or known.
<br></blockquote><div>I&#39;m sorry, I was confused. That is actually not c=
orrect. I am looking for the difference between the inmate running my simpl=
e workload vs. running that same workload in the *root cell* rather than in=
 a non-root Linux cell. What I am doing is activating the root cell, then s=
imply running the workload in Linux with a wrapper program (<a href=3D"http=
s://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf6=
41e/mgh/workloads/src/sha3-512.c">sha3-512.c</a>). Then, I activate my inma=
te and run the same workload, but this time within the inmate in a real-tim=
e wrapper application (<a href=3D"https://github.com/hintron/jailhouse/blob=
/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c">mgh=
-demo.c</a>). Both wrapper applications now use the exact same object file,=
 compiled once under the Jailhouse build system. But the results are still =
the same.</div><div><br></div><div>However, the input used by the program i=
n the inmate is in a special &#39;add-on&#39; memory region I had to create=
 and map manually with map_range().</div><div><br></div><div>Here is the ad=
ditional memory region in my config that I named the &#39;heap&#39; (I need=
 it big enough to hold a 20 MiB+ data input):</div><div><br></div><div><div=
><font face=3D"courier new, monospace"><span style=3D"white-space:pre">		</=
span>/* MGH: RAM - Heap */</font></div><div><font face=3D"courier new, mono=
space"><span style=3D"white-space:pre">		</span>{</font></div><div><font fa=
ce=3D"courier new, monospace"><span style=3D"white-space:pre">			</span>/* =
MGH: We have 36 MB of memory allocated to the inmate</font></div><div><font=
 face=3D"courier new, monospace"><span style=3D"white-space:pre">			</span>=
 * in the root config, but are only using 1 MB for the</font></div><div><fo=
nt face=3D"courier new, monospace"><span style=3D"white-space:pre">			</spa=
n> * inmate&#39;s stack and program. So create an additional</font></div><d=
iv><font face=3D"courier new, monospace"><span style=3D"white-space:pre">		=
	</span> * &quot;heap&quot; area with the other 35 MB to allow the program<=
/font></div><div><font face=3D"courier new, monospace"><span style=3D"white=
-space:pre">			</span> * more memory to work with. */</font></div><div><fon=
t face=3D"courier new, monospace"><span style=3D"white-space:pre">			</span=
>.phys_start =3D 0x3a700000,</font></div><div><font face=3D"courier new, mo=
nospace"><span style=3D"white-space:pre">			</span>.virt_start =3D 0x002000=
00,</font></div><div><font face=3D"courier new, monospace"><span style=3D"w=
hite-space:pre">			</span>// 35 MB (3a7 + 23 =3D 3ca)</font></div><div><fon=
t face=3D"courier new, monospace"><span style=3D"white-space:pre">			</span=
>.size =3D 0x02300000,</font></div><div><font face=3D"courier new, monospac=
e"><span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |</font></div><div><font face=3D"courier new, monospa=
ce"><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM_EXECUTE | JAIL=
HOUSE_MEM_LOADABLE,</font></div><div><font face=3D"courier new, monospace">=
<span style=3D"white-space:pre">		</span>},</font></div></div><div><br></di=
v><div><a href=3D"https://github.com/hintron/jailhouse/blob/05824b901ce714c=
7a61770774b862ef24caf641e/configs/x86/bazooka-inmate.c#L90-L103">https://gi=
thub.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/co=
nfigs/x86/bazooka-inmate.c#L90-L103</a><br></div><div><br></div><div>I am a=
ble to map that large 35 MiB memory region into my inmate, and it works ok:=
</div><div><br></div><div><div><font face=3D"courier new, monospace">#defin=
e MGH_HEAP_BASE<span style=3D"white-space:pre">		</span>0x00200000</font></=
div><div><font face=3D"courier new, monospace">#define MGH_HEAP_SIZE<span s=
tyle=3D"white-space:pre">		</span>(35 * MB)</font></div></div><div><font fa=
ce=3D"courier new, monospace">...</font></div><div><div><font face=3D"couri=
er new, monospace">/*</font></div><div><font face=3D"courier new, monospace=
">=C2=A0* MGH: By default, x86 inmates only map the first 2 MB of virtual m=
emory, even</font></div><div><font face=3D"courier new, monospace">=C2=A0* =
when more memory is configured. So map configured memory pages behind the</=
font></div><div><font face=3D"courier new, monospace">=C2=A0* virtual memor=
y address MGH_HEAP_BASE. Without this, there is nothing behind</font></div>=
<div><font face=3D"courier new, monospace">=C2=A0* the virtual memory addre=
ss and you&#39;ll get a page fault.</font></div><div><font face=3D"courier =
new, monospace">=C2=A0*/</font></div><div><font face=3D"courier new, monosp=
ace">static void expand_memory(void)</font></div><div><font face=3D"courier=
 new, monospace">{</font></div><div><font face=3D"courier new, monospace"><=
span style=3D"white-space:pre">	</span>map_range((char *)MGH_HEAP_BASE, MGH=
_HEAP_SIZE, MAP_UNCACHED);</font></div><div><font face=3D"courier new, mono=
space"><br></font></div><div><font face=3D"courier new, monospace"><span st=
yle=3D"white-space:pre">	</span>/* Set heap_pos to point to MGH_HEAP_BASE, =
instead of right after the</font></div><div><font face=3D"courier new, mono=
space"><span style=3D"white-space:pre">	</span> * inmate&#39;s stack, so al=
loc() can allocate more than 1 MB. */</font></div><div><font face=3D"courie=
r new, monospace"><span style=3D"white-space:pre">	</span>heap_pos =3D MGH_=
HEAP_BASE;</font></div><div><font face=3D"courier new, monospace">}</font><=
/div></div><div><br></div><div><a href=3D"https://github.com/hintron/jailho=
use/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-dem=
o.c#L113-L114">https://github.com/hintron/jailhouse/blob/05824b901ce714c7a6=
1770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c#L113-L114</a><br></div>=
<div><a href=3D"https://github.com/hintron/jailhouse/blob/05824b901ce714c7a=
61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c#L930-L943">https://git=
hub.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inm=
ates/demos/x86/mgh-demo.c#L930-L943</a>.</div><div><br></div><div>I have tr=
ied using both my &#39;heap&#39; memory region (with programmatically-gener=
ated input) as well as using input passed into the=C2=A0<a href=3D"https://=
github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/=
configs/x86/bazooka-inmate.c#L79-L89">IVSHMEM shared memory region</a>, wit=
h the same results.<br></div><div><br></div><div>Maybe there is something w=
rong with the memory paging that is making things a lot slower than expecte=
d, like you implied. Maybe regular Linux has a faster way of setting up pag=
ing/memory.<br></div><div><br></div><div>In your last response, you said th=
is:</div><div><br></div><div>&quot;For the inmate itself the pagetable is c=
onstructed by the mapping<br>library. The code looks like it tries to do hu=
ge pages, make sure the<br>call map_range just once with your full memory r=
ange. Aligned and maybe<br>more than you actually need. Consider putting a =
few printfs into the<br>mapping code to see which path (page-size) it goes.=
&quot;<br></div><div><br></div><div>Could you explain the following suggest=
ion a bit more?: &quot;make sure the call map_range just once with your ful=
l memory range.&quot; It looks like mgh-demo.c calls map_range twice: once =
in=C2=A0map_shmem_and_bars() (from your original IVSHMEM demo code, which I=
 based this off of), and then in expand_memory() as shown above. Are you sa=
ying I should combine those into one single call?</div><div><br></div><div>=
Also, can you explain this: &quot;Aligned and maybe more than you actually =
need. Consider putting a few printfs into the mapping code to see which pat=
h (page-size) it goes.&quot; I&#39;m not sure what I should be looking for =
inside map_range(). What do you mean by &quot;which path (page-size) it goe=
s,&quot; exactly? What&#39;s the code path?</div><div><br></div><div>Sorry =
for the bother. I really need to understand why this is happening, because =
this discrepancy completely overshadows my other slightly-positive timing r=
esults in my research. Any help is greatly appreciated.<br></div><div><br><=
/div><div>Thanks,</div><div>Michael=C2=A0=C2=A0</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/96056326-0700-4779-b1b8-3b0df7134a73%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/96056326-0700-4779-b1b8-3b0df7134a73%40googlegroups.com<=
/a>.<br />

------=_Part_1892_1076642110.1581015629608--

------=_Part_1891_1372169074.1581015629607--
