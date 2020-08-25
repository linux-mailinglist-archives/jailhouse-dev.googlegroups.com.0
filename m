Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEN3ST5AKGQEJ6NJ2QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id B9006251AA0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:17:54 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id b73sf794285wmb.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:17:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598365074; cv=pass;
        d=google.com; s=arc-20160816;
        b=SwGwwdGFu2WvKZFBNrfoR7CY+35nmf3m9CFXMKmeKZQT8LxKv7+FK53SD1rVvySNZn
         RO6Zl2fsHnWX77E2/bjYg8ExDr3SwR5FWA0GC1/e87WAWL298m8VD1IThgF4/IbKQT1m
         y4vi/upzK7Z1lNLPrfmlB41na7o58rJy/K2/fE64QVfQwvSQk4kX6ORxKY3X1xcarJok
         h5RN8XMaq4d5J9A8/6rpmJqiaabFwRRHBjr8hvhExnVeFzopDcRnwh7zSWe5HOBtvDj3
         7RXvqxPe7jC2eMU5Wf6qWOgE8h+0ry2DnXV9cbdDkyMGZKw4KBjx0NfjzI0DOhTkRtB8
         nLbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YS6TwJyu0/pzxCb5wd983fAhR2JO8HdIKBWKskIF1rA=;
        b=r9mt6tzM6I+tQV02CtE27mMujMs2cTyWBdySE/Yii0HCPmrqZe2DLVUKUJD/XekljP
         9cjmxBpwvMxOHk1AeNNiOjtgoRkcbgfeHdBtl7zWFv1nmD5VAmeGgSRs9kW5y6tb3LS9
         cjaVJ0mnPaTGwCNFEUg8vF+N+jZCR1P8aVYhVFx0C+J/vmTX/YgrUpZ1zWZIgyvn/bHY
         zsw84koXaUbkDLofm0aDm2g3Rt+fh7ZezXco6dxAiEFiuuyC5E3yTFHkRWuJ10cCbPXV
         N2axoFlbV/FMyrK7dl+73un3qTRcsJ/qMHCDHf0M9NB7b0+ZIQrS4dfbSL9UQG6+uaeq
         2ZVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YS6TwJyu0/pzxCb5wd983fAhR2JO8HdIKBWKskIF1rA=;
        b=WIM/ddRjWhAPAv5GIz0Tnylo/t1+DaVz3OpmbpEy6/pFXGhswQCAx8aJyRtmKyhfTE
         Jrgsy9tPxM1obpsRoF/vkG3S5a6AdmZBBe2FDqnObJoN2cKrpTbGTO9eWlXGnFaqj+Jl
         TlbrITgRalVO/pMKw0Jetv+RARPI0Djwms2rCDsi6aHyMzYj3ACrQczuNgs3cIehphbs
         UFp7nG9sg2+HZ+yOyhA+ilM1nr3Xu7HDp5no5144D53E2Ikx7GOxkm9ncW6si57zsFQt
         mkeMI9eebUVKXCYTJZMPUJQVowzA/4kMBc5x1yGa2QwFNJaSazPfLBG09OaxCNJRD58B
         /T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YS6TwJyu0/pzxCb5wd983fAhR2JO8HdIKBWKskIF1rA=;
        b=FqW+gBapAFvosb6zTshxsRBh01oFjF6Y04iVOkv/4yLPKdYBCWXSVfmGEE3Jdb1qux
         396TMJFqEkGg0x1/ncQl01vksqAueqTJ6jyrSaAzCF1ELPjLGUy0XHBAM7P5nMzQOtgl
         8i1il37vrJWtlNXE88GUPBE6DcWNMBNIVqGJJHsApLVHVYlH+FTWzHbsDIfxdyxKugpf
         nftyguCQ5hB3pX3E5sbjSrPzMpKFi/W0x/78hAgoBPWu1DToEXuZJ4189YMhDz9cynm5
         J3rJ98zmQzyA8NRBr8ODEyaSfl8VU5/GX6bM6bd1W4m0Esv+VamRYbRIY90xmA+VbH1d
         Ybow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532l7agebuY2swhmoMwX0xaj2oKrw9cqjZWexGQJuxL/7+cUC+ns
	w2z7hQGxsbrOdkoLGat8yZE=
X-Google-Smtp-Source: ABdhPJykA4YSfeSRZyXEsqliS/GSyIbCOFCm9PSzW6vYPFHFfUAJdKBg5uyhIZb7Tl5juxUh5OxLUw==
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr1146107wmd.187.1598365074431;
        Tue, 25 Aug 2020 07:17:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1b8a:: with SMTP id b132ls1342648wmb.2.gmail; Tue, 25
 Aug 2020 07:17:53 -0700 (PDT)
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr2388008wmh.21.1598365073464;
        Tue, 25 Aug 2020 07:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598365073; cv=none;
        d=google.com; s=arc-20160816;
        b=NlojkxMtoHQvq5NZCIvZPNHUxZcPRl8k8TdTcbabFq8VCIYEj2KSiUvYebfbcT4jhP
         Cvd1yoPaMBLKlT1KgwaKn/hoUoXv1duQeZpChfGEECtRBQY8UN0QHFloRqqxvvUPWv0C
         u4NEJqH4qi3721bGsGRkPRb+6S8BMumGMPncaLZmxy2VB1xrwcuphVP/t9te61kb7uBy
         e1xvbc7MZ5jWzJqHxWG3WyBq91+La8L7usrbVH2hqrw9lWBnC896ZeZu1uLOMxZ6jVqc
         /vLXhdtVBhPa/uNwqLO0gi99tF9p1UiDv1+iY8gL2Jck/sKwQVxEZ2fHqpTXPtr5nMty
         /w2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=AECRkrYjFeQT4xMMlTPiBGls4eFtXaQj+WKxFbaetrM=;
        b=doHN0F+tUZwgLoIfWHAYhlsJQ/pSLDwqnnfA9yZFvMCg6xxOlN4Ywad9YdbyAwqHg4
         msqoZE/i3ESttPY7PrvU0KoCVrUYzAnZYYO/rZ5n+7gr40w70MWV2gURtFNe1ErNM+Ns
         5U3W3qM76jCu/Qr8t9JcbWQS1DfXiDZ9iVg9BZULPKE8QtyaiEGakD36/lQ9qA3IwRUr
         cOpZRCi+WFH5dT0sFHacZxU9Kxv/dpgswAB429j9GGnx8lUDQwKkoj06n/PnFCDZGbLv
         3w3jJ5SjyPpQbWzkadqyhb2d7dT47xH+kXwZa31R816uAaBIxwUgqdEWP3Ponz+u/5we
         2Z9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w6si138721wmk.2.2020.08.25.07.17.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07PEHqqm030544
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Aug 2020 16:17:52 +0200
Received: from [167.87.94.34] ([167.87.94.34])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07PEHpC1008439;
	Tue, 25 Aug 2020 16:17:52 +0200
Subject: Re: [PATCH-set] pyjailhouse: config_parser - jailhouse cell linux
 throws an error
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
 <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
 <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
 <78f3909c-206d-46ba-813b-5dbe5872e7c2n@googlegroups.com>
 <335079f2-a73e-fad0-a446-4dc9d13f00d4@siemens.com>
 <bddbb89a-01c3-4d34-9821-405ec8dcffe5n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <27eba022-2f1e-6ad6-7448-c56d66cfee4e@siemens.com>
Date: Tue, 25 Aug 2020 16:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bddbb89a-01c3-4d34-9821-405ec8dcffe5n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Hi Thorsten,

please maintain CC lists on reply (AKA reply-to-all).

On 25.08.20 14:48, contact....@gmail.com wrote:
> nope,
> changed to:
>=20
> Traceback (most recent call last):
> =C2=A0 File "tools/jailhouse-cell-linux", line 723, in <module>
> =C2=A0=C2=A0=C2=A0 config =3D config_parser.CellConfig.parse(args.config.=
read())
> =C2=A0 File "tools/../pyjailhouse/config_parser.py", line 214, in parse
> =C2=A0=C2=A0=C2=A0 self =3D cls.parse_class(cls, stream)
> =C2=A0 File "tools/../pyjailhouse/config_parser.py", line 50, in parse_cl=
ass
> =C2=A0=C2=A0=C2=A0 data_tuple =3D fmt.unpack_from(stream.read(fmt.size))
> AttributeError: 'bytes' object has no attribute 'read'
>=20

OK, I was only fixing one patch, but the series goes on, and at least
two others ignored jailhouse-cell-linux.

Andrej, I'm dropping your series from next again. Please fix and resend.

Thanks,
Jan

>=20
> j.kiszka...@gmail.com schrieb am Dienstag, 25. August 2020 um 12:20:10
> UTC+2:
>=20
>     On 25.08.20 10:37, contact....@gmail.com wrote:
>     > At the current head of the next branch, jailhouse cell linux
>     throws=C2=A0 an
>     > error:
>     >
>     > Traceback (most recent call last):
>     > =C2=A0 File "tools/jailhouse-cell-linux", line 723, in <module>
>     > =C2=A0=C2=A0=C2=A0 config =3D config_parser.CellConfig(args.config.=
read())
>     > TypeError: __init__() takes 1 positional argument but 2 were given
>     >
>     > Thorsten
>     >
>     > PS sorry for probably replying to the wrong patch-thread
>     >
>=20
>     No problem - thanks for reporting!
>=20
>     This comes from "pyjailhouse: config_parser: move parsing into class
>     methods". Does this help?
>=20
>     diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
>     index 4178d4e0..aab82a5e 100755
>     --- a/tools/jailhouse-cell-linux
>     +++ b/tools/jailhouse-cell-linux
>     @@ -720,7 +720,7 @@ except IOError as e:
>     arch =3D resolve_arch(args.arch)
>=20
>     try:
>     - config =3D config_parser.CellConfig(args.config.read())
>     + config =3D config_parser.CellConfig.parse(args.config.read())
>     except RuntimeError as e:
>     print(str(e) + ": " + args.config.name <http://args.config.name>,
>     file=3Dsys.stderr)
>     exit(1)
>=20
>     Then I will fold it into Andrej's commit.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821-4=
05ec8dcffe5n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821-=
405ec8dcffe5n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/27eba022-2f1e-6ad6-7448-c56d66cfee4e%40siemens.com.
