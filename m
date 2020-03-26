Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBBOQ6DZQKGQEEMPAGOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DE193735
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Mar 2020 04:56:54 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id e10sf2346564wru.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 20:56:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585195014; cv=pass;
        d=google.com; s=arc-20160816;
        b=AXSoM2OB2bhfkguji9or23WZFTIdrV4A2NDxOLtbGr2KboS4RFIw1oCJPSeG2CLn4m
         dbQYdis3qlwHu/SaPmhgtAlXJ+wfma8QUvzTbjwPfqXfgmHMn1PoLMvRXU2xZo+JJeD/
         VUL9XaTPanjhhpsKwP9+1Gzjh44lEOxBxk1SMiMDggLrmexOgXCBtv5dMhYxU0VkJJAK
         +3Jaa8DPIx7OclAjVlbdmDev6fm+jEtxzpbe75Am1HUfzn1+9B8SnV4qJIqSQLHbEvmv
         bnjfshsbeAyUk816FKg2ywJxUhoxuibIDQYZDMnofp79519nZi7mcRQ3gfbKgvvmkVvJ
         jmMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=kYQ7SvDnWw2RB8Pu5WOci8//Wc2xm0lMS6vLGvOUA0s=;
        b=KoxwATy2XM+cAl0sLwFBdxIpzl49dT9p4x36zNBG6gHBIlWh1sK/UwBLM4kcBsD0Y8
         V9Lrvv5LCg4XB4uavBbmsdj3DY8qHHz+JJNIrfE9sBsD/yaNPHIAZt+mCFb4emifIKba
         38fBm/8UiiKhLB5CSn7apRgcFxr+6EFA7LrI/RhkTvKzYZtLkxoQN00Q3EXHCyrqsNRT
         btxzjdGwvdGc9KhvTET8TjAhjej7DtuDZC/zNjkcmQiCLdw+XbzA7m/tw7FM4uk2JWOz
         Wo121SrHGiYVQTMSypGBWs6oNuREx04ZL3jy55oDVb2ZT2sB8sd27hRqHMUlwSnQ8xX/
         w0Yw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HG+sj6x8;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::529 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kYQ7SvDnWw2RB8Pu5WOci8//Wc2xm0lMS6vLGvOUA0s=;
        b=NH8HwN0QPIY/VjD8ekiIqdqXqNbHRQu2HUpbGJ11j/Dn4gT/Bg7bQChP/QjuGQSb8t
         hLA+/N32M4u+DXQor96LPsaKv2HEv1zRku9Gaa6+XS72j6DbUMV6NXue8lTdrNEopbqs
         KgcIziY9TBSB8eCYtF6pJxxjiVCBi0BN8jfEnFweEpNcj/fr75sw63/3/fvBAeqmd2cI
         miX3Ppn6y2sqK+Tyn3ierd/TGZZ6gnEZTu7kqNVoxri9ihjPaiwNykgNWVuWCqkgGCjU
         /1Ir8SO/Ijbw4RkzuaF9H71YdL6HrKF64PNMXDzLp9Ue2yfpz9jBjd5EAWExkquSDvi1
         QwzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kYQ7SvDnWw2RB8Pu5WOci8//Wc2xm0lMS6vLGvOUA0s=;
        b=l5gNr2jUZ0Ly+4ea8U/ki0Yd4zbfk20dXxUvGxzWOxfnWqbwMwGXoFkl3S1ptSoG4J
         T9RnmYKtsVXj34DHpqASAFP83lzmVFSao1oz9RkgLS2e0pHvTnSQjaEBxJg7bZaQJEGl
         kM5Tn5ltM5SvNFyXjNzXhexYcjBjZdFEo4EFVCQZxcE5P/8TVM52zrLDw1NiQTsZ7vPY
         baEvnyh5ny/pH5wV4aQBD+3mKDz6mmKJrL3k5ZliCPcp+SYI3grOaR8D6xi1b0Cqx225
         Ukk0iF3rozjJlEw1q7poIsMMQ87GYAI7jO2BWj6MydUxU63DobCsYP+D5kZJo6WYAO/4
         oQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kYQ7SvDnWw2RB8Pu5WOci8//Wc2xm0lMS6vLGvOUA0s=;
        b=EFWMpBxtYxoOQtYgAkBlRDnWOq01vvMcxxk5zM9vQLXyR5u8lzGEZ8IfyUMPbSFIWy
         mzUZx5S0aQiAWRolCQcvQPvDuswhAAgXC7oa5w078gLLlKLxOU8qbxDJIy9qt71vHKq+
         jtxvVUR56wJaEmwcnNpnPp8P50hWJNZSnxU8UY6lIPEyw+YOKNNxKSUfPC2lxw22xDRw
         efnj/YhQHdcxM8Tx4BEOl9YQ5dIl3yvMbQuB/XBfPuroiExdhT0QlVny/idq6tnKrGvG
         Fo7r161eTxNf9QYPiAj/F5aXdMEWQv66sGrRRlbOOTGMhUJTx22MA66naTZVmLIEqzb9
         yENQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1cjr9ecg0TYEE0FQp6MFJRLsO1RZDQOBSDYPHCyECMfZzKMgfE
	0J6TZ3axxVdgqp2GDb26tYg=
X-Google-Smtp-Source: ADFU+vvsEStoxOAebsC15cUcwi2LiMzR2OiUtbMnwYDp+Kjr/Y/hz9Ruew7/q573IGpDVL0iU7vycQ==
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr891853wmj.117.1585195014132;
        Wed, 25 Mar 2020 20:56:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:afd4:: with SMTP id y20ls1920093wrd.5.gmail; Wed, 25 Mar
 2020 20:56:53 -0700 (PDT)
X-Received: by 2002:a5d:414f:: with SMTP id c15mr7551457wrq.60.1585195013385;
        Wed, 25 Mar 2020 20:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585195013; cv=none;
        d=google.com; s=arc-20160816;
        b=R+x9PL5raG1VCFuxhgUIlUc2c1Em5kD2ZbNB+9hOfuFSa7GfUP/qyzxHyWTF7C6zQZ
         cwofUkb4jhutBnps+cuK6SEvM/0nOnnHGg4z5h80f6Dij3jHZZh4YTIKfNHZsXHXsyAm
         HcRqJcCF4MSxiqTsSdHX1zur7p6oFwOMSPCpal7aj929BYY5tkm2oT93TNkbqmtWaRAl
         Q/BEJEkBMaDwfUI9GJ359Nhwce6wCo13c0MDEk0pSsNrKIt4a3PEigMV0nICkUKkpR4E
         mOTP4tIzZhg/kDGsxxMtwizKSwfhIBPw0YFNGb6OlaJhSSkq+e5GJFxNIyd1O3cs3GSG
         Ey5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y7Ufwgszfm4lLWSeTtGu16/79DnuWJrwRQez+pSNwYQ=;
        b=H2s92JqowVCMMC1cBUdbQGaXnXwZqJ5MDqnGAT9QpHs9MQX8FxuEuYNeD+5ZVbW2z8
         zaLoUJtdUVhEJWydYi9yYmd8VlT8uKarOIqcs2NPqISztndjxANTjXkSv8qhZD7TzFyC
         5bemDdMIOZby8nleH7+heVOa9yf2M/Z2aduYL8ZTdBJd7zEAQxju3c+S7P0hsiOHmUBJ
         GdZa9Uorc8HOXHoYdejkZAAQAkylL48Jxfxg2O15epyZlrD1j0LeeRCLukNBaj5IhgJw
         1OD6hvD6Ic7cAlLY6h6J3kXTP0/nJRkd48Jtc3V5HAzmJevIijUVR2fA/sAVE7QVpkXH
         pYJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HG+sj6x8;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::529 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com. [2a00:1450:4864:20::529])
        by gmr-mx.google.com with ESMTPS id i22si79321wml.0.2020.03.25.20.56.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 20:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::529 as permitted sender) client-ip=2a00:1450:4864:20::529;
Received: by mail-ed1-x529.google.com with SMTP id de14so5336248edb.4
        for <jailhouse-dev@googlegroups.com>; Wed, 25 Mar 2020 20:56:53 -0700 (PDT)
X-Received: by 2002:aa7:dccd:: with SMTP id w13mr5108753edu.94.1585195013205;
 Wed, 25 Mar 2020 20:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com> <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
In-Reply-To: <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
From: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Date: Wed, 25 Mar 2020 22:56:33 -0500
Message-ID: <CAD6ScS_-vOfAATpOTUo8=3nm+9HiATujaG0rDVBf4dp1HyJ9CA@mail.gmail.com>
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse Hypervisor
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	"libvir-list@redhat.com" <libvir-list@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a9723e05a1b9f903"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=HG+sj6x8;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::529 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
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

--000000000000a9723e05a1b9f903
Content-Type: text/plain; charset="UTF-8"

Hi All,

Gentle Reminder,
Please have a look at my email below. It would be great if anyone can help
me with this project.

Thanks & Regards,
Prakhar Bansal
Graduate Student' 20, Computer Engineering
Iowa State University, Ames, IA


On Tue, Mar 24, 2020 at 11:36 PM PRAKHAR BANSAL <prakharbansal0910@gmail.com>
wrote:

> Hi Jan,
>
> Thanks for the reply. I looked deeper into the libvirt and Jailhouse
> source code and found following two things that seem relevant to the
> project I am interested in.
>
> - Libvirt driver interface at [libvirt.git]
> <https://libvirt.org/git/?p=libvirt.git;a=tree;hb=HEAD> / src
> <https://libvirt.org/git/?p=libvirt.git;a=tree;f=src;hb=HEAD> / driver.h
> <https://libvirt.org/git/?p=libvirt.git;a=blob_plain;f=src/driver.h;hb=HEAD>
> - Jailhouse tool, which is using the ioctl API of the Jailhouse, available
> at https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.
>
> With the help of the above two, it looks like, a libvirt driver for the
> Jailhouse can be implemented. Let me know if I am moving in the right
> direction so far.
>
> I have been looking at the other libvirt driver implementations for
> hypervisors like HyperV and VMware to understand their implementation and
> learn from there.
>
> Thanks & Regards,
>
> Prakhar Bansal
> Graduate Student' 20, Computer Engineering
> Iowa State University, Ames, IA
>
>
>
>
>
> On Mon, Mar 23, 2020 at 3:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
>> Hi Prakhar,
>>
>> On 23.03.20 07:53, PRAKHAR BANSAL wrote:
>> > Hello All,
>> >
>> > My name is Prakhar Bansal and I am a graduate student in Computer
>> > Engineering at Iowa State University, US.
>> > I have experience with Analysing Performance of Applications running
>> > inside multiple virtual machines hosted by the libvirt QEMU-KVM through
>> > virt-manager.
>> >
>> > I am interested in working on the project to develop a Libvirt driver
>> > for the Jailhouse hypervisor. I looked into the initial attempt on the
>> > Jailhouse driver which seems to be based on the Jailhouse command-line
>> > interface. I am currently looking into learning and understanding the
>> > kernel APIs for jailhouse hypervisor.
>>
>> Thanks for your interest!
>>
>> > I followed the below articles mentioned by Valentine Sinitsyn to begin
>> > learning about the Jailhouse hypervisor.
>> >
>> > https://lwn.net/Articles/578295/
>> > https://lwn.net/Articles/578852/
>> >
>> > I have a few questions regarding this project, please let me know if
>> > someone can help me out.
>>
>> Sure, go ahead. Depending on the scope of the question, libvirt might be
>> the better community to ask. Therefore, I'm adding its list to this
>> thread.
>>
>> Jan
>>
>> >
>> > Thanks & Regards,
>> > Prakhar Bansal
>> >
>>
>> --
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS_-vOfAATpOTUo8%3D3nm%2B9HiATujaG0rDVBf4dp1HyJ9CA%40mail.gmail.com.

--000000000000a9723e05a1b9f903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi All,<div><br></div><d=
iv>Gentle Reminder,</div><div>Please have a look at my email below. It woul=
d be great if anyone=C2=A0can help me with this project.</div><div><br></di=
v><div>Thanks &amp; Regards,</div><div>Prakhar Bansal</div><div><div style=
=3D"color:rgb(0,0,0)">Graduate Student&#39; 20, Computer Engineering</div><=
div style=3D"color:rgb(0,0,0)">Iowa=C2=A0State University, Ames, IA</div></=
div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Mar 24, 2020 at 11:36 PM PRAKHAR BANSAL &lt;<a h=
ref=3D"mailto:prakharbansal0910@gmail.com">prakharbansal0910@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr">Hi Jan,<div><br></div><div>Thanks for the reply. I l=
ooked deeper into the libvirt and Jailhouse source code and found following=
 two things that seem relevant to the project I am interested in.</div><div=
><br></div><div>- Libvirt driver interface at=C2=A0<a title=3D"tree root" h=
ref=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3DHEAD" style=
=3D"color:rgb(136,0,0);font-family:sans-serif;font-weight:bold" target=3D"_=
blank">[libvirt.git]</a><span style=3D"color:rgb(0,0,0);font-family:sans-se=
rif;font-weight:bold">=C2=A0/=C2=A0</span><a title=3D"src" href=3D"https://=
libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD" style=3D"color=
:rgb(136,0,0);font-family:sans-serif;font-weight:bold" target=3D"_blank">sr=
c</a><span style=3D"color:rgb(0,0,0);font-family:sans-serif;font-weight:bol=
d">=C2=A0/=C2=A0</span><a title=3D"src/driver.h" href=3D"https://libvirt.or=
g/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Dsrc/driver.h;hb=3DHEAD" style=3D"=
color:rgb(136,0,0);font-family:sans-serif;font-weight:bold" target=3D"_blan=
k">driver.h</a></div><div>- Jailhouse tool, which is using the ioctl API of=
 the Jailhouse, available at=C2=A0<a href=3D"https://github.com/siemens/jai=
lhouse/blob/master/tools/jailhouse.c" target=3D"_blank">https://github.com/=
siemens/jailhouse/blob/master/tools/jailhouse.c</a>.</div><div><br></div><d=
iv>With the help of the above two, it looks like, a libvirt driver for the =
Jailhouse can be implemented. Let me know if I am moving in the right direc=
tion so far.</div><div><br></div><div>I have been looking at the other libv=
irt driver implementations for hypervisors like HyperV and VMware to unders=
tand their implementation and learn from there.</div><div><br></div><div>Th=
anks &amp;=C2=A0Regards,</div><div><br></div><div>Prakhar Bansal</div><div>=
Graduate Student&#39; 20, Computer Engineering</div><div>Iowa=C2=A0State Un=
iversity, Ames, IA</div><div></div><div><br></div><div><br></div><div><br><=
/div><div><br></div></div></div></div></div></div></div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2=
3, 2020 at 3:07 AM Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com"=
 target=3D"_blank">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-le=
ft:1ex">Hi Prakhar,<br>
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
</blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS_-vOfAATpOTUo8%3D3nm%2B9HiATujaG0rDVBf4dp1H=
yJ9CA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAD6ScS_-vOfAATpOTUo8%3D3nm%2B9HiATujaG=
0rDVBf4dp1HyJ9CA%40mail.gmail.com</a>.<br />

--000000000000a9723e05a1b9f903--
