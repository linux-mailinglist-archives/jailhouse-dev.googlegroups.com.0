Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBQV7ZTYQKGQEZFV7VUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169D14E0C1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 19:26:12 +0100 (CET)
Received: by mail-oi1-x239.google.com with SMTP id u125sf1857986oia.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 10:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vZRnMlfkRT65VFqqq3uKx4RSAJNrFGd+DVv5YhQSRP0=;
        b=dkl7jwy6qiIvbDcPrAARKIc7nXiyWn3Y9uffHtfZiQvG4uSBI1wxdiAweljwT3HpEQ
         GakpmEpmPMEFwxAfVxwpeS1QvX5oPsvxEoViV9E9ph7UsC6NjLCQaxZVOB8ClKl/XCaH
         MXh2FJ87XtJZSDZY18+p8BiBQxKrupMXLsxOR/qReYKzfpuq87bUG3ohBCl7lWkulesk
         42zinVLVJjtLrSslaa3Jc5xj491znI6tQIsPFTyIntB5Pwmg0ugtuHG+x6Fp0MfmIMkf
         4iZcKE627Q2Ue9gqqpGmHpkPslUUcD2hodQMyWvYtaKN3rAQVPn2nf56RyP/F1YAhErP
         U/fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vZRnMlfkRT65VFqqq3uKx4RSAJNrFGd+DVv5YhQSRP0=;
        b=pUzn+Z+gLzEZjoAlgnRe+JwBk4OW8Ey8TTcu0CGnBWtZv+iQh4Vb73mZWu8kKI6LWt
         elnMDorhzwrl0pS/rIM+EJ5RVKNbpNhkZcGZFNQJcCkVNdTEeWyQk+CSwSxu0TKZn23/
         zsQxceLZv9i3fcfREXhXWAtyiX+ZxBZ7ayqz2qSN8CwOP4xW3w7GfLPtkUXJXP2pwYqY
         pUEJ0cUVE7V9Je94wYpAx/9CU9l5CHLtCZWUYjE5wY2q4/UICx9jsIplb3GG7GbPzfzJ
         KesxkgxHyYrJNuNJx+hmU73VYdRDTiqTCnlKfQt5OR4f7lFJ3LaY3wD/m7pyh8/TuJ+b
         YySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vZRnMlfkRT65VFqqq3uKx4RSAJNrFGd+DVv5YhQSRP0=;
        b=aa71IuCNg2Hvus6eAn/vvWC3C8YiVxEjgO7uXqNRTjIAH8U8eHhkJD91RMFzaBTEqs
         5JugEt/rJ7KRpVjs0oJlvmGz9OkPaGSuitz7+R3HoWUdMYu17vrbCRtZJj65Ki2d3sPF
         XxbGHL6B92s/mbz8xsFPqGtiEw03tsx1sp64fq7OvJzi6w0sQXwSM0KPZVsJmn/mPdgs
         M/8arx9l5BPdp9yyF2oHYMraxOgefDN6ve/xwsoG+PO/z+EjPs93NvyoOgVpt9iAWWZs
         LM97u2wpqL3jNdYMdvHycvHnPYTLVzFprRegAAUF/nsDhF4TSXqYyGH1cco+7pRiWlRM
         RhfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXTkN4ThxdK9xyvcHTuHqKtVfo4AwIAN8S4Rc/f9neE+Eq2uw19
	nBH1fyggtEzpR/u7BbmuN+U=
X-Google-Smtp-Source: APXvYqzri2izyfCeKXCGrKgYZZ+mHyGRMWSFvmUayaBRFNH12VsX6i9hikCU6wt/CGwZDztCUAv4BQ==
X-Received: by 2002:a05:6830:13d9:: with SMTP id e25mr4493076otq.134.1580408770997;
        Thu, 30 Jan 2020 10:26:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cf95:: with SMTP id f143ls941559oig.7.gmail; Thu, 30 Jan
 2020 10:26:10 -0800 (PST)
X-Received: by 2002:a05:6808:8d5:: with SMTP id k21mr3815122oij.121.1580408770230;
        Thu, 30 Jan 2020 10:26:10 -0800 (PST)
Date: Thu, 30 Jan 2020 10:26:09 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <78a37635-aa5e-4614-8c26-6dd02dca03c2@googlegroups.com>
In-Reply-To: <0fc83e67-fe60-9a03-a222-a99f0e5ef308@siemens.com>
References: <001789de-def6-48a6-992a-bfcdf07c756e@googlegroups.com>
 <f5236c19-ece5-dbc8-e52a-4a6a9408eb65@siemens.com>
 <0fc83e67-fe60-9a03-a222-a99f0e5ef308@siemens.com>
Subject: Re: Query on RAM regions in linux demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1123_643380010.1580408769610"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
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

------=_Part_1123_643380010.1580408769610
Content-Type: multipart/alternative; 
	boundary="----=_Part_1124_42226826.1580408769610"

------=_Part_1124_42226826.1580408769610
Content-Type: text/plain; charset="UTF-8"



On Thursday, January 30, 2020 at 8:25:16 PM UTC+5:30, Jan Kiszka wrote:
>
> On 30.01.20 15:50, Jan Kiszka wrote: 
> > On 30.01.20 11:52, vijai kumar wrote: 
> >> Hi All, 
> >> 
> >> I see that there are two RAM regions defined in ARM linux demos. One 
> >> mapped to virtual address 0 and the other 1:1. 
> >> 
> >> I am not sure what the first region is for. Can anyone please help me 
> >> understand that? 
> >> 
> >> For Example in qemu-arm64-linux-demo.c 
> >> 
> >> I am not sure what the below region is for. 
> >> 
> >>      /* RAM */ { 
> >>                          .phys_start = 0x7f900000, 
> >>                          .virt_start = 0, 
> >>                          .size = 0x10000, 
> >>                          .flags = JAILHOUSE_MEM_READ | 
> >> JAILHOUSE_MEM_WRITE | 
> >>                                  JAILHOUSE_MEM_EXECUTE | 
> >> JAILHOUSE_MEM_LOADABLE, 
> >>                  }, 
> >> 
> >> Thanks, 
> >> Vijai Kumar K 
> >> 
> > That first region is for bootstrapping. "jailhouse cell linux" loads 
> > linux-loader.bin at address 0 in the cell because that is the default 
> > start address of cell cores. The loader performs a few additional 
> > initializations and then jumps to the kernel start address that is 
> > located in the second, larger region. 
> > 
> > HTH, 
> > Jan 
> > 
>
> Oh, and that 1:1 mapping for the second region is needed for systems 
> that do not have an SMMU (quite a few) or where we lack the driver 
> upstream (SMMUv2). 
>
> Jan 
>
>
Ah. I see. Thanks for the explanation Jan. That really helped.

Best,
Vijai Kumar K
 

> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/78a37635-aa5e-4614-8c26-6dd02dca03c2%40googlegroups.com.

------=_Part_1124_42226826.1580408769610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thursday, January 30, 2020 at 8:25:16 PM UTC+5:=
30, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 30.01.=
20 15:50, Jan Kiszka wrote:
<br>&gt; On 30.01.20 11:52, vijai kumar wrote:
<br>&gt;&gt; Hi All,
<br>&gt;&gt;
<br>&gt;&gt; I see that there are two RAM regions defined in ARM linux demo=
s. One=20
<br>&gt;&gt; mapped to virtual address 0 and the other 1:1.
<br>&gt;&gt;
<br>&gt;&gt; I am not sure what the first region is for. Can anyone please =
help me=20
<br>&gt;&gt; understand that?
<br>&gt;&gt;
<br>&gt;&gt; For Example in qemu-arm64-linux-demo.c
<br>&gt;&gt;
<br>&gt;&gt; I am not sure what the below region is for.
<br>&gt;&gt;
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 /* RAM */ {
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .phys_start =3D 0x7f900000,
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .virt_start =3D 0,
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .size =3D 0x10000,
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ |=20
<br>&gt;&gt; JAILHOUSE_MEM_WRITE |
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0 JAILHOUSE_ME=
M_EXECUTE |=20
<br>&gt;&gt; JAILHOUSE_MEM_LOADABLE,
<br>&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
<br>&gt;&gt;
<br>&gt;&gt; Thanks,
<br>&gt;&gt; Vijai Kumar K
<br>&gt;&gt;
<br>&gt; That first region is for bootstrapping. &quot;jailhouse cell linux=
&quot; loads=20
<br>&gt; linux-loader.bin at address 0 in the cell because that is the defa=
ult=20
<br>&gt; start address of cell cores. The loader performs a few additional=
=20
<br>&gt; initializations and then jumps to the kernel start address that is=
=20
<br>&gt; located in the second, larger region.
<br>&gt;=20
<br>&gt; HTH,
<br>&gt; Jan
<br>&gt;=20
<br>
<br>Oh, and that 1:1 mapping for the second region is needed for systems=20
<br>that do not have an SMMU (quite a few) or where we lack the driver=20
<br>upstream (SMMUv2).
<br>
<br>Jan
<br>
<br></blockquote><div><br></div><div>Ah. I see. Thanks for the explanation =
Jan. That really helped.</div><div><br></div><div>Best,</div><div>Vijai Kum=
ar K</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">--=
=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/78a37635-aa5e-4614-8c26-6dd02dca03c2%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/78a37635-aa5e-4614-8c26-6dd02dca03c2%40googlegroups.com<=
/a>.<br />

------=_Part_1124_42226826.1580408769610--

------=_Part_1123_643380010.1580408769610--
