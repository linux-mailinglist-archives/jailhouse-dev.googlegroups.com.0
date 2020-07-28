Return-Path: <jailhouse-dev+bncBCZKRDGF7APRB7GJQD4QKGQETXWJ3RQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A34E230B3F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 15:15:43 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id 1sf13941131qkm.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6pOKozEfpQJe6dt0+G2LG2B3K8n4s4uzpzO5lfgPg14=;
        b=sV8VAsNWdJ9SXciPA+DrFq6vvIGGUgyJFXdgtD6m3HlyEAMbC1fO2YwlR7F3Y3Vakw
         pVm7upWcx2nYyoq0iTRRFP/Ov5a1JxjF25vN1sFua7aFUiUupc5TJrOVvkMBxi+m2RCe
         ji8S3gcDB+2NyZvvuFfdR5+v1d2z75FSBGv15/UdrgQWiYAu7UgZNlUp68LELgOOZOFZ
         N/lHqnxIBSpxySCwZSFNjpvHgE4XlnyYi1nbP4lTR+gbzRQSHiNbRC9hUM0lKjHALxT2
         x6k/sgsj+NHwP4watZUcNIES/pgf124goWZ8TEUjCw5ZYm6dg8DibDVM82H+cwWSFgs/
         YviQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luzny-cz.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6pOKozEfpQJe6dt0+G2LG2B3K8n4s4uzpzO5lfgPg14=;
        b=QB/XbbHV7vAoYNbZyzU3Bc1QsfEYixLNEZEZuW+tpVyD0lp5dwWOdwmwdTd/tKOU9p
         obT4wqM0wQTyh5sI9we05EdOHh17LON7P+OsrYgRHZ2eMeNXdNdOGhlI/sPn40lKHMCG
         kNa7yntXCcKhx3ZwP6iCZPqr/mEYmaV0cxHCe+tyJbh+TGB+2pAP5rDVU+7ulrqp9PBu
         CgD6R9kqmfJLLPAfLSEWVnE9mdENj0DrOil/fJ9R0j2jI9277eQpkGKtcbImHAOcApY9
         lX31eVK/eIBC5b1QcWXmXwTzTogCaMrDxjFR9o48/orguTbm/+G/j5iA48A2J4LAi0SI
         UcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6pOKozEfpQJe6dt0+G2LG2B3K8n4s4uzpzO5lfgPg14=;
        b=KrOJ1Yl9T1A94tyw7n4vaGUsXba+/2V98R1UPZQ359DKkdVly+XasZbnKJyCzy0+Eg
         OjxVOg8frpz9W7OdF3l04y59IX8hGTm0QusiFzbrMVVPjPxZLFEqaHuIZComOm2Cd66R
         EHIfwo7DubcrzTPm33t4rRxQklODRtxD8WInQH/vKqHzG8H7fL0UK5xqtpybpZEdnWwc
         hHAk2JsfbdZuNrQQZmPTaz5mUw2/VSP0bREpVIG45DOa8lXcv5O7EXNtePkqRu1JrbBg
         7K4uGTrbNOAOAZx3exNmDZ6PiCjhcEuVXhHPYa8Gr+WlY/ngPIa4rUrx5EltYmEmgFcW
         RZkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336H1/4r86hT6Fj2oKCQ1hXitdp0qqHfbg3EoJjNpH08os+VDW7
	aSKwfMLT3FiEMPEIfvLTPlg=
X-Google-Smtp-Source: ABdhPJwi/drDqd0TwWvYxpvHZdVxAPt8B2BRzjx1B5OwKWqIxEzr1/eUxyV0PmKXi1NGVFxcW+3hdw==
X-Received: by 2002:ac8:6782:: with SMTP id b2mr6783259qtp.152.1595942140653;
        Tue, 28 Jul 2020 06:15:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:eb0d:: with SMTP id b13ls9708750qkg.7.gmail; Tue, 28 Jul
 2020 06:15:39 -0700 (PDT)
X-Received: by 2002:a37:bc87:: with SMTP id m129mr27695419qkf.47.1595942139187;
        Tue, 28 Jul 2020 06:15:39 -0700 (PDT)
Date: Tue, 28 Jul 2020 06:15:38 -0700 (PDT)
From: =?UTF-8?Q?Jakub_Lu=C5=BEn=C3=BD?= <jakub@luzny.cz>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <60a8d747-b738-45c2-bb9c-7e5bdae0ee64n@googlegroups.com>
In-Reply-To: <9c941621-bc4c-ee6d-6a4b-2b9d2d3ac807@siemens.com>
References: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
 <9c941621-bc4c-ee6d-6a4b-2b9d2d3ac807@siemens.com>
Subject: Re: GSoC Report: Week 8
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_168_1447524249.1595942138391"
X-Original-Sender: jakub@luzny.cz
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

------=_Part_168_1447524249.1595942138391
Content-Type: multipart/alternative; 
	boundary="----=_Part_169_601147079.1595942138391"

------=_Part_169_601147079.1595942138391
Content-Type: text/plain; charset="UTF-8"


>
> Sorry, "fixed" that at least now... Unfortunately, I only have a 1G RPi4 
> in reach to do cross-checking.
>
 
 Thanks 

That nice to hear! BTW, who is hosting your GSoC project? AGL?
>
 
Yes, it's hosted by AGL (actually Linux Foundation). This email was 
actually for the agl-dev-community ML, but I've sent it to the wrong one, 
sorry. 

Jakub 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/60a8d747-b738-45c2-bb9c-7e5bdae0ee64n%40googlegroups.com.

------=_Part_169_601147079.1595942138391
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;"><div>Sorry, "fixed" that at least now... Unfortunately, I only have a 1=
G RPi4 <br>in reach to do cross-checking.</div></blockquote><div>&nbsp;</di=
v><div>&nbsp;Thanks&nbsp;<br><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;"><div><div>That nice to hear! BTW, who is hosting your GSoC =
project? AGL?</div></div></blockquote><div>&nbsp;</div><div>Yes, it's hoste=
d by AGL (actually Linux Foundation). This email was actually for the agl-d=
ev-community&nbsp;ML, but I've sent it to the wrong one, sorry.&nbsp;</div>=
<br><div>Jakub&nbsp;</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/60a8d747-b738-45c2-bb9c-7e5bdae0ee64n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/60a8d747-b738-45c2-bb9c-7e5bdae0ee64n%40googlegroups.co=
m</a>.<br />

------=_Part_169_601147079.1595942138391--

------=_Part_168_1447524249.1595942138391--
