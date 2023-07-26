Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBGFJQSTAMGQEK6PWW4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3c.google.com (mail-oa1-x3c.google.com [IPv6:2001:4860:4864:20::3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACB763687
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 14:42:03 +0200 (CEST)
Received: by mail-oa1-x3c.google.com with SMTP id 586e51a60fabf-1b448f039d5sf1450347fac.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 05:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690375321; x=1690980121;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S42m4crxsY3AGZLVhf5HGb/jqkwKBEHIyLUopeOLbbA=;
        b=Unm7E1wN8xsSm8CBzLuzme9tVvYK5LEv5Q/6Y04G3Rb+6drkt3FleDUIeoBc1W80eR
         ANYcRDMZ3TcCA791u1RKzjD1cQGRrqC+HbHpIhXb+C/v08kg3Hck4LmgZUX09eAKkWe7
         3Y+4Y7nQHnNX6NlZQUlhm/DJQh3l99VkKAVngrg+mquqJz+2Op8L0P1FX1RRa/SC2p4i
         o8l4UoK+wCGvy10dIFD2SV3+4MkWeVRoUm1VqT6unG8SbaCihcOuMUf9DFwQ5NzjYZiF
         E4udMHEglU6L0PmanZO7E+hjs2xsktloHLd4gsWns0GlNhh6Dnf9n4Oy7twzJc1vD1tJ
         ugWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690375321; x=1690980121;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S42m4crxsY3AGZLVhf5HGb/jqkwKBEHIyLUopeOLbbA=;
        b=eLLmzaCQppv0DwPnLRf2XCIi5aysuj2lp2Lw8vgZ6HWpm3Yl4NY1HednToeqL2fWIQ
         RtrUXI+kx+x+LwyaWa4QWy2sRyM6iyYgLiTlhzgRUaX+Q0zkaeKMGf/ehw+boNoAbrQp
         uxe1XND4af9CGcZllX3rkIV8ePoNUJuQTKX0abxQxxswHoTmAKaz/NGAQabp7yCk6aSE
         WC5P0vPLlgMRmEcXME760AJtCG31ztwX1MZT5K4NsleQPW0NT3NdBCWU9+6BsYNe/JRa
         fr8ozRL7BZyTudyOWlrNuIM0NnSZyz/WHOTthEBOlE+aWlPwzUrDETEDS42b8weOyh7G
         rZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690375321; x=1690980121;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S42m4crxsY3AGZLVhf5HGb/jqkwKBEHIyLUopeOLbbA=;
        b=i011ibPAp4dL4D1Cg3Pd7o5rqdiYE8G5xXtWPKc3rN6aoxjtgmljs7AGRvS8gqOFFQ
         6zsf4N6fhMAmUR5XObKjtmZGUxWupm1HS21vOHahmCbGTLP30WbOPGgnRh4JEqQhfTgb
         HxSc/9CD+iNEh8udzEe03batB3Z76p+HpdUHMxP0Fg1gHopMhWQgcKtN8L7+x193aNej
         ZS1nc70O2gGZUgbFVKaMpctOQV2AXzYlaOBKIHKcH36xNKwwawkoitHbL133Fo2012+R
         mxAPr4r5H+3h2nAV5ZcVT42Qx2xRVKXsDfMSTdirM6GXkRqpbOy+kiw7VLg/mjaESlK3
         cn0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLYD/uBiXh83VoQ+peLzaeIPh0rm7eVwJqxilPPERWln8R7OANpH
	pXIQbjCSF4I+5BqB6FiN43k=
X-Google-Smtp-Source: APBJJlGyFZDrjo+f19okG7mfuCsdHLrWmjjIuFoxxat70U5nd5hVtglhCSkM+68FthycljdQeizWOg==
X-Received: by 2002:a05:6870:e0d3:b0:1bb:4e18:f0b1 with SMTP id a19-20020a056870e0d300b001bb4e18f0b1mr1978610oab.1.1690375321325;
        Wed, 26 Jul 2023 05:42:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:b683:b0:1b7:674c:1a90 with SMTP id
 cy3-20020a056870b68300b001b7674c1a90ls13314861oab.2.-pod-prod-04-us; Wed, 26
 Jul 2023 05:42:00 -0700 (PDT)
X-Received: by 2002:a05:6870:c7a6:b0:1bb:623a:6f5d with SMTP id dy38-20020a056870c7a600b001bb623a6f5dmr3426748oab.1.1690375320433;
        Wed, 26 Jul 2023 05:42:00 -0700 (PDT)
Date: Wed, 26 Jul 2023 05:41:59 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <57a4477a-2c32-49ef-8ccc-e95e1d9fb815n@googlegroups.com>
In-Reply-To: <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
 <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
 <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
Subject: Re: Configuration with 2 guest cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4236_1661452812.1690375319690"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_4236_1661452812.1690375319690
Content-Type: multipart/alternative; 
	boundary="----=_Part_4237_1128865564.1690375319690"

------=_Part_4237_1128865564.1690375319690
Content-Type: text/plain; charset="UTF-8"

Thanks for the tip to increase the memory area for the hypervisor!

I have increased the memory area for the hypervisor from 6 MiB to 9 MiB and 
can now successfully start both guest cells with a size of 512 MiB each.

I don't know if there is a hint in the documentation for the hypervisor 
"Jailhouse" (in the GIT repository).
If not, it would certainly be very helpful if this correlation (guest cell 
size - required memory for hypervisor) is described somewhere (e.g. in the 
file "Documentation/non-root-linux.txt").

Jan-Marc.

Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 13:12:02 UTC+2:

>
>
> On 26/07/2023 12:56, Jan-Marc Stranz wrote:
> > Of course, I checked the configuration for the root cell with "jailhouse 
> > config check".
> > However, this is not changed at all while I change the configuration for 
> > the guest cells.
> > 
> > Also, everything is fine as long as I don't set the size for the guest 
> > cell larger than 320 MiB in the guest cell configuration.
> > This only uses about 62% of the memory area reserved for the guest cells 
> > in the configuration for the root cell.
> > 
> > I will follow up on the tip to increase the memory area for the 
> > hypervisor ( hypervisor_memory.size).
> > So far, 6 MiB is reserved for the hypervisor itself.
> > To what size should I increase this memory area?
>
> Just a bit more. Try 10 MiB or so.
>
> Ralf
>
> > 
> > However, to find the cause in the driver or hypervisor, I lack the 
> > necessary knowledge about the structure and relationships.
> > So I have to rely on external help.
> > 
> > Thanks a lot!
> > Jan-Marc.
> > 
> > -- 
> > You received this message because you are subscribed to the Google 
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send 
> > an email to jailhouse-de...@googlegroups.com 
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit 
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com 
> <
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_medium=email&utm_source=footer
> >.
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com.

------=_Part_4237_1128865564.1690375319690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip to increase the memory area for the hypervisor!<br /><br=
 />I have increased the memory area for the hypervisor from 6 MiB to 9 MiB =
and can now successfully start both guest cells with a size of 512 MiB each=
.<br /><br />I don't know if there is a hint in the documentation for the h=
ypervisor "Jailhouse" (in the GIT repository).<br />If not, it would certai=
nly be very helpful if this correlation (guest cell size - required memory =
for hypervisor) is described somewhere (e.g. in the file "Documentation/non=
-root-linux.txt").<br /><br />Jan-Marc.<br /><br /><div class=3D"gmail_quot=
e"><div dir=3D"auto" class=3D"gmail_attr">Ralf Ramsauer schrieb am Mittwoch=
, 26. Juli 2023 um 13:12:02 UTC+2:<br/></div><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204)=
; padding-left: 1ex;">
<br>
<br>On 26/07/2023 12:56, Jan-Marc Stranz wrote:
<br>&gt; Of course, I checked the configuration for the root cell with &quo=
t;jailhouse=20
<br>&gt; config check&quot;.
<br>&gt; However, this is not changed at all while I change the configurati=
on for=20
<br>&gt; the guest cells.
<br>&gt;=20
<br>&gt; Also, everything is fine as long as I don&#39;t set the size for t=
he guest=20
<br>&gt; cell larger than 320 MiB in the guest cell configuration.
<br>&gt; This only uses about 62% of the memory area reserved for the guest=
 cells=20
<br>&gt; in the configuration for the root cell.
<br>&gt;=20
<br>&gt; I will follow up on the tip to increase the memory area for the=20
<br>&gt; hypervisor ( hypervisor_memory.size).
<br>&gt; So far, 6 MiB is reserved for the hypervisor itself.
<br>&gt; To what size should I increase this memory area?
<br>
<br>Just a bit more. Try 10 MiB or so.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; However, to find the cause in the driver or hypervisor, I lack the=
=20
<br>&gt; necessary knowledge about the structure and relationships.
<br>&gt; So I have to rely on external help.
<br>&gt;=20
<br>&gt; Thanks a lot!
<br>&gt; Jan-Marc.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/43f41f9=
d-0930-416b-a618-1955e237cc87n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-=
1955e237cc87n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16904612679=
22000&amp;usg=3DAOvVaw2AYnRqOyUkZo8VYi8acd7G">https://groups.google.com/d/m=
sgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/43f41f9=
d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
690461267922000&amp;usg=3DAOvVaw0XVMUQ4xDmtpJA5rWKcOHC">https://groups.goog=
le.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.co=
m</a>.<br />

------=_Part_4237_1128865564.1690375319690--

------=_Part_4236_1661452812.1690375319690--
