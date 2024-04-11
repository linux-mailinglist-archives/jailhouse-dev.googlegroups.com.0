Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBLVQ4GYAMGQEGNHALOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F88A2101
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 23:37:52 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2sf399557276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712871471; x=1713476271; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KgRf/+6dFx5kPILB87HVVrm+PdozV5WMuxEX7VGqVk=;
        b=GYzSm4vtIzEOyIHUZ4jfDnuyGv6jIudk/ppMHJo+5oS3zhd11OGXGHWHw5bK6yVjmT
         j27XUCxmbHL7J9wH/PzHu8eHrPQ2js4uVv2jb7mKxlPsvmQzre4/ybU9a/TqamUylHKN
         oaVB4Ldo7dteV7R4IF9OaRdtTH8afL8Vjii6aSrRyGaYAJzyk4UJzzLBJvG85koKax+4
         GbW8Nfxa85tJPWp5OPIOv0Ji+mFkRzqiyWh31yFSNiAXD3xHPhf1ml26lx9K872K81TY
         zqYrLSC1jydKQbsudjowNwjmEFNunG04Riw8c0qs34x3W33IP9w+xZVCQdogHffJCeIn
         TdJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712871471; x=1713476271; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KgRf/+6dFx5kPILB87HVVrm+PdozV5WMuxEX7VGqVk=;
        b=XgVBW+ouJUJ+0Il1G7nrcFrudtcnna/Q7zrGxH0TAU8S58gh/sjhmICiWyzYojd/IQ
         uS2yfx9z6LHuLDX6NciBnkeAUQhoua5oCFL8xQlhtIYEcVBrQjv6h5v9QfrhCY3Ji8L3
         1ivDOz877nfmtX66GW02cg1JcerKDmwm6ru9BQBW5pGkxFYUk+qVn7DL/1f1/krU1bxY
         kAyifkEbwQ3/DY2wKnLCrHIf1jihwDJ7sklEZgzGSslCOrs3Yy0/0ZlR8dpDMftvWueG
         co6Xa0+m8FVa+lNkuzznCA3JHnNfCe+X5grXDvWt2H3Iy6VnJMzdEzFogOnUAkVZEEQV
         g7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871471; x=1713476271;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KgRf/+6dFx5kPILB87HVVrm+PdozV5WMuxEX7VGqVk=;
        b=SLOuWvzPEWXemjc1c1VpdgcxGR4WLjvUMJQgE/03RgmlXrYUepxnQN+/yHbmn6wt6c
         z4XOK2gqFAzZDEPv31DWL4FAHDCFcckiwboHtBtFsRpYuMURiPGSA+S7+IIUcU2E5Zl5
         M4pU3LoYVOqdPkGCNwBh2BBuSrseavK7Q3JWZo2CSZldWMQUSf/dC2TNNVYoPgQiWo1E
         Q+ntJEYr2npVm0/PvpBn0LUoIUYLtK4r5jNeGUqKNSLv7BcdUo59+fJ8/PoasQlrbQCv
         g4dnV57W+swA+pd+uqVxA5m3q19jbO4pWgfnY5HZFRjFGWdpxvsXII15fcDO/hgw4ZL0
         aavg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUs9gQWpbTrYy5fUUEbW+lCtNL+Z5eOnfCPZ3fjqdR9Hkjp1Qt7ZuNfCSC0wTWCroSihUwzO+UFDSYvT3gHfq5+ojKvKwmgPywzNLI=
X-Gm-Message-State: AOJu0Yyn5afTwoU6ylN0TvavM8qsVZ3q9YOKltZfFRZbdGTHFXxXbl03
	AMsMndFUiqrUJOiu+MZw/T3Bek4ly0TlWtwxxYB7q2qPCYZPsCgY
X-Google-Smtp-Source: AGHT+IFd0QdaNL1TLeLDZYOTAUcoMFB35JC8Yl3UG56XkBZCZv4qG14BywFsqOKE1yVkuMEaGfoD+Q==
X-Received: by 2002:a25:abc5:0:b0:dcd:6a02:c111 with SMTP id v63-20020a25abc5000000b00dcd6a02c111mr728515ybi.11.1712871471061;
        Thu, 11 Apr 2024 14:37:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d892:0:b0:dcd:a08f:c83f with SMTP id p140-20020a25d892000000b00dcda08fc83fls450515ybg.1.-pod-prod-08-us;
 Thu, 11 Apr 2024 14:37:49 -0700 (PDT)
X-Received: by 2002:a25:addf:0:b0:dd9:1db5:8348 with SMTP id d31-20020a25addf000000b00dd91db58348mr212633ybe.8.1712871469084;
        Thu, 11 Apr 2024 14:37:49 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:37:48 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1942af53-2fef-48e3-8d6e-ddf30a40d059n@googlegroups.com>
In-Reply-To: <df468a43-ecdf-46a4-bf02-31681d3ce799@oth-regensburg.de>
References: <TY2PR01MB3788FD2A0D643FD2E3930CAAB7B4A@TY2PR01MB3788.jpnprd01.prod.outlook.com>
 <df468a43-ecdf-46a4-bf02-31681d3ce799@oth-regensburg.de>
Subject: Re: Development status
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_142338_1408242648.1712871468384"
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

------=_Part_142338_1408242648.1712871468384
Content-Type: multipart/alternative; 
	boundary="----=_Part_142339_706912760.1712871468384"

------=_Part_142339_706912760.1712871468384
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

On Monday, November 20, 2023 at 3:11:21=E2=80=AFPM UTC+1 Ralf Ramsauer wrot=
e:

> Hi Chris,
>
> On 20/11/2023 14:37, Chris Paterson wrote:
> > Hello Jailhouse maintainers,
> >=20
> > I was just looking at Jailhouse GitHub repo [0] and it looks like the=
=20
> master branch hasn't been updated for a while (10 months).
> > Is this project still active?
>
> Yes, we're currently still working on the RISC-V Port of Jailhouse, and=
=20
> we're almost ready for integration. Therefore, we also have a bunch of=20
> auxiliary patches in the queue. They'll soon land on the list.
>
> >=20
> > On a side note, are there any plans to merge the latest patches from th=
e=20
> next branch [1] into master?
>
> @Jan: Ping :)
>
> Thanks,
> Ralf
>
> >=20
> > [0] https://github.com/siemens/jailhouse
> > [1] https://github.com/siemens/jailhouse/compare/master...next
> >=20
> > Kind regards, Chris
> >=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1942af53-2fef-48e3-8d6e-ddf30a40d059n%40googlegroups.com.

------=_Part_142339_706912760.1712871468384
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
 Monday, November 20, 2023 at 3:11:21=E2=80=AFPM UTC+1 Ralf Ramsauer wrote:=
<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi Chris,
<br>
<br>On 20/11/2023 14:37, Chris Paterson wrote:
<br>&gt; Hello Jailhouse maintainers,
<br>&gt;=20
<br>&gt; I was just looking at Jailhouse GitHub repo [0] and it looks like =
the master branch hasn&#39;t been updated for a while (10 months).
<br>&gt; Is this project still active?
<br>
<br>Yes, we&#39;re currently still working on the RISC-V Port of Jailhouse,=
 and=20
<br>we&#39;re almost ready for integration. Therefore, we also have a bunch=
 of=20
<br>auxiliary patches in the queue. They&#39;ll soon land on the list.
<br>
<br>&gt;=20
<br>&gt; On a side note, are there any plans to merge the latest patches fr=
om the next branch [1] into master?
<br>
<br>@Jan: Ping :)
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; [0] <a href=3D"https://github.com/siemens/jailhouse" target=3D"_bl=
ank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://github.com/siemens/jailhouse&amp;source=3Dgmail&amp;u=
st=3D1712957843619000&amp;usg=3DAOvVaw1Bk-KfsgREtiCZ-vrNaTdy">https://githu=
b.com/siemens/jailhouse</a>
<br>&gt; [1] <a href=3D"https://github.com/siemens/jailhouse/compare/master=
...next" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:/=
/www.google.com/url?hl=3Den&amp;q=3Dhttps://github.com/siemens/jailhouse/co=
mpare/master...next&amp;source=3Dgmail&amp;ust=3D1712957843619000&amp;usg=
=3DAOvVaw1oZF9I9zCihkKGeHqFPf8l">https://github.com/siemens/jailhouse/compa=
re/master...next</a>
<br>&gt;=20
<br>&gt; Kind regards, Chris
<br>&gt;=20
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1942af53-2fef-48e3-8d6e-ddf30a40d059n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1942af53-2fef-48e3-8d6e-ddf30a40d059n%40googlegroups.co=
m</a>.<br />

------=_Part_142339_706912760.1712871468384--

------=_Part_142338_1408242648.1712871468384--
