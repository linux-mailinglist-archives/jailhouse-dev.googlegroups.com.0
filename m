Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBRGXVKYAMGQEUFVU63I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B5893B0C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:42:46 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dc74ac7d015sf4624361276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975365; x=1712580165; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOr2rjP24LAtmpshbObogvaG+sFyQ/ycmyns04k2wj4=;
        b=SqswowwdVxKjLHgGG7e2x8A0LhbDElYPgV4iqtXzSi80hhNogopYDgVlVYYMoenY4P
         Ss4ARaa+IIMs5q/qmz7gdcqjyUxULQnWF5WPhesUapfC8ubb7/BCku0J3ckhwN2R/g+g
         PwIMqnZ7WQaMCiVoVupb7LrsHN5vLL43/0q7w7WhvEhFH2Jy1LJ9WubOBvMYafJ1wtVb
         wzg0/YYXuxVHjU0GNekFS3IQ/sY1JNCEP7xsDjQs2PSCH4VMk3Zo32QZz8Q1VPfhEwGi
         HibuEqp3IelngMBhzAYL/k5bltbP2Yz33akuVzJOpinez97cTF84Cb6Tk43ykIQQJu2E
         a+OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975365; x=1712580165; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOr2rjP24LAtmpshbObogvaG+sFyQ/ycmyns04k2wj4=;
        b=IkkRNt68ajg28VNQ91LqNr6XY1GsUoms7XiBmvtwJc7wd1r9VLnzWqDFARB/gx9XoX
         PlddbXpXsmp5koDnfMyy0pHxP7xAskBPyCzcHn6XMla9gTuiVjOhN54PC0/dmeHuEHRR
         /o1FHb4vQdG/QkuNv4xHukX9vlltTS38IStfFNr/ZXCXDbtpqGuA+bJALTmuXvDNs262
         RFr09FwETYvnYtQi0rieDS2SE0hNSMj2eXEdvjcssMUhMbuPIYSrv5YxVy2urhxZyL29
         j8oIue+/cPqnSzWi3O3m3KBln4qSEVMDQ6YEgs4y3N+P8cqqkIfCGrZzzi1hxQCK9w2a
         uVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975365; x=1712580165;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOr2rjP24LAtmpshbObogvaG+sFyQ/ycmyns04k2wj4=;
        b=TsEkM7Uu+RbnKoQH2TMMDFWfNxU/+PEXmZoPtnsik3DjY6K7ddm9TSRkG3gEk/b/0Q
         6pAuAN3d3Y4P94TzryufrXEDsNzlbL0YoHddBlQf7tpk0GPcBk4gJhSAEp/0qKqEWUJC
         XWRH3ygd6Pk707UDg1CE8aAiOm5MGQ0fvLPvJGRTFEvNTfQPZflvTC9F7+j3QO5K3c8N
         YnYtT889Sxjs0iu1bI8u0jGJqZ9t+l/cp0lIal2gZ56fyP54JSS2VVQQWrmXcRWhZwU1
         jQ6E7u2lWriH4CqjU1/naxOOdwt7O+vSvNB24dgJcxbYF695EKG6ylNSYHsASJrE+vGS
         NShw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUbSIR85ffvOnQpXpauYl+HLyzRSfYdCb1OT/GWRWYDhkfWT9PaZ6Y3h34ZHXocSsLYuWwX5b7dSuGhlN/b5Gknnsv9X27vZIyWCMU=
X-Gm-Message-State: AOJu0YyW7Iafh1XRG+Hv6BuBf8MEmXY31y0lWOPRBoKi6GXsIVfGtZQ+
	qFEGl9gWW2T8Ps0/LlnhPkTbUPmP1WSJuMxUp65o8QyIgA8+9HTb
X-Google-Smtp-Source: AGHT+IExlnLFQ5XStAlb92p0FaSpTI2v5XCHEUh8+zPuYxVvwTuMoCWqaRzVgCUsP8BkVXLSzPTjbw==
X-Received: by 2002:a25:86c1:0:b0:dcc:fe97:f899 with SMTP id y1-20020a2586c1000000b00dccfe97f899mr7248027ybm.24.1711975364992;
        Mon, 01 Apr 2024 05:42:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d3c3:0:b0:dcb:f35a:afeb with SMTP id e186-20020a25d3c3000000b00dcbf35aafebls307947ybf.2.-pod-prod-06-us;
 Mon, 01 Apr 2024 05:42:44 -0700 (PDT)
X-Received: by 2002:a05:6902:2841:b0:dcb:bc80:8333 with SMTP id ee1-20020a056902284100b00dcbbc808333mr2945999ybb.13.1711975363730;
        Mon, 01 Apr 2024 05:42:43 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:42:43 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fa1f60d4-2b90-4eb9-82a3-f3a6fa9d5d16n@googlegroups.com>
In-Reply-To: <eaddfc4b-a44e-433e-9c7d-cb9bbbe4351en@googlegroups.com>
References: <eaddfc4b-a44e-433e-9c7d-cb9bbbe4351en@googlegroups.com>
Subject: Re: IRQ way for virtual pci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_374240_1583972660.1711975363024"
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

------=_Part_374240_1583972660.1711975363024
Content-Type: multipart/alternative; 
	boundary="----=_Part_374241_1876431700.1711975363024"

------=_Part_374241_1876431700.1711975363024
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

On Thursday, March 28, 2024 at 10:45:40=E2=80=AFAM UTC+1 Yulon Liao wrote:

> Hi,
> In qemu-arm=20
> While running the ivshmem-demo example in 64, I found that inmate-cell=20
> program reading the [.pci_mmconfig_base =3D 0x08e00000] address will caus=
e=20
> an interrupt. The hypervisor finally calls arch_handle_dabt for=20
> processing. I don't understand the reason for this interrupt. How is it=
=20
> configured?
>
> Kind regrards,
> Yulong
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fa1f60d4-2b90-4eb9-82a3-f3a6fa9d5d16n%40googlegroups.com.

------=_Part_374241_1876431700.1711975363024
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
 Thursday, March 28, 2024 at 10:45:40=E2=80=AFAM UTC+1 Yulon Liao wrote:<br=
/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div><span lang=
=3D"en"><span><span>Hi,<br></span></span></span></div><div><span lang=3D"en=
"><span><span>In qemu-arm</span></span><span><span>
</span></span><span><span><br></span></span></span></div><div><span lang=3D=
"en"><span><span>While running the ivshmem-demo example in 64, I found that=
 inmate-cell program reading the <span style=3D"background-color:rgb(128,12=
8,128)">[.pci_mmconfig_base =3D 0x08e00000</span>] address will cause an in=
terrupt. The hypervisor finally calls <span style=3D"background-color:rgb(1=
28,128,128)">arch_handle_dabt </span>for processing. I don&#39;t understand=
 the reason for this interrupt. How is it configured?</span></span></span><=
/div><div><span lang=3D"en"><span><span><br></span></span></span></div><div=
><span lang=3D"en"><span><span>Kind regrards,</span></span></span></div><di=
v><span lang=3D"en"><span><span>Yulong<br><span style=3D"background-color:r=
gb(128,128,128)"></span></span></span></span></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fa1f60d4-2b90-4eb9-82a3-f3a6fa9d5d16n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fa1f60d4-2b90-4eb9-82a3-f3a6fa9d5d16n%40googlegroups.co=
m</a>.<br />

------=_Part_374241_1876431700.1711975363024--

------=_Part_374240_1583972660.1711975363024--
