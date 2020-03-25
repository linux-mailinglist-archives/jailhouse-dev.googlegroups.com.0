Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBW575PZQKGQEGVHYMWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB1192030
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 05:36:44 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id ce13sf1118654edb.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Mar 2020 21:36:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585111003; cv=pass;
        d=google.com; s=arc-20160816;
        b=y17t2vHjLk2mS/zky9LrvJd0VQ3mXeP+tMO1z0z7YtuIYdnzBgbzUuMAtgtREB4o+B
         W6jGDYD0LnCjUKxRsDP4VXTf4vvx1T+UvZiC876ZwNQm9XY4l480jhYoe9RI144UAyOH
         3hb3IGbJLEYHgSykg9SzpltmbDAJWJGL4esqF1R9/ZDnK/JezakLdvIKDv2CKN3O6nAl
         B8tNL93NRDTiV/o6GqqGa8cKGGIwDhcZUYtDDbF460ffcacZZL4ffLHM4g2fHDfjzaQi
         8Bj8CQ8NvUVzhaKch+eJ/kXkUwlm0AdLkdY9HM2Mr0P1m4qj9aU9MjF/ZMmPyLrFSHQy
         VJPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=lHa9peF4XoN3cILOyjkL1H+TOmlkkBI6+6iyB/orHss=;
        b=xTYek682KTLRRvXOVLN5CK3bwZZPff36IfT8TBP7c3UA4KgPGRCuRWll08sKmlra5f
         QYu6HoIyeFeMqFgn8/bZWpOjnLNaCulHLzPlb1cVhc5qhEtn0yF6UYjDINkxcou9B3hC
         Yv0ivzppIUVEUlQUkLObwFpRrxSMizUbxGEaDkvMpAC/mPMbj/umGiRdPUiZGaq0sG5z
         KUyhbd0YuY8Ui11HgqSQFsJKIHIj0Yq9GEgIGF+G+bmA8fYuBVagePsXdZmB7DWFnnl2
         i9HvgxUPB68g9uatojoAo5BaZ1mAQwijztBXw2sPITOU2PWoUuXQ3VRoHvYq6muzKzq9
         Yv9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PiugzTdl;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lHa9peF4XoN3cILOyjkL1H+TOmlkkBI6+6iyB/orHss=;
        b=pwKBD0UnbWuIuH/qsQvQptaVfqTPn3M9KXLwPPWpxmURSagQ0hFNABGzRC26JEo3kL
         etKdUGksgqir6VvqeYDXQMsk7l8tONocZPxBwGaVYBSeizNXykI95Du9xIZc3NCpJr1F
         qUwuMbnKWFOKK+iqbi/2A7p0echs7zj9pT5NttOmRfTutvi5fE6ksbpUbqq5bdht55aD
         mTjq3lLGc0qxUeMYKscm8z0lx4FbKi6MzbLxbUlYb1sltwNzahjvBpOC/VXD5jdbou3O
         g8fziWfB9wsyMkgCKIC3VS8v8ZW4s/VsXs8VSjg9YkJIPJdjyOwLlYZilTaRIwVKc6Ny
         24yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lHa9peF4XoN3cILOyjkL1H+TOmlkkBI6+6iyB/orHss=;
        b=p2O4FTWXAK4jcEF6MA5wAs4PRQLE98HbD5mgYPkLFC6JOhjsT0EB2uRPwALVMSuFB8
         5zty0VxVkrFWi1pVsiaCv3jVYYb0GaHji2ZrDCy/DoeJp6UBIY4G7pO1LnWJ22dFfP+U
         nFWOVZaU9b4YpEXsr8/jDNtJl9Lk2QwvimooEpOousgwZg/pHFyzghvZbsUYoyHoKMol
         QlmMIc5aBkufHLMeDWbuZ8vtvng3RYvqufRr2MDgkP6yy6JIWvELObMKCYv2/VXUHbjO
         YaL2N42vh5zhjKu+zoqUk7Q+Mg0nJD6v2nnPVZMjCTlQQBsV//Dnn0xSo2r+NSW/FtZk
         sM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lHa9peF4XoN3cILOyjkL1H+TOmlkkBI6+6iyB/orHss=;
        b=R3HvdXJTQJ0mIVze7L5DwoFb2KhGk6t7aWZiBPF/snH/xaSNFtq1Iu2AaeHUDPG5Ox
         cxwcjFDO6Ut6XBpHXatVGTupWwZDIXUpOPXB1AUpWWC45K27OPSMYlyO6Tt3elztBkZ+
         BJSKBp7Egnc51uNIc4ZteRmW04dIUDgBPkAzLZo2JsCutNdHjIk4G3MpUEIN/eTtG/wJ
         O/EWChbAIUFv/Ix/XTAUUgEf9oqUnbjoQmr+pjEt3Va1aqNNMckznGSsNWkwGifwq/Cb
         TPuQXnSQyKEro0fpvQWrzOLcXXDTFdnChjNsaRLUECKjouwY0Ypf5vv+/H6Q1Sa2K7wo
         k8UQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1cDPInyXvKA8DUhCaqQD1O74lRTXAK1MUbwtw3nqtmFyAKsa4c
	WaGpTADdFgjHAM4FT4tiJPU=
X-Google-Smtp-Source: ADFU+vs/z7gRj1KItLwB7npFTFsGxTfJ90m00M3Zc7hjtksuEOUO6xASDRzJYuOa6VSmCQT0VJeVFA==
X-Received: by 2002:a50:e70a:: with SMTP id a10mr1083968edn.364.1585111003739;
        Tue, 24 Mar 2020 21:36:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a985:: with SMTP id jr5ls483314ejb.10.gmail; Tue, 24
 Mar 2020 21:36:43 -0700 (PDT)
X-Received: by 2002:a17:906:cc2:: with SMTP id l2mr1567102ejh.115.1585111003148;
        Tue, 24 Mar 2020 21:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585111003; cv=none;
        d=google.com; s=arc-20160816;
        b=JhXc1lknJSxAoI/I54FmqwKjz+tZSbWf6SkOE9uhWZMrx10Dth5k15fjNTfmeFzZx1
         L05EWxdVW7uBBc4Qzy+CSSC5JhDczhC1ZScPMDkUAvC9ddWRCPxlagVDL4xrwAxcNLlj
         6A+f8FLMzDqowF5bM2ago7kJd+C0bdNfmST5pATLGJW4mPCKI9ORNmpO8pK2eNl0gh9X
         OPSJllKnqRBH3gkdomwoAc/HTJzglDu54qc4UC/ujeeExZE9bEJRlCzUjl81AAX7ryVY
         3/YXoFICLOTYKmYE+b4KUjzyoMISjV5Bay6bBOjYkHzXPWGyfVVQObYRUUNqlQJcs89r
         TRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lxWZPUAqtxBau6hRfUT3TBtGdG75HP3P36fd3NAls2M=;
        b=LEBtnJSh6CxR6Pxch/28YYzmqEOxMxPbn9P8tkb23Pncbyn9FDTKTjIj3+CC95qJlz
         RJs1fPGW4w5nyxZDyQnBI4r65Dx8vi2KwbMtRPI9/RjAUTjnyk+DRKBWztOui01E/cQv
         XvMSlVQJiGYq742NH9/yY+fajwORofBs97nbZEUTSRc0XGNa++XGsZkyGZ915Ob27weO
         gHgB2cFq+eWzS+XaHQxibDLp1HEI9heM+dNHO3KJvZX7VXymfiBQPZVwqHuo6YK9eg6t
         Ol8rXFaXs1ae6rcGPi2tuODwjnQzVlk0NTep+Dj7CeK/KBN3/CslqKs19YqLEUboLxHP
         qVEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PiugzTdl;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com. [2a00:1450:4864:20::52c])
        by gmr-mx.google.com with ESMTPS id w13si119867edv.2.2020.03.24.21.36.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 21:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) client-ip=2a00:1450:4864:20::52c;
Received: by mail-ed1-x52c.google.com with SMTP id de14so895151edb.4
        for <jailhouse-dev@googlegroups.com>; Tue, 24 Mar 2020 21:36:43 -0700 (PDT)
X-Received: by 2002:a50:d308:: with SMTP id g8mr1149405edh.88.1585111002885;
 Tue, 24 Mar 2020 21:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com>
In-Reply-To: <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com>
From: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Date: Tue, 24 Mar 2020 23:36:21 -0500
Message-ID: <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse Hypervisor
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	"libvir-list@redhat.com" <libvir-list@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041b11105a1a66a9b"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=PiugzTdl;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000041b11105a1a66a9b
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Thanks for the reply. I looked deeper into the libvirt and Jailhouse source
code and found following two things that seem relevant to the project I am
interested in.

- Libvirt driver interface at [libvirt.git]
<https://libvirt.org/git/?p=libvirt.git;a=tree;hb=HEAD> / src
<https://libvirt.org/git/?p=libvirt.git;a=tree;f=src;hb=HEAD> / driver.h
<https://libvirt.org/git/?p=libvirt.git;a=blob_plain;f=src/driver.h;hb=HEAD>
- Jailhouse tool, which is using the ioctl API of the Jailhouse, available
at https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.

With the help of the above two, it looks like, a libvirt driver for the
Jailhouse can be implemented. Let me know if I am moving in the right
direction so far.

I have been looking at the other libvirt driver implementations for
hypervisors like HyperV and VMware to understand their implementation and
learn from there.

Thanks & Regards,

Prakhar Bansal
Graduate Student' 20, Computer Engineering
Iowa State University, Ames, IA





On Mon, Mar 23, 2020 at 3:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> Hi Prakhar,
>
> On 23.03.20 07:53, PRAKHAR BANSAL wrote:
> > Hello All,
> >
> > My name is Prakhar Bansal and I am a graduate student in Computer
> > Engineering at Iowa State University, US.
> > I have experience with Analysing Performance of Applications running
> > inside multiple virtual machines hosted by the libvirt QEMU-KVM through
> > virt-manager.
> >
> > I am interested in working on the project to develop a Libvirt driver
> > for the Jailhouse hypervisor. I looked into the initial attempt on the
> > Jailhouse driver which seems to be based on the Jailhouse command-line
> > interface. I am currently looking into learning and understanding the
> > kernel APIs for jailhouse hypervisor.
>
> Thanks for your interest!
>
> > I followed the below articles mentioned by Valentine Sinitsyn to begin
> > learning about the Jailhouse hypervisor.
> >
> > https://lwn.net/Articles/578295/
> > https://lwn.net/Articles/578852/
> >
> > I have a few questions regarding this project, please let me know if
> > someone can help me out.
>
> Sure, go ahead. Depending on the scope of the question, libvirt might be
> the better community to ask. Therefore, I'm adding its list to this thread.
>
> Jan
>
> >
> > Thanks & Regards,
> > Prakhar Bansal
> >
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS86TxG7yk%3DEzQWV1UiAiEnJaJxWar6Bi4yzbBW%2BSo9hKA%40mail.gmail.com.

--00000000000041b11105a1a66a9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Jan,<div><b=
r></div><div>Thanks for the reply. I looked deeper into the libvirt and Jai=
lhouse source code and found following two things that seem relevant to the=
 project I am interested in.</div><div><br></div><div>- Libvirt driver inte=
rface at=C2=A0<a title=3D"tree root" href=3D"https://libvirt.org/git/?p=3Dl=
ibvirt.git;a=3Dtree;hb=3DHEAD" style=3D"color:rgb(136,0,0);font-family:sans=
-serif;font-weight:bold">[libvirt.git]</a><span style=3D"color:rgb(0,0,0);f=
ont-family:sans-serif;font-weight:bold">=C2=A0/=C2=A0</span><a title=3D"src=
" href=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHE=
AD" style=3D"color:rgb(136,0,0);font-family:sans-serif;font-weight:bold">sr=
c</a><span style=3D"color:rgb(0,0,0);font-family:sans-serif;font-weight:bol=
d">=C2=A0/=C2=A0</span><a title=3D"src/driver.h" href=3D"https://libvirt.or=
g/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Dsrc/driver.h;hb=3DHEAD" style=3D"=
color:rgb(136,0,0);font-family:sans-serif;font-weight:bold">driver.h</a></d=
iv><div>- Jailhouse tool, which is using the ioctl API of the Jailhouse, av=
ailable at=C2=A0<a href=3D"https://github.com/siemens/jailhouse/blob/master=
/tools/jailhouse.c">https://github.com/siemens/jailhouse/blob/master/tools/=
jailhouse.c</a>.</div><div><br></div><div>With the help of the above two, i=
t looks like, a libvirt driver for the Jailhouse can be implemented. Let me=
 know if I am moving in the right direction so far.</div><div><br></div><di=
v>I have been looking at the other libvirt driver implementations for hyper=
visors like HyperV and VMware to understand their implementation and learn =
from there.</div><div><br></div><div>Thanks &amp;=C2=A0Regards,</div><div><=
br></div><div>Prakhar Bansal</div><div>Graduate Student&#39; 20, Computer E=
ngineering</div><div>Iowa=C2=A0State University, Ames, IA</div><div></div><=
div><br></div><div><br></div><div><br></div><div><br></div></div></div></di=
v></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Mar 23, 2020 at 3:07 AM Jan Kiszka &lt;<a=
 href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">Hi Prakhar,<br>
<br>
On 23.03.20 07:53, PRAKHAR BANSAL wrote:<br>
&gt; Hello All,<br>
&gt; <br>
&gt; My name is Prakhar Bansal and I am a graduate=C2=A0student in Computer=
 <br>
&gt; Engineering at Iowa State University, US.<br>
&gt; I have experience with Analysing Performance of Applications running <=
br>
&gt; inside multiple virtual machines hosted by the libvirt QEMU-KVM throug=
h <br>
&gt; virt-manager.<br>
&gt; <br>
&gt; I am interested in working on the project to develop a Libvirt driver =
<br>
&gt; for the Jailhouse hypervisor. I looked into the initial attempt on the=
 <br>
&gt; Jailhouse driver which seems to be based on the Jailhouse command-line=
 <br>
&gt; interface. I am currently looking into learning and understanding the =
<br>
&gt; kernel APIs for jailhouse hypervisor.<br>
<br>
Thanks for your interest!<br>
<br>
&gt; I followed the below articles mentioned by Valentine Sinitsyn to begin=
 <br>
&gt; learning about the Jailhouse hypervisor.<br>
&gt; <br>
&gt; <a href=3D"https://lwn.net/Articles/578295/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/578295/</a><br>
&gt; <a href=3D"https://lwn.net/Articles/578852/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/578852/</a><br>
&gt; <br>
&gt; I have a few questions regarding this project, please let me know if <=
br>
&gt; someone can help me out.<br>
<br>
Sure, go ahead. Depending on the scope of the question, libvirt might be <b=
r>
the better community to ask. Therefore, I&#39;m adding its list to this thr=
ead.<br>
<br>
Jan<br>
<br>
&gt; <br>
&gt; Thanks &amp; Regards,<br>
&gt; Prakhar Bansal<br>
&gt; <br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS86TxG7yk%3DEzQWV1UiAiEnJaJxWar6Bi4yzbBW%2BS=
o9hKA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAD6ScS86TxG7yk%3DEzQWV1UiAiEnJaJxWar6B=
i4yzbBW%2BSo9hKA%40mail.gmail.com</a>.<br />

--00000000000041b11105a1a66a9b--
