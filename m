Return-Path: <jailhouse-dev+bncBCV335GORINBBFPIZH2QKGQENYPF5CQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id D90BB1C6B90
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 10:23:49 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id a3sf937164wro.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 01:23:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588753429; cv=pass;
        d=google.com; s=arc-20160816;
        b=NZ862pI5cGH1GJ5mKl0mELCDG9BPCKAU/bfwXF3guXXLzd+RqsdW3zocud2qlrwAVc
         0FYJdCahFjo8juXl9cevoUrFggOmSZEEiTe+FeBJLLMb71PFk6r242ub23eaT2fsx8pq
         UhcO/jHGW4pZFXTRC8GqHxK0ooSv40s04LfyG8BNI2s3uK4boEzWTW39rSrm0I+jegCe
         n4mfpt9erGm4Pjb3Aq3DJLYTHt0p+ahp6C1b6shy7cNWi8LcPJAA4fI/91bDR0dkobmG
         iKhd1zOjj4JTiimftnS5woZayTItbuRt9E0zKQ03XfIAEo1B4RQDLlBCTYmE+qYf4AyN
         TXMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=sWIRStf/M5fCowY1fnOG6j6UIKCiGq+OQXNx0NMTiRU=;
        b=brbmqz9l7dVBV4JD1wpSNFsxBbm4A1vkzlQ+HKLze3QV73jcWTkRIekYBPMbturXPP
         ZeyqaT1w78W9/RZFscMKRVHvNdem2/S05/pnVEYe7uRURpySce+VBqUIINOCdCMDUjNf
         DPC5p0w8Sx74O/9CGbtgqjJBBsEKXMMKlZeisLSXGE8ES/8XsyB/HI8Ch5+khKYrq+03
         0C2KoquW1b7Ogj/MmnRzwv3amCc+zJC/VTbeD9d9mdK9NBwkZZvt5+8SiVRI86PSnZpV
         SYllX7z+BXG9GtzHiudEtvOJY6gaen846FMSQ4MpAgS6zgzeQ/k6xRrnrbn+MM7/PZly
         ZeCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ed3s5jTX;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12b as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sWIRStf/M5fCowY1fnOG6j6UIKCiGq+OQXNx0NMTiRU=;
        b=E93W7RTmnZfg8NwJGmYsALWrhd4c34ygGOWKBzijr7NmmXgGbhzgPvyLRcFlQQbErS
         IbzGzOcVqPGZB3io3dG2yp3z0gaLHQgRC5x4jVE8RwXfPJybd8Ac2/UcfyOKMBiqn5oA
         YgPp0wVQLEns1SxEnNQSSQkWBYe8kk8QBbb9W6zzFWuHmNZIVSCV1a+zBDrLZVgcdyJn
         FiIRx9Z4vswb+CD+5vpHAql9EHdZ1FbjEjNhhtS6jNRKq4jqNN1BZd93f7KetYX1MTam
         jnA+roLj6w48Nxyuq6bWAi2qzKwVMGyk+msngedsaDPS44BQBmVCVtVedvQ/BtVioquT
         JAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sWIRStf/M5fCowY1fnOG6j6UIKCiGq+OQXNx0NMTiRU=;
        b=F8xnzYosMABDlrc8H+14Y9wv/LFGI9OUtAKUg+NFshFl5eMVfUPrqcxT6cAdACMnbT
         2HZvoBlMejAX8djPOZVHriORlKlM8clNUHKfE+iwMdrgwGuhcg1iQUR+hIdTSLf/T/De
         IFng0sBf684xvjwm4eliHusl7DA/7kySPtr9fxCXt87opggZ/U09Hjc1jYIJvM/WXpgL
         DJAhYdpQCQcoDHk+DfJ/ZXTZLwFx45RtTnM/c7N/96h1gqYKC73QzJHNMPWisGL+uoX6
         NTyPahawSzp3kFRKlHyg/4Uv+53NjNKrT1cvZOgRpIHLVTjrsTRGOKnIlsmGkrXYN74N
         iMSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Publgz+oXww/489RfGgl9ioAGgFARiG5GALHcPy7CqVflT9Ag5nS
	nXYL32vGwquBB8Tx1Dlt+Qc=
X-Google-Smtp-Source: APiQypKY8P5YdeST8l8vPl23GpvG5emgimurclGIMKiYUgk0kGxr+LVy3V4rjARNiP/pWjgLiCemMQ==
X-Received: by 2002:a1c:620a:: with SMTP id w10mr3020754wmb.134.1588753429486;
        Wed, 06 May 2020 01:23:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4103:: with SMTP id l3ls2595889wrp.7.gmail; Wed, 06 May
 2020 01:23:48 -0700 (PDT)
X-Received: by 2002:adf:e791:: with SMTP id n17mr8819491wrm.217.1588753428739;
        Wed, 06 May 2020 01:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588753428; cv=none;
        d=google.com; s=arc-20160816;
        b=iXNxwSbqXk1Qj/76T3Fzf91G/PVr2bDWlYsXSHBWuCIS4GLNN1hkWdmuJTPBAUm41h
         n/NeH/3ZKiNCxPn+rMLlKePS6bjtJjYLsmpcvzV+Pm1DzM/1giancQM5/xpqfBdLLelw
         Eq2kW5k47kDcKZHt4as0IYxcm1NwNKRaijYqZfn8F434PlYtT9qlUliK1awu7kT9Z13x
         /GJk5NCPfZkoeLgvMfFq2xGiFlZmbqRLhbR8cEIjJCCejO/IEQT2t8pCyOXD71oF2TlB
         cm6IKLRQbt4XWH5GyxQKCbWdZ1FQG49my1coa2TWci8JrbRhF1P0ll0O69aa1c1dD5eF
         sdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vDFmsPQ9LV5qqdvR0ac7+qRCk+gNNqWlVDK4ZNOaD8Y=;
        b=KhcQMWryCvQllJAxMekdlqdPI0dAWTSUUpqt1VQuGf+Tw2oNhv0YQlQxzqpS+/Ngdk
         lPbUKBcyR3n/2bjHPTyySGlJ9oSlbN/3lOprOYs6LO54i2p8vNECZ3SoCHVaxDLmbnyq
         4besZ4AorC2wANqTRym1WM9gE1CtODegVR6zWnjs+zjWmuHCi6LQptBznQ73j5Be0Rpn
         cKalyF/zFbzfQa4b1z1xPNotN+y8EIxjBJrvPEV8TpwysVL5piaSlhoSI4KGYikBzBnG
         GvQqDsdgtioatT+tD2kbpH8+3iBoUKUY/bmqzGAqzfpDShJYN0Lgkw8MXvRCu0w1bUJu
         QfPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ed3s5jTX;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12b as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com. [2a00:1450:4864:20::12b])
        by gmr-mx.google.com with ESMTPS id f129si72618wmf.2.2020.05.06.01.23.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 01:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12b as permitted sender) client-ip=2a00:1450:4864:20::12b;
Received: by mail-lf1-x12b.google.com with SMTP id h26so581909lfg.6
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 01:23:48 -0700 (PDT)
X-Received: by 2002:a19:f610:: with SMTP id x16mr4344884lfe.79.1588753427959;
 Wed, 06 May 2020 01:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHFG_=U==gEqKJWV0_Na5eap5zUpwp3beU0A-7-+wY1q-0LFJw@mail.gmail.com>
 <5de9a7f5-20c5-56eb-9052-999060d60990@siemens.com>
In-Reply-To: <5de9a7f5-20c5-56eb-9052-999060d60990@siemens.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 6 May 2020 10:23:35 +0200
Message-ID: <CAHFG_=V8wf0zMUk5VZHYbAReARFCoJ6m_1kcCDNxkp7-01Vukw@mail.gmail.com>
Subject: Re: Macchiatobin enable help
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000b6406a05a4f67b92"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=ed3s5jTX;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::12b as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
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

--000000000000b6406a05a4f67b92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan,

actually mem=3D3840M is the only thing required to get the demo running.
device tree and CMA=3D32M reservations do not bring anything visible.
I haven't fully investigated but I'll do.

FF

On Wed, 6 May 2020 at 07:05, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 05.05.20 19:42, Fran=C3=A7ois Ozog wrote:
> > Hi
> >
> > Trying to revive memories to play with Jailhouse on a Macchiatobin.
> >
> > I've got my FDT reservation as described in configs/arm64/macchiatobin.=
c:
> > 100000000-13fffffff : System RAM
> >    139800000-13effffff : reserved
> >    13f2e3000-13f342fff : reserved
> >    13f343000-13f743fff : reserved
> >    13f744000-13f7c3fff : reserved
> >    13f7c6000-13f7c7fff : reserved
> >    13f7c8000-13f7c8fff : reserved
> >    13f7c9000-13f7cffff : reserved
> >    13f7d0000-13f7d0fff : reserved
> >    13f7d1000-13f7d1fff : reserved
> >    13f7d2000-13fffffff : reserved
> > 800000000-83fffffff : reserved
> >
> > When I launch:
> > sudo tools/jailhouse enable configs/arm64/macchiatobin.cell
> >
> > The module says:
> > jailhouse: request_mem_region failed for hypervisor memory.
> > jailhouse: Did you reserve the memory with "memmap=3D" or "mem=3D"?
> >
> > hypervisor is at 0x13fc00000 as per the config which seems fine.
> > The reserved memory as per the config does not exist as it is beyond
> > physical RAM. I moved it at 2G (80000000-83ffffff) but still the same
> > thing.
> >
> > That's certainly an obvious issue but.... if you could help me...
> >
>
> I don't have that board in reach to check how reservation looks like in
> the good case, but you can get an image that is supposed to work from
> jailhouse-images. Or pick up patterns from there, like the reservation
> via "mem=3D3840M" [1]. Maybe start you system with that setting and
> compare the reservations.
>
> Jan
>
> [1]
>
> https://github.com/siemens/jailhouse-images/blob/master/wic/macchiatobin.=
wks
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Linaro Edge & Fog Computi=
ng Group*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAHFG_%3DV8wf0zMUk5VZHYbAReARFCoJ6m_1kcCDNxkp7-01Vukw%40mail.=
gmail.com.

--000000000000b6406a05a4f67b92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Jan,<div><br></div><div>actually mem=3D3840M is the=
 only thing required to get the demo running.=C2=A0</div><div>device tree a=
nd CMA=3D32M reservations do not bring anything visible.</div><div>I haven&=
#39;t fully investigated but I&#39;ll do.</div><div><br></div><div>FF</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, 6 May 2020 at 07:05, Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@si=
emens.com">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 05.05.20 19:42, Fran=C3=A7ois Ozog wrot=
e:<br>
&gt; Hi<br>
&gt; <br>
&gt; Trying to revive memories to play with Jailhouse on a Macchiatobin.<br=
>
&gt; <br>
&gt; I&#39;ve got my FDT reservation as described in configs/arm64/macchiat=
obin.c:<br>
&gt; 100000000-13fffffff : System RAM<br>
&gt;=C2=A0 =C2=A0 139800000-13effffff : reserved<br>
&gt;=C2=A0 =C2=A0 13f2e3000-13f342fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f343000-13f743fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f744000-13f7c3fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f7c6000-13f7c7fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f7c8000-13f7c8fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f7c9000-13f7cffff : reserved<br>
&gt;=C2=A0 =C2=A0 13f7d0000-13f7d0fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f7d1000-13f7d1fff : reserved<br>
&gt;=C2=A0 =C2=A0 13f7d2000-13fffffff : reserved<br>
&gt; 800000000-83fffffff : reserved<br>
&gt; <br>
&gt; When I launch:<br>
&gt; sudo tools/jailhouse enable configs/arm64/macchiatobin.cell<br>
&gt; <br>
&gt; The module says:<br>
&gt; jailhouse: request_mem_region failed for hypervisor memory.<br>
&gt; jailhouse: Did you reserve the memory with &quot;memmap=3D&quot; or &q=
uot;mem=3D&quot;?<br>
&gt; <br>
&gt; hypervisor is at 0x13fc00000 as per the config which seems fine.<br>
&gt; The reserved memory as per the config does not exist as it is beyond<b=
r>
&gt; physical RAM. I moved it at 2G (80000000-83ffffff) but still the same<=
br>
&gt; thing.<br>
&gt; <br>
&gt; That&#39;s certainly an obvious issue but.... if you could help me...<=
br>
&gt; <br>
<br>
I don&#39;t have that board in reach to check how reservation looks like in=
 <br>
the good case, but you can get an image that is supposed to work from <br>
jailhouse-images. Or pick up patterns from there, like the reservation <br>
via &quot;mem=3D3840M&quot; [1]. Maybe start you system with that setting a=
nd <br>
compare the reservations.<br>
<br>
Jan<br>
<br>
[1] <br>
<a href=3D"https://github.com/siemens/jailhouse-images/blob/master/wic/macc=
hiatobin.wks" rel=3D"noreferrer" target=3D"_blank">https://github.com/sieme=
ns/jailhouse-images/blob/master/wic/macchiatobin.wks</a><br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://drive.google.com/a/linaro.org/uc?id=3D0BxTAygk=
us3RgQVhuNHMwUi1mYWc&amp;export=3Ddownload" width=3D"96" height=3D"53"></td=
><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"=
><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;=
;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,87,87)" vali=
gn=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=C3=A9ri=
c Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0<i>=
Director Linaro Edge &amp; Fog Computing Group</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAHFG_%3DV8wf0zMUk5VZHYbAReARFCoJ6m_1kcCDNxkp7-01V=
ukw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAHFG_%3DV8wf0zMUk5VZHYbAReARFCoJ6m_1kcCD=
Nxkp7-01Vukw%40mail.gmail.com</a>.<br />

--000000000000b6406a05a4f67b92--
