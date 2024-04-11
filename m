Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBAF24GYAMGQEQT2FLWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD68A2135
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 23:58:26 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dcc05887ee9sf473497276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 14:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712872705; x=1713477505; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFCMn5tIN5WnbeAq86EsF2G4XxPngWgzp+FVoLrsK3s=;
        b=V7CZK78ooE1XxAvggWp3PXTnB5SD3qOUa28N/pCgy7P7/Op6rJW4Jpq/cAQjGk7HsX
         r0vzGQ+GoOk09WmCwWgxxxx4JkCmCNjO88Lv6Mt4XspJle5ZXTOBNWwOb64DIKeEk3Th
         5kJCPtopUsHWB0sLi2m1dRPZx6fA1M/yJuqWwpYAXdyN8kJnS3oghqrXglh2//6hsRJ9
         NT4Zn37KxT6Szp61DpE7K1WkKvBykxFjyOcCbpbCW0x0k9/n7tpwOeazVr+1Jhv7wVt2
         uIrTqSyTIA9eHbHlVfp5wncBABhfXIq+GJWuTkIiCW8a0PRb7U2ogqeCl0Puot4ntDvP
         EsOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712872705; x=1713477505; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFCMn5tIN5WnbeAq86EsF2G4XxPngWgzp+FVoLrsK3s=;
        b=L0XTqtzWXC8u5sOd9Sk5zbtbI+mPzYRu3cqNzMX6Ysi2YPpIG4Qj52M2JHa3AqXaZ1
         5XOC44zgfmKRoRr2lCQF8I3PcMKiWakANE+InwKy0SPHV/obuT6e1TC+FaZPfKVjP12/
         szdeHKIrOw0swTM/O/r0n3hr5deSWuQqzcQNuknOX5lWhG6HI3D1ESEB/ksP22QQNztP
         Upb3BNm2FKvCmV59Bx9Y45fcarFHLgDw4n9YG0HkfCU7cVYj48fT/fz0iN45Y+8ShNkQ
         1hOKe9Xz7ZSamt2l3Shxi5LU7+7Py7VekRKOfnQ13LTEm5iQyRhf4e2q4UFdV76fD+g3
         LeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712872705; x=1713477505;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFCMn5tIN5WnbeAq86EsF2G4XxPngWgzp+FVoLrsK3s=;
        b=IwexuFv/57XcudHscDh3xr0045hSolvaEigRqKLLojgTnFDWOEnjLPxRT0OLq/Bp/e
         7lTRc8oXOdBYPqFhUYlfUkYJ2pqwtc+5SCOXfxOuhwl8SKiQwaj8qhVRFjWGqLDSrjce
         Jw6fBT7V86nMPPM1HM2A6dtaaYw0hpCak5w5qTFkp6XZK7dO9ahWBFHT4SM2+BkNSbr7
         t5fAeXcZL9/ir4zOrMFEo3/6MPXONP/FbSwVf/rQ28APjeJxjzbb8zcpOBt4ZB1gELl+
         VZGifMEkh60WU1H0pVUgI+RqegH+QPr1gqwmCVElRjiiKYRo/HO2KS1m0sjKOWksXIb3
         bNPQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUbzHmYfp67fqebZnCgf9D+9pY5Idd5NhEiKgaw/GWypRiMnXH5biraXJKHADxCU861A2pDQQPY96m7KAAj/3O0l4PvPMUUfI+S0X8=
X-Gm-Message-State: AOJu0YzG/M2T7fggVr81MjBChdm2ZbOXGJJlml/d5XTQFVqmBNlHHXVS
	hQveopF4MYuxVPVeqVlxJ16CU9LWMmnDNmds8DnpQjAOHhc3aftt
X-Google-Smtp-Source: AGHT+IGGVaRujyEIQ2KR0WtvDymrYinFGZt51YNPZgvTAdQXgBoIVk2r2tkaPfurlGVKAUHRjkpj0A==
X-Received: by 2002:a5b:385:0:b0:dcc:933f:ea83 with SMTP id k5-20020a5b0385000000b00dcc933fea83mr879142ybp.30.1712872705383;
        Thu, 11 Apr 2024 14:58:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d855:0:b0:dcc:f46b:129d with SMTP id p82-20020a25d855000000b00dccf46b129dls604797ybg.2.-pod-prod-03-us;
 Thu, 11 Apr 2024 14:58:24 -0700 (PDT)
X-Received: by 2002:a81:4f0e:0:b0:618:7e0c:3697 with SMTP id d14-20020a814f0e000000b006187e0c3697mr36147ywb.2.1712872703865;
        Thu, 11 Apr 2024 14:58:23 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:58:23 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9912f8b7-4b21-46e5-b910-24fbd7f737b1n@googlegroups.com>
In-Reply-To: <7f7c1afc-859b-41ac-8eb8-68eef6e72c95n@googlegroups.com>
References: <7f7c1afc-859b-41ac-8eb8-68eef6e72c95n@googlegroups.com>
Subject: Re: LS-Magazine-Issue 01 My Childhood.rar
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_25314_832077301.1712872703300"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_25314_832077301.1712872703300
Content-Type: multipart/alternative; 
	boundary="----=_Part_25315_58474928.1712872703300"

------=_Part_25315_58474928.1712872703300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Thursday, December 7, 2023 at 4:20:18=E2=80=AFPM UTC+1 Lupe Elnicki wrot=
e:

> LS-Magazine-Issue 01 My Childhood.rar\nDOWNLOAD=20
> https://urlin.us/2wIVEk\n\n\n\n eebf2c3492\n\n\n
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9912f8b7-4b21-46e5-b910-24fbd7f737b1n%40googlegroups.com.

------=_Part_25315_58474928.1712872703300
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Thursday, December 7, 2023 at 4:20:18=E2=80=AFPM UTC+1 Lupe Elnicki wrote:=
<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>LS-Maga=
zine-Issue 01 My Childhood.rar\nDOWNLOAD <a href=3D"https://urlin.us/2wIVEk=
%5Cn%5Cn%5Cn%5Cn" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://urlin.us/2wIVEk%255C=
n%255Cn%255Cn%255Cn&amp;source=3Dgmail&amp;ust=3D1712958356869000&amp;usg=
=3DAOvVaw33G7IHGIY5oPenLpi2jofQ">https://urlin.us/2wIVEk\n\n\n\n</a> eebf2c=
3492\n\n\n</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9912f8b7-4b21-46e5-b910-24fbd7f737b1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9912f8b7-4b21-46e5-b910-24fbd7f737b1n%40googlegroups.co=
m</a>.<br />

------=_Part_25315_58474928.1712872703300--

------=_Part_25314_832077301.1712872703300--
