Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB7XG4GYAMGQESUIOQBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71C8A2257
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:34:24 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1sf600562276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712878463; x=1713483263; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5k4T9MhWYI3dr90r1eEptXmAoc8yWqOZ2zW8Qgw8KA=;
        b=klTlzhJpmmr5Y6UPN6sKDtZzq4D77IEDud1S8IAvq+73+6FK4DZ7vBPTwkGt0UvcxL
         FZQ7Tgt/FOvQ5ROVPwet7aJXAHuuDf/xexsJtba7mWaYwCpF8YqYk1p+MPr1/dqmh9Bo
         0YxDbbhyGi5r5R+I2SKutqSGSjbZxEBpEH76P3AOsHy0qD1SVim/6SblU3ZmgHJxq1V9
         bqXYbUt/eFUGlKTFqHOzNIq205YYktYp4FXlBc1R8RRLK1MEtHtpaJ5dnlTqg2E4iY8D
         f7aZyUMKhGMEdWHkGpWcih2U0b1ykD1Oji5/+rUGDEEk8y4MtgpRdM6/b0b+iBJM9+XO
         0qDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878463; x=1713483263; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5k4T9MhWYI3dr90r1eEptXmAoc8yWqOZ2zW8Qgw8KA=;
        b=msrUnldMiQnkxAuBCx4yQerDlwn+cRUEIbcQG9puRnfngusveAJtPHCMCr7lmQcjKe
         bSP4OuskERT4nHmhaDXvPNMa7JnEW1h88uaDIBa0bGZIUhzw+ZQSnhuk0rL5XbZlJd+2
         dO3egiCOB5Sy0OQ/jgpMlN9nbJjM5hJVS0mWJERuOJGUxriyOwwh05jHNLR7SN2b8BUn
         C3lZeVdgP6t4qo/OsovjTR4XtXENo/nTtNkdcsNU1Q3xlKajDyvZGj9YNXNdvtKjP/ow
         Xzj9IazD8dDHRW2vzRV4wb3Zcz4YXbHYraIZigHouBZ6bjRfqbMbMF7IQwxSPmHKenLL
         bN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878463; x=1713483263;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5k4T9MhWYI3dr90r1eEptXmAoc8yWqOZ2zW8Qgw8KA=;
        b=Wok8Cw1uHuarWwMb0Y6xV4nWaga32U3+hyi6QHX80EEsthplQHew5o2X3A84SBMX73
         j5cWU7zYMVSn7roBcgsY2yKgNj4Li8ZEhlVZfRbOTTU2/hTMj/2/9z0wtUK4GqPrhxhM
         w80UmYSwCY7dZg8V6vDN6WHXiakD1n/kWGZyBBvMytBO7u5XyIFQaUSSSokQUtXgxyif
         tP65VFHeEdrwIFyOUkVV6PFOXFFqJ5T3cqHAIZfUyLk6NMxqDZjPxXYVT+9W2rdGL/Mo
         TzQmE2T1ImHXlzuh6TOOe0uYNKB8QbgKzXnn2qnjom2/1AIpD+MwMI6VAYPlR1jQp5V2
         RT+A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXR3akGt8pDcTlBZZwad+I2kUQKPUuGgoofyaCXC1IpBIXs1pOgnqV+dv69Q3H1ZsN5s1h6rxvacFw/Ot4ACLE7XY2XEv3s8BFoojg=
X-Gm-Message-State: AOJu0Ywe/3OKMFXPXxSHEPeEVpifReIWuLikCvl/RPeV+A3PiSgLqDEl
	v+XkJIzFDpxJ4vaZduTJXgN3u3lj+cihRBRGW9FNIUicHo880Nja
X-Google-Smtp-Source: AGHT+IFIzTqyfuPFGG94d26iv4PRcLWVQ+KI5dW11P2DD8ttZBwWANeBKwePblqq+QqZ6DEjwN+gUw==
X-Received: by 2002:a25:b1a8:0:b0:dc7:4f61:5723 with SMTP id h40-20020a25b1a8000000b00dc74f615723mr1065302ybj.39.1712878463595;
        Thu, 11 Apr 2024 16:34:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:808f:0:b0:dcd:a08f:c832 with SMTP id n15-20020a25808f000000b00dcda08fc832ls506596ybk.0.-pod-prod-04-us;
 Thu, 11 Apr 2024 16:34:22 -0700 (PDT)
X-Received: by 2002:a05:6902:2b85:b0:ddd:7581:1234 with SMTP id fj5-20020a0569022b8500b00ddd75811234mr149410ybb.11.1712878461970;
        Thu, 11 Apr 2024 16:34:21 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:34:21 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <012c34e0-dd8a-4e08-ac16-46d5c358bb0en@googlegroups.com>
In-Reply-To: <ff5e3a2c-8efa-4520-a9c1-f1469f7db2d7n@googlegroups.com>
References: <AQHZaLFmXFNu1/YIYEO9NFuD1K4PPa8k4/US>
 <XQubIZbIfugS1Jcba3rcfTBcCorZPEVGsbMR2WijzMM@bizzfund.sr>
 <DU0PR10MB587591304BA46142C7DEE7EAD0959@DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM>
 <ff5e3a2c-8efa-4520-a9c1-f1469f7db2d7n@googlegroups.com>
Subject: Re: JKP presents "Missing U - Jeffersons"
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_168188_309187649.1712878461423"
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

------=_Part_168188_309187649.1712878461423
Content-Type: multipart/alternative; 
	boundary="----=_Part_168189_1578458091.1712878461423"

------=_Part_168189_1578458091.1712878461423
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

On Friday, April 12, 2024 at 12:33:54=E2=80=AFAM UTC+1 Di Majo Massimiliano=
 wrote:

> MT103/202 DIRECT WIRE TRANSFER
> PAYPAL TRANSFER
> CASHAPP TRANSFER
> ZELLE TRANSFER
> LOAN DEAL
> TRANSFER WISE
> WESTERN UNION TRANSFER
> BITCOIN FLASHING
> BANK ACCOUNT LOADING/FLASHING
> IBAN TO IBAN TRANSFER
> MONEYGRAM TRANSFER
> IPIP/DTC
> SLBC PROVIDER
> CREDIT CARD TOP UP
> DUMPS/ PINS
> SEPA TRANSFER
> WIRE TRANSFER
> BITCOIN TOP UP
> GLOBALPAY INC US
> SKRILL USA
> UNIONPAY RECEIVER
>
> Thanks.
>
>
> NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.
>
> DM ME ON WHATSAPP
> +44 7529 555638 <+44%207529%20555638>
>
> On Monday, April 10, 2023 at 7:32:05=E2=80=AFPM UTC+1 Jef Patrick wrote:
>
>>
>> =20
>> Do not scrole on or delete this mail, but check it out on U'r platfom of=
=20
>> will=20
>> A brand new single released on iTunes and Spotify=20
>> Listen to a, Swinging Dynamic Energetic Melodic Jeffersons, catchy lyric=
s.=20
>>
>> <http://itunes.apple.com/album/id/1678248658>=20
>>
>> <https://open.spotify.com/track/2mrZr0qwyHlpbSC7OjIxcS?si=3D41ce97fdfe18=
439c>=20
>> <https://www.youtube.com/watch?v=3DbzY6ASN6-pM>=20
>> <https://www.facebook.com/Jeffersons411/>=20
>> <https://www.instagram.com/jeffersons_411/>=20
>> <https://twitter.com/Jeffersons411>=20
>> *Life on the road*=20
>> Ready to promote this song worldwide
>>
>> For bookings FB/@JKP Entertainment=20
>> <https://www.facebook.com/jkpentertain/>=20
>> You are receiving this email because you work in the music or radio=20
>> industry.=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/012c34e0-dd8a-4e08-ac16-46d5c358bb0en%40googlegroups.com.

------=_Part_168189_1578458091.1712878461423
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
 Friday, April 12, 2024 at 12:33:54=E2=80=AFAM UTC+1 Di Majo Massimiliano w=
rote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">MT103/2=
02 DIRECT WIRE TRANSFER<br>PAYPAL TRANSFER<br>CASHAPP TRANSFER<br>ZELLE TRA=
NSFER<br>LOAN DEAL<br>TRANSFER WISE<br>WESTERN UNION TRANSFER<br>BITCOIN FL=
ASHING<br>BANK ACCOUNT LOADING/FLASHING<br>IBAN TO IBAN TRANSFER<br>MONEYGR=
AM TRANSFER<br>IPIP/DTC<br>SLBC PROVIDER<br>CREDIT CARD TOP UP<br>DUMPS/ PI=
NS<br>SEPA TRANSFER<br>WIRE TRANSFER<br>BITCOIN TOP UP<br>GLOBALPAY INC US<=
br>SKRILL USA<br>UNIONPAY RECEIVER<br><br>Thanks.<br><br><br>NOTE; ONLY SER=
IOUS / RELIABLE RECEIVERS CAN CONTACT.<br><br>DM ME ON WHATSAPP<br><a href=
=3D"tel:+44%207529%20555638" value=3D"+447529555638" target=3D"_blank" rel=
=3D"nofollow">+44 7529 555638</a><br><br><div class=3D"gmail_quote"><div di=
r=3D"auto" class=3D"gmail_attr">On Monday, April 10, 2023 at 7:32:05=E2=80=
=AFPM UTC+1 Jef Patrick wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-l=
eft:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div dir=3D"ltr">
<div>=C2=A0</div>
</div>
<div marginwidth=3D"0" marginheight=3D"0" style=3D"margin:0px;padding:0px;b=
ackground-color:rgb(39,40,46)">
<table border=3D"0" width=3D"100%" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td height=3D"1" style=3D"border-collapse:collapse;display:none;font-size:1=
px;line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden;c=
olor:rgb(51,51,51)">
Do not scrole on or delete this mail, but check it out on U&#39;r platfom o=
f will </td>
</tr>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;backg=
round-color:rgb(39,40,46)">
<table border=3D"0" width=3D"660" cellpadding=3D"0" cellspacing=3D"0" style=
=3D"border-collapse:collapse;border-spacing:0px;max-width:660px;width:100%;=
background-color:rgb(255,255,255)">
<tbody>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse;background-color:rgb=
(39,40,46)">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;padding-left:0;padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0;table-layout:fixed;margin-le=
ft:auto;margin-right:auto;padding-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<img width=3D"620" alt=3D"" style=3D"min-height:auto;max-width:100%;border:=
0;display:block;outline:none;text-align:center" src=3D"https://ci4.googleus=
ercontent.com/proxy/L7SNu1rtz7weAYNKJZ0mbIzM8BdS8ELYC7ImFEYzYKl2mRTyiz-E-TW=
XsSDy-8EqYkHseWX6piEBqgfGhi-Wwvel90f3zYJNYRmLKnkXaQw=3Ds0-d-e1-ft#https://b=
izzfund.sr/wp-content/uploads/2023/03/YT-TopPica.jpg">
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border-collapse:collapse;padding-top:10px;paddi=
ng-bottom:10px;padding-left:20px;padding-right:20px;word-break:break-word;w=
ord-wrap:break-word">
<h2 style=3D"margin:0px;font-family:&quot;merriweather sans&quot;,&quot;hel=
vetica neue&quot;,helvetica,arial,sans-serif;font-size:24px;line-height:38.=
4px;text-align:left;padding:0px;font-style:normal;font-weight:normal;color:=
rgb(39,40,46)">
<span style=3D"color:rgb(153,153,153)">A brand new single released on <span=
 style=3D"color:rgb(224,62,45)">
iTunes </span>and <span style=3D"color:rgb(29,185,84)">Spotify</span></span=
></h2>
</td>
</tr>
<tr>
<td height=3D"20" valign=3D"top" style=3D"border-collapse:collapse">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;padding-left:0;padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0;table-layout:fixed;margin-le=
ft:auto;margin-right:auto;padding-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<img width=3D"618" alt=3D"" style=3D"min-height:auto;max-width:100%;border:=
0;display:block;outline:none;text-align:center" src=3D"https://ci6.googleus=
ercontent.com/proxy/46zC1KLnZTYh_WdjeAlaH_uHicgluRPwTpNloIjqCxiAeHMYVO_hE4Y=
GcUEo3o5khwIm0zuIJ2O91thiTEMiBV290Lmn1x9_R9P8rOfZ86rrkLgWUQ=3Ds0-d-e1-ft#ht=
tps://bizzfund.sr/wp-content/uploads/2023/03/Bandcamp-Header.jpg">
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border-collapse:collapse;padding-top:10px;paddi=
ng-bottom:10px;padding-left:20px;padding-right:20px;word-break:break-word;w=
ord-wrap:break-word">
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse;b=
order-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;font-family:&quot;merriweather sans&q=
uot;,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-size:15px;l=
ine-height:24px;word-break:break-word;text-align:center;color:rgb(39,40,46)=
">
<span style=3D"color:rgb(5,10,251)">Listen to a, Swinging Dynamic Energetic=
 Melodic Jeffersons, catchy lyrics.</span>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"left" style=3D"border-collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse;font-size:0">
<div style=3D"display:inline-block;max-width:220px;vertical-align:top;width=
:100%">
<table width=3D"220" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=
=3D"right" style=3D"border-collapse:collapse;width:100%;max-width:220px;bor=
der-spacing:0;table-layout:fixed;margin-left:auto;margin-right:auto;padding=
-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<a href=3D"http://itunes.apple.com/album/id/1678248658" style=3D"text-decor=
ation:underline;color:rgb(33,117,155)" rel=3D"nofollow" target=3D"_blank" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp://it=
unes.apple.com/album/id/1678248658&amp;source=3Dgmail&amp;ust=3D17129648356=
13000&amp;usg=3DAOvVaw1HfNys6mMpL3vW4Qm4HI5f"><img width=3D"56" alt=3D"" st=
yle=3D"min-height:auto;max-width:100%;border:0;display:block;outline:none;t=
ext-align:center" src=3D"https://ci5.googleusercontent.com/proxy/VYLM94ZpXN=
UuPT2tE6SO4Z4TeDv4RGnZ9MUBdvtBhR3NYRzwgeE_nVL_UZpcbj9e13J4kEbCduZsMDO14_rlJ=
S-q7FtpAyOI-V0ALA=3Ds0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/2023/=
03/iTunes.jpg"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block;max-width:220px;vertical-align:top;width=
:100%">
<table width=3D"220" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=
=3D"right" style=3D"border-collapse:collapse;width:100%;max-width:220px;bor=
der-spacing:0;table-layout:fixed;margin-left:auto;margin-right:auto;padding=
-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<a href=3D"https://open.spotify.com/track/2mrZr0qwyHlpbSC7OjIxcS?si=3D41ce9=
7fdfe18439c" style=3D"text-decoration:underline;color:rgb(33,117,155)" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://open.spotify.com/track/2mrZr0qwyHlpbSC7OjIx=
cS?si%3D41ce97fdfe18439c&amp;source=3Dgmail&amp;ust=3D1712964835613000&amp;=
usg=3DAOvVaw3toTqZlKEkO9YNcfgnn-HO"><img width=3D"103" alt=3D"" style=3D"mi=
n-height:auto;max-width:100%;border:0;display:block;outline:none;text-align=
:center" src=3D"https://ci4.googleusercontent.com/proxy/hiK0uikXxwZT03uNH_p=
So_qECPEJQYSL67aoLx4daH4UKUtoIxOzaAxDM-GFYJtKyLQdOdcuU4usaEWOZlLQZpMiYoaE3v=
bTLrVnkt8=3Ds0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/2023/03/Spoti=
fy.png"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block;max-width:220px;vertical-align:top;width=
:100%">
<table width=3D"220" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=
=3D"right" style=3D"border-collapse:collapse;width:100%;max-width:220px;bor=
der-spacing:0;table-layout:fixed;margin-left:auto;margin-right:auto;padding=
-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<a href=3D"https://www.youtube.com/watch?v=3DbzY6ASN6-pM" style=3D"text-dec=
oration:underline;color:rgb(33,117,155)" rel=3D"nofollow" target=3D"_blank"=
 data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:/=
/www.youtube.com/watch?v%3DbzY6ASN6-pM&amp;source=3Dgmail&amp;ust=3D1712964=
835613000&amp;usg=3DAOvVaw2Urcgp1CXdzmukRQGIesOG"><img width=3D"63" alt=3D"=
" style=3D"min-height:auto;max-width:100%;border:0;display:block;outline:no=
ne;text-align:center" src=3D"https://ci4.googleusercontent.com/proxy/Z54Uzb=
jV8703CRyWbHdKSLn36ep-9oeZ9RM7GnDJuEQbIScFA2uGfYe_tHnvwOFfqfg8coiJdmkqKILB1=
PW4h45eorEgyTHx2b-k2KA=3Ds0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/=
2023/03/youtube.jpg"></a>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"left" style=3D"border-collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse;font-size:0">
<div style=3D"display:inline-block;max-width:220px;vertical-align:top;width=
:100%">
<table width=3D"220" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=
=3D"right" style=3D"border-collapse:collapse;width:100%;max-width:220px;bor=
der-spacing:0;table-layout:fixed;margin-left:auto;margin-right:auto;padding=
-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<a href=3D"https://www.facebook.com/Jeffersons411/" style=3D"text-decoratio=
n:underline;color:rgb(33,117,155)" rel=3D"nofollow" target=3D"_blank" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://www.f=
acebook.com/Jeffersons411/&amp;source=3Dgmail&amp;ust=3D1712964835613000&am=
p;usg=3DAOvVaw1gj8Psn2DK0Ak8TARKWYAO"><img width=3D"47" alt=3D"" style=3D"m=
in-height:auto;max-width:100%;border:0;display:block;outline:none;text-alig=
n:center" src=3D"https://ci4.googleusercontent.com/proxy/qIvaUHBfjhLCXc8auI=
jeCKc4D77xVMYIHY4WWf9Ooli8I_5uLog6dKUQ3RlCX48H849rJbhG6eiCbi978i-zsx1dJzp8j=
bpJhU1ptVmO=3Ds0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/2023/03/Fac=
ebook.png"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block;max-width:220px;vertical-align:top;width=
:100%">
<table width=3D"220" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=
=3D"right" style=3D"border-collapse:collapse;width:100%;max-width:220px;bor=
der-spacing:0;table-layout:fixed;margin-left:auto;margin-right:auto;padding=
-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<a href=3D"https://www.instagram.com/jeffersons_411/" style=3D"text-decorat=
ion:underline;color:rgb(33,117,155)" rel=3D"nofollow" target=3D"_blank" dat=
a-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://www=
.instagram.com/jeffersons_411/&amp;source=3Dgmail&amp;ust=3D171296483561300=
0&amp;usg=3DAOvVaw1ZhofW0XX15VEea-dbHaOY"><img width=3D"51" alt=3D"" style=
=3D"min-height:auto;max-width:100%;border:0;display:block;outline:none;text=
-align:center" src=3D"https://ci6.googleusercontent.com/proxy/Y-YyoCbFw-9ZA=
wSJpQbHpFoqu9OkgGMVxQPCA7rbFec9xUy6sn3922bUixicw4pYePb_rYgl4KSm5dChqZn6aKvz=
vVg9TAcZQqVlGC9yng=3Ds0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/2023=
/03/Instagram.jpg"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block;max-width:220px;vertical-align:top;width=
:100%">
<table width=3D"220" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=
=3D"right" style=3D"border-collapse:collapse;width:100%;max-width:220px;bor=
der-spacing:0;table-layout:fixed;margin-left:auto;margin-right:auto;padding=
-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<a href=3D"https://twitter.com/Jeffersons411" style=3D"text-decoration:unde=
rline;color:rgb(33,117,155)" rel=3D"nofollow" target=3D"_blank" data-safere=
directurl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://twitter.com=
/Jeffersons411&amp;source=3Dgmail&amp;ust=3D1712964835613000&amp;usg=3DAOvV=
aw3WFSunoGYEy-HJVS_TkPXn"><img width=3D"52" alt=3D"" style=3D"min-height:au=
to;max-width:100%;border:0;display:block;outline:none;text-align:center" sr=
c=3D"https://ci3.googleusercontent.com/proxy/WI86L4Ic4qodGZ3_eH-Gk-LINlNWba=
yimCQwmMszqw9KYpz50r3RHQIUwN4tz8wUBghWbc22dPyOOkQb6KhR60Dp4C7Q8Ty6PGHCBdM=
=3Ds0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/2023/03/Twitter.png"><=
/a>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;padding-left:0;padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0;table-layout:fixed;margin-le=
ft:auto;margin-right:auto;padding-left:0;padding-right:0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<img width=3D"620" alt=3D"" style=3D"min-height:auto;max-width:100%;border:=
0;display:block;outline:none;text-align:center" src=3D"https://ci3.googleus=
ercontent.com/proxy/24d5_odQdFVJ489EgCN2Ju2b6Znove-jPLygCq2E2HB7cduFlRWJPvg=
ox3e0Su2yIxPVeL5STjEdFVYstJ5BGJNJ0Tk7tpkqEf8NNeimgvmqj2sSBRAlqex-YUuA7DY=3D=
s0-d-e1-ft#https://bizzfund.sr/wp-content/uploads/2023/03/Missing-U-Cover-1=
320x1320.jpg">
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border-collapse:collapse;padding-top:10px;paddi=
ng-bottom:10px;padding-left:20px;padding-right:20px;word-break:break-word;w=
ord-wrap:break-word">
<h3 style=3D"margin:0px 0px 6.6px;font-family:&quot;merriweather sans&quot;=
,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-size:22px;line-=
height:35.2px;text-align:center;padding:0px;font-style:normal;font-weight:n=
ormal;color:rgb(255,255,255)">
<span style=3D"color:rgb(39,40,46)"><strong>Life on the road</strong></span=
></h3>
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse;b=
order-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;font-family:&quot;merriweather sans&q=
uot;,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-size:15px;l=
ine-height:24px;word-break:break-word;text-align:center;color:rgb(39,40,46)=
">
<span style=3D"color:rgb(90,92,102)">Ready to promote this song worldwide</=
span><br>
<br>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse">
<img width=3D"348" alt=3D"" style=3D"min-height:auto;max-width:100%;border:=
0;display:block;outline:none;text-align:center" src=3D"https://ci6.googleus=
ercontent.com/proxy/ayS7a877OfYudJhcFCO6ccfJlgq9f-oDr6QVNHBiArb-ETuwhf03bei=
80hnjhHUTqIyuUqcs64ZwWO35XqFiJCw4iqT6herIKeWUXeA9VRJbN5KI_i8=3Ds0-d-e1-ft#h=
ttps://bizzfund.sr/wp-content/uploads/2023/03/Jeffersons-Ibiza.jpg">
</td>
</tr>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<img width=3D"355" alt=3D"" style=3D"min-height:auto;max-width:100%;border:=
0;display:block;outline:none;text-align:center" src=3D"https://ci6.googleus=
ercontent.com/proxy/Y2bhDoF1ZE84UhSc5ybMffqqJpfFkiSw4PAJJqZkKv1_ppPr4LytUX9=
eME5RfRWYhDk1mraWM6wukTywvy-RbExsirzQYOoI7o72htINEOeGikTgKw=3Ds0-d-e1-ft#ht=
tps://bizzfund.sr/wp-content/uploads/2023/03/Jeffersons-Nemo.jpg">
</td>
</tr>
<tr>
<td align=3D"center" valign=3D"top" style=3D"border-collapse:collapse;paddi=
ng-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
<img width=3D"358" alt=3D"" style=3D"min-height:auto;max-width:100%;border:=
0;display:block;outline:none;text-align:center" src=3D"https://ci3.googleus=
ercontent.com/proxy/NEbCoU66ro3VOLzNH-QHiEN6C4y7nkWm59RwYNPhOOImMzeev5cJmfk=
DmKIX0hv_VrPSCJR7F88kJkDC1yWJFiQRMc7Q30Bgp77YbNxhoUMFV-P6yA=3Ds0-d-e1-ft#ht=
tps://bizzfund.sr/wp-content/uploads/2023/03/Jeffersons-dope.jpg">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;padding-left:0;padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0;table-layout:fixed;margin-le=
ft:auto;margin-right:auto;padding-left:0;padding-right:0">
<tbody>
<tr>
<td valign=3D"top" style=3D"border-collapse:collapse;padding-top:10px;paddi=
ng-bottom:10px;padding-left:20px;padding-right:20px;word-break:break-word;w=
ord-wrap:break-word">
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse;b=
order-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;font-family:&quot;merriweather sans&q=
uot;,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-size:15px;l=
ine-height:24px;word-break:break-word;text-align:center;color:rgb(39,40,46)=
">
For bookings <a href=3D"https://www.facebook.com/jkpentertain/" style=3D"te=
xt-decoration:underline;color:rgb(33,117,155)" rel=3D"nofollow" target=3D"_=
blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dh=
ttps://www.facebook.com/jkpentertain/&amp;source=3Dgmail&amp;ust=3D17129648=
35613000&amp;usg=3DAOvVaw1wYpp1OqxFulXd3yFDIMe3">
FB/@JKP Entertainment</a> </td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse;background-color:rgb=
(39,40,46)">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;padding-left:0;padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse;border-spacing:0;table-layout:fixed;margin-le=
ft:auto;margin-right:auto;padding-left:0;padding-right:0">
<tbody>
<tr>
<td valign=3D"top" style=3D"border-collapse:collapse;padding-top:10px;paddi=
ng-bottom:10px;padding-left:20px;padding-right:20px;word-break:break-word;w=
ord-wrap:break-word">
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse;b=
order-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse;font-family:&quot;merriweather sans&q=
uot;,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-size:15px;l=
ine-height:24px;word-break:break-word;text-align:center;color:rgb(39,40,46)=
">
<span style=3D"color:rgb(255,255,255)">You are receiving this email because=
 you work in the music or radio industry.</span>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td height=3D"20" valign=3D"top" style=3D"border-collapse:collapse">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>

</blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/012c34e0-dd8a-4e08-ac16-46d5c358bb0en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/012c34e0-dd8a-4e08-ac16-46d5c358bb0en%40googlegroups.co=
m</a>.<br />

------=_Part_168189_1578458091.1712878461423--

------=_Part_168188_309187649.1712878461423--
