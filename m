Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXEVUTUAKGQEII4JZZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231F4A60F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 18:01:33 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id l11sf30704wrv.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 09:01:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560873692; cv=pass;
        d=google.com; s=arc-20160816;
        b=0qQHBjRmC5O3JprGkdPUHixQmT8MnghKozJ79gesb5VdxC/StkrBmtEaHec9haR0hI
         46ZGmRcthWmioCja8+oxJuIWUxmN7KFV3Kd5F7kCSRGGMyvLDYY+eHKirJX5sV136tUL
         GRXBDYam+1XCAnzibokgwKIL4gZARQFJCj9auDM2DZra+u4Nv9uiT1FCv41LqN89WiZe
         67s+RF+AdhJR2UwhCZ0zNYUUxzFiC514+PlZlZ1qgeJECNex63usgz8dL5afpatshNeJ
         snuxF0oILBlLKcZP7opRnG7mgABaVJ4r2QWkIELb6vcuonM6iQIZUh3j4+/PBfVBlqYj
         0KNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=E5nsvopQ3onqSLtC9whd7U46cXVEUV3SThI059YoCHA=;
        b=0DV/2HYoHWZCLHaBhfoRvnfkEgz595WkY67Ut3+71aYdvwJHFUWfAVH1SvS8E+PJJH
         MK18SRpEdI4CPjne6l/WHHTF372CuLFIwYLJb88TymdXkzMImGA7X0eng/oWiO34Lpg6
         TX6nASYVbtzCiifZHXlvTDjfM98JySHRgzxFkRvdh7w/VG9Lx1Oajalh/5Z6/c1lVd7W
         QudaReUgqeLGZR1uY8iijt0D38z3Gvbhgs9Z2fenB01zH62iQ8CNR/VeOVsi0yjA41yr
         xSd7wBn011s2+gggtK4gREf4WgW8JZQZIpDpFUrR85VhsrWeCrtTmAUpmoXqE9IiHHSS
         olQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E5nsvopQ3onqSLtC9whd7U46cXVEUV3SThI059YoCHA=;
        b=BM3xt0lvx+WTH8FzLxTg1Y7oE9AwEEvtwWz5V4xkODY7mbNS/13wEfObSxiUSw6Gn/
         tTbpmb9QnTIKR/3tW+p+WXSUKK5gFkCPPR2Zw/2RPjXeT3WSFylFGo14KCbiZpSOmDgs
         PVeWIXm0Gan2khJTjZMTCZyFMSrxuwpxl6ZfLTeG2CC7L/mj9T3vPe6eKIfvwvKRGgdq
         heFEs4wXb36ww7W89UgG+7yAIAWS/bpAO5MpxTMuLrz286jWhQu45/hIQltFovM/xRw9
         9/u2x6BxcyGbqmCaOtW2n0tQUOq9rQ4cINs+8z+mChvRD/mOo7OSbWvLRpMNqbQYOI/d
         7HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E5nsvopQ3onqSLtC9whd7U46cXVEUV3SThI059YoCHA=;
        b=fw9k/AAUuKo9Eck5TgwiM8+RpXzPvIGBSRWhzVTWRcctfqqWSF8TkNrpNXxJuJ2aoB
         lkJJxOBOHyRDieCnIkuN3zwbsIF3mxgI6+Gfukew2nDXqnt06Qx6k17jojuGQvh3+sb0
         Q/WEzKcS1XZnew/xNcsZeBYLdc7kkc7cRnDg5RHaEn/hAQVGdRBP+jzNk+e9bXKg03wX
         LVbGvsIyaTInzN00gsX5VGS94F9Prdjy6pVJaM6af+yGYsBIvQS4tyP2vUlTq5VMWTFT
         KEiANLaSO9naFDOuBiDlwSHj9c2pFSAM9UD1s0xyOZNBLDgOiPlEJw8CGVRUXRy5t3M3
         MR7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXy0eKKZye1YGtns8h4/OclMjQ7VZ5YKGyaBYCPH08q4CPcLctB
	p79cEOkoSxiWQu94tkORugM=
X-Google-Smtp-Source: APXvYqzjhSWKvQZMQaPqAjHg/+VgFlViiHqmiD1mNga9ypAvNSBn3vouZjG59Nna2ifxARO9CIl9AQ==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr48542615wrv.61.1560873692713;
        Tue, 18 Jun 2019 09:01:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d02:: with SMTP id t2ls1157544wmt.0.canary-gmail; Tue,
 18 Jun 2019 09:01:32 -0700 (PDT)
X-Received: by 2002:a05:600c:c6:: with SMTP id u6mr4334322wmm.153.1560873692067;
        Tue, 18 Jun 2019 09:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560873692; cv=none;
        d=google.com; s=arc-20160816;
        b=dvIuLpEptKrciu4fXnA4i5F/syWuWbnQALGxSJOIBcwQM1RZsr0bwXWUJ4VnsZz8fZ
         nQ5lGsBnVpLSpgbvPBDeZ+hqZihz1J62waKvYVRilvPn6vUSG56uZjK04YfgJj54XUjz
         zgt1qG62L+TnvxrecI7pcsowtHDIoBdg7+ynNfhPnFfRJfe10LefqyUyAt+/BX7HAejc
         A5WiRtDppqNqtBBVDf39IutPa2DTuh+pk2p2rg+MDtTBwVlhWXa2KDOpU7vNgaAqut4W
         KavHFMqC6hAWF94Ls8wAQY7RJufsDp469qs6XwrNU8x0qH94oV0Y54TsY37QROXWLaqQ
         sITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=VOfAW/5ZBPOSs+8VZNX63wQz8uSQs94gWDiHrZ8o3wg=;
        b=kx2CJusoFfAWTGYpkZlfFWZg5cF25qs08k7xsQS9Sw+k5gPvNfb8H5CaIAAKm3ibyB
         1Hyv1l0RziiTWirKPxWe850K0urFZKeWNjvy6/eRyHERM4eSghsiP1vLxPmHmFeO7noN
         j8O6fQe5/D+nKuUhJDotHo+wSflrMWiPJ7pjr2Jge5NY3NKEfjU4cujoBshmwREO47Lk
         5YZakxtRuX1QP/O/CSLmc1QXCYhR5IxIZ0s/Prk/+z6S9y/2+EKzu6uzazg+iEp5Kx0a
         ZTQufc2PY1qSXFjJ7yj0nVghGk5aLW5nid/uMgwNb1BsGUG5mYGs6azSv7iJwwyk7TaM
         JD1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h13si722462wrt.4.2019.06.18.09.01.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5IG1VGT017021
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2019 18:01:31 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5IG1U9b031679;
	Tue, 18 Jun 2019 18:01:31 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de>
 <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
 <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com>
 <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com>
 <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com>
 <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com>
 <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
 <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com>
 <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af@siemens.com>
Date: Tue, 18 Jun 2019 18:01:29 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 18.06.19 17:48, Wayne wrote:
> Jan/Ralf:
>=20
> Ok, with the rootfs.cpio you just provided I can see the following on my =
serial=20
> port:
>=20
> Welcome to Buildroot
> jailhouse login:
>=20
> So that's progress.=C2=A0 Is there a default user name and password to us=
e to=20
> complete the login?=C2=A0 That would point to the problem being booting a=
gainst my=20
> initramfs files.

"root" without password is the login.

>=20
> Also, the issue where my serial output scrolled continuously was due to t=
he=20
> capture method.=C2=A0 I switched to minicom and no longer see that occur.

OK, consistent sign. Then we are back to a size issue, not a format problem=
: You=20
larger image is too large, but enlarging the inmate does not work. If it wo=
uld,=20
your larger image will likely boot as well.

>=20
> Any further thoughts on why jailhouse fails to load the guest when I set =
the=20
> memory region greater than 200MB?

I need to analyze your config, maybe try it out.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
