Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBHEJ43WQKGQEQO4MAAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F67E9BA4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 13:39:57 +0100 (CET)
Received: by mail-ot1-x339.google.com with SMTP id s1sf1001173oth.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5evYjAMN45jwMcN2RSXmoPvZ1SFXtE+qY9JzUxvuFFk=;
        b=oJjNp6lynXJfjADlLimLYYNa3aFW+KnMhlqzE/HBsonKifySs+j25NG6mfuVtqy/0h
         rQDApZcWJ5Qx/wItLpm0sc+qXSKtBXz66k2iCwE/OM7kPmWzQKOhOGcR/TQlnjIeraBK
         lI8172gSzJyRNJjQb6gRYQox28WSZrmjFtY7UZLPHr9z5KcwNlDgxym3y2ZbYr6krJEr
         0IGQ61lHnSNllNyb7daCDo0lDwdi1w5Xp4zXpLgEciXItcZJgIdFSWbJBgyLliSz6XuB
         1ME5EnXgfTgczKK+h4WYHglR63J9UWpmrw8KSuYxgqNYS8qmSn7nYQk9ufKQsIakQlsM
         Vb1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5evYjAMN45jwMcN2RSXmoPvZ1SFXtE+qY9JzUxvuFFk=;
        b=lKkLCwI7u0oA2vqJWbeiSUaCCikQULU62XIG48Ul0gfdGWHO2eiiw0qo2ZWQHJYfin
         NeCLNl8igzH8L9aSXvjf5Z6tCrggYbTo4S+ZMWplz8NuN48PHfFf6wKyfJdS7kbhCxB5
         w0oXqGQliql2WqPye5184MAca/aW28uGsUPtrhuDv8GzskB1Ns5j7nnQyhUv6sd2pYha
         UuNq5qEaImNTH0LevQzBLj4vAXItQTndcK/072zP1QsfJbJxSZNIEGb6cbzAhFkfYXBK
         oGtQ5AQ8j4HxleXKgGru4YS6AAWu550vFibzVSuX5Vu7qsyaCe6L3a3fYGt1OHZdbYfZ
         BoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5evYjAMN45jwMcN2RSXmoPvZ1SFXtE+qY9JzUxvuFFk=;
        b=dJSk2H1rPdACpzN2CqIjIQICKx7Vt4V6REbs61yMyxtao8+yvO9AhRBs7eXfzETtOf
         NHNe+B4e+mf++35dgqfqT+44QpsbhqX5swSoRCnSmeeFY+BMj99KDHPT21A4sGKWpYb7
         NqAT1qWopbiwJfti703ebxmbjBvcgr5cwsF6Lue7jBGDuDX+xNGeA0lbJVe6yEugwuyc
         ioYr8sZLIGRe8ighSVtva/J0jA4b+znYfyFXMwk3vs7JRtEzfJ4uLYbvVRhTuSyrY7Wg
         bSSe01aoPxexCnes8jZDg5uGQj0NhUUqtCZTKCA0L82AH1h8xG+VsrPStj1NPErlAo9T
         QHTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXgLycjiQRTHQ1zIDJMV/r/i8Hkqs6w7cJGAieXpJerwKbw9gaM
	TeTBHwLb08CZ8u/D67syIHI=
X-Google-Smtp-Source: APXvYqxzST1TRBGVZdSisD9xchsDoLvPctAjX4MJrnPlzqnbKYXLtqaHSwiUeFUrNF5WDlfOlOm1nA==
X-Received: by 2002:aca:3846:: with SMTP id f67mr8641189oia.71.1572439196328;
        Wed, 30 Oct 2019 05:39:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7483:: with SMTP id t3ls1739783otk.2.gmail; Wed, 30 Oct
 2019 05:39:55 -0700 (PDT)
X-Received: by 2002:a9d:a44:: with SMTP id 62mr14139870otg.111.1572439195633;
        Wed, 30 Oct 2019 05:39:55 -0700 (PDT)
Date: Wed, 30 Oct 2019 05:39:54 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3487548d-b0bb-4d32-b88f-d6d97b449510@googlegroups.com>
In-Reply-To: <a132b6de-0483-4e2f-a5e8-56d8ed4eaae5@googlegroups.com>
References: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
 <20190528210147.6dd80c1d@md1za8fc.ad001.siemens.net>
 <ac030e22-9a4e-47b8-8c94-5e2866a80ae2@googlegroups.com>
 <a132b6de-0483-4e2f-a5e8-56d8ed4eaae5@googlegroups.com>
Subject: Re: Ivshmem-demo interrupt
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1570_2028828389.1572439194922"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_1570_2028828389.1572439194922
Content-Type: multipart/alternative; 
	boundary="----=_Part_1571_1817834241.1572439194923"

------=_Part_1571_1817834241.1572439194923
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jeanne,

Have you solved your issue regarding the /dev/uio0 not appearing?

quarta-feira, 29 de Maio de 2019 =C3=A0s 10:56:52 UTC+1, jeanne....@gmail.c=
om=20
escreveu:
>
> Le mercredi 29 mai 2019 09:42:02 UTC+2, jeanne....@gmail.com a =C3=A9crit=
 :=20
> > Le mardi 28 mai 2019 21:01:52 UTC+2, Henning Schild a =C3=A9crit :=20
> > > Am Tue, 28 May 2019 06:22:05 -0700=20
> > > schrieb <jeanne.***@gmail.com>:=20
> > >=20
> > > > Hello everyone,=20
> > > >=20
> > > > I'm trying to run the ivshmem-demo on a lanner NCA-510A. The inmate=
=20
> > > > cell seems to be working well. However, I can't get the=20
> interruptions=20
> > > > between the cells to work. Is this due to a configuration problem?=
=20
> > > > (You will find attached my configuration files) I explain : when I=
=20
> > > > launch the inmate the shared memory is written but the inmate=20
> doesn't=20
> > > > react to the uio_send and there is nothing to read in the=20
> uio_read...=20
> > >=20
> > > The ivshmem guestcode repo is not tested as well as jailhouse. And=20
> > > together with kernels there are now 3 components to combine. So i=20
> would=20
> > > not be surprised if your problem has to do with that uio linux=20
> example.=20
> > > But it is not horribly broken and should work! The main issue with it=
=20
> > > is that people do not read the docs and check out the wrong branch,=
=20
> > > later use the python code ... which is not tested on jailhouse ...=20
> > >=20
> > > I would suggest two ivshmem-demo cells before you=20
> > > even look at linux+uio. That way you get isvhmem-guestcode out of the=
=20
> > > picture and will start with just jailhouse.=20
> > > Especially since you later want to run linux in another cell anyways.=
=20
> > >=20
> > > > here is my :=20
> > > > grep ivshmem /proc/interrupts=20
> > > >  202:          0          0          0          0          0=20
> > > > 0          0          0          0          0          0=20
> > > > 0          0          0          0          0          0=20
> > > > 0          0          0          0          0          0  IR-PCI-MS=
I=20
> > > > 229376-edge      uio_ivshmem=20
> > > >=20
> > >=20
> > > > Second question: the next step of my project will be to run the=20
> > > > uio_ivshmem driver between two linux cells. Is it possible or is th=
e=20
> > > > driver only for the rootCell?=20
> > >=20
> > > The uio stuff will work in either root or non-root, no problem. That=
=20
> > > is, if it works.=20
> > >=20
> > > Henning=20
> > >=20
> > > > best regards,=20
> > > >=20
> > > > Jeanne=20
> > > >=20
> >=20
> > Hello everyone,=20
> >=20
> >=20
> > First of all, thank you very much for your help!=20
> >=20
> >=20
> >=20
> > I can get two inmates ivshmem-demo to work without any problems with al=
l=20
> the interruptions.=20
> >=20
> >=20
> >=20
> > For the driver uio_ivhsmem I took the jailhouse branch on the git. The=
=20
> file /dev/uio0 pops well and my ivshmem-demo inmate writes well on it.=20
> However, there are still no interruptions...=20
> >=20
> > Here is my lspci -v on my virtual PCI on the rootCell side. Is this goo=
d=20
> ?=20
> >=20
> > lspci -v=20
> > 00:0e.0 Unassigned class [ff00]: Red Hat, Inc Inter-VM shared memory=20
> >         I/O behind bridge: 0000e000-0000efff=20
> >=20
> > Best regards,=20
> >=20
> > Jeanne=20
>
> Hello everyone,=20
>
>
> Now I can get the demo-ivshmem to work with my root cell too (it seems=20
> that removing the.shmem_protocol in the pci_device unlocked the situation=
 I=20
> don't know why).=20
> Now I'm trying to get this driver to work on my inmate linux but when I=
=20
> insert the module I don't have a /dev/uio0 that pop and I don't know why.=
..=20
> any ideas?=20
>
> here is my inmate :=20
>
> # insmod /bin/test/uio_ivshmem.ko=20
> uio_ivshmem: loading out-of-tree module taints kernel.=20
> uio_ivshmem 0000:00:0e.0: enabling device (0000 -> 0002)=20
> # lsmod=20
> Module                  Size  Used by    Tainted: G=20
> uio_ivshmem            16384  0=20
>
> So the module is well loaded and I don't need to modprobe uio because it'=
s=20
> already done in my kernel.=20
>
> Best regards,=20
>
> Jeanne=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3487548d-b0bb-4d32-b88f-d6d97b449510%40googlegroups.com.

------=_Part_1571_1817834241.1572439194923
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Jeanne,<div><br></div><div>Have you solved your issu=
e regarding the /dev/uio0 not appearing?<br><br>quarta-feira, 29 de Maio de=
 2019 =C3=A0s 10:56:52 UTC+1, jeanne....@gmail.com escreveu:<blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #=
ccc solid;padding-left: 1ex;">Le mercredi 29 mai 2019 09:42:02 UTC+2, <a>je=
anne....@gmail.com</a> a =C3=A9crit=C2=A0:
<br>&gt; Le mardi 28 mai 2019 21:01:52 UTC+2, Henning Schild a =C3=A9crit=
=C2=A0:
<br>&gt; &gt; Am Tue, 28 May 2019 06:22:05 -0700
<br>&gt; &gt; schrieb &lt;jeanne.***@<a href=3D"http://gmail.com" target=3D=
"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://gmail.com&=
#39;;return true;" onclick=3D"this.href=3D&#39;http://gmail.com&#39;;return=
 true;">gmail.com</a>&gt;:
<br>&gt; &gt;=20
<br>&gt; &gt; &gt; Hello everyone,=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; I&#39;m trying to run the ivshmem-demo on a lanner NCA-5=
10A. The inmate
<br>&gt; &gt; &gt; cell seems to be working well. However, I can&#39;t get =
the interruptions
<br>&gt; &gt; &gt; between the cells to work. Is this due to a configuratio=
n problem?
<br>&gt; &gt; &gt; (You will find attached my configuration files) I explai=
n : when I
<br>&gt; &gt; &gt; launch the inmate the shared memory is written but the i=
nmate doesn&#39;t
<br>&gt; &gt; &gt; react to the uio_send and there is nothing to read in th=
e uio_read...
<br>&gt; &gt;=20
<br>&gt; &gt; The ivshmem guestcode repo is not tested as well as jailhouse=
. And
<br>&gt; &gt; together with kernels there are now 3 components to combine. =
So i would
<br>&gt; &gt; not be surprised if your problem has to do with that uio linu=
x example.
<br>&gt; &gt; But it is not horribly broken and should work! The main issue=
 with it
<br>&gt; &gt; is that people do not read the docs and check out the wrong b=
ranch,
<br>&gt; &gt; later use the python code ... which is not tested on jailhous=
e ...
<br>&gt; &gt;=20
<br>&gt; &gt; I would suggest two ivshmem-demo cells before you
<br>&gt; &gt; even look at linux+uio. That way you get isvhmem-guestcode ou=
t of the
<br>&gt; &gt; picture and will start with just jailhouse.
<br>&gt; &gt; Especially since you later want to run linux in another cell =
anyways.
<br>&gt; &gt;=20
<br>&gt; &gt; &gt; here is my :
<br>&gt; &gt; &gt; grep ivshmem /proc/interrupts
<br>&gt; &gt; &gt; =C2=A0202: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
<br>&gt; &gt; &gt; 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
<br>&gt; &gt; &gt; 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
<br>&gt; &gt; &gt; 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0IR-PCI-MSI
<br>&gt; &gt; &gt; 229376-edge =C2=A0 =C2=A0 =C2=A0uio_ivshmem
<br>&gt; &gt; &gt;=20
<br>&gt; &gt;=20
<br>&gt; &gt; &gt; Second question: the next step of my project will be to =
run the
<br>&gt; &gt; &gt; uio_ivshmem driver between two linux cells. Is it possib=
le or is the
<br>&gt; &gt; &gt; driver only for the rootCell?=20
<br>&gt; &gt;=20
<br>&gt; &gt; The uio stuff will work in either root or non-root, no proble=
m. That
<br>&gt; &gt; is, if it works.
<br>&gt; &gt;=20
<br>&gt; &gt; Henning
<br>&gt; &gt;=20
<br>&gt; &gt; &gt; best regards,=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Jeanne=20
<br>&gt; &gt; &gt;
<br>&gt;=20
<br>&gt; Hello everyone,=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; First of all, thank you very much for your help!=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; I can get two inmates ivshmem-demo to work without any problems wi=
th all the interruptions.=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; For the driver uio_ivhsmem I took the jailhouse branch on the git.=
 The file /dev/uio0 pops well and my ivshmem-demo inmate writes well on it.=
 However, there are still no interruptions...=20
<br>&gt;=20
<br>&gt; Here is my lspci -v on my virtual PCI on the rootCell side. Is thi=
s good ?=20
<br>&gt;=20
<br>&gt; lspci -v=20
<br>&gt; 00:0e.0 Unassigned class [ff00]: Red Hat, Inc Inter-VM shared memo=
ry
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I/O behind bridge: 0000e000-0000efff
<br>&gt;=20
<br>&gt; Best regards,=20
<br>&gt;=20
<br>&gt; Jeanne
<br>
<br>Hello everyone,=20
<br>
<br>
<br>Now I can get the demo-ivshmem to work with my root cell too (it seems =
that removing the.shmem_protocol in the pci_device unlocked the situation I=
 don&#39;t know why).=20
<br>Now I&#39;m trying to get this driver to work on my inmate linux but wh=
en I insert the module I don&#39;t have a /dev/uio0 that pop and I don&#39;=
t know why... any ideas?
<br>
<br>here is my inmate :=20
<br>
<br># insmod /bin/test/uio_ivshmem.ko
<br>uio_ivshmem: loading out-of-tree module taints kernel.
<br>uio_ivshmem 0000:00:0e.0: enabling device (0000 -&gt; 0002)
<br># lsmod
<br>Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Si=
ze =C2=A0Used by =C2=A0 =C2=A0Tainted: G
<br>uio_ivshmem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384 =C2=A00
<br>
<br>So the module is well loaded and I don&#39;t need to modprobe uio becau=
se it&#39;s already done in my kernel.
<br>
<br>Best regards,=20
<br>
<br>Jeanne </blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3487548d-b0bb-4d32-b88f-d6d97b449510%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/3487548d-b0bb-4d32-b88f-d6d97b449510%40googlegroups.com<=
/a>.<br />

------=_Part_1571_1817834241.1572439194923--

------=_Part_1570_2028828389.1572439194922--
