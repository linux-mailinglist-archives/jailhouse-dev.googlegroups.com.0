Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYMU2GBQMGQEEICYPCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71435C77F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Apr 2021 15:25:54 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id gj5sf3237909ejb.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Apr 2021 06:25:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618233954; cv=pass;
        d=google.com; s=arc-20160816;
        b=HADzxGGvpyxIKOfKqavB7OqQdhtIHGuVQDpd8VKUzam6ATnUhownbmyNOckbFxH0OC
         8QKptoOzSqsl1BUMkNpjdA5Gx1pCEFmbA2HViAjgUj0f3lfg2exUmf6Rhs4A+mKRAsje
         Hae20S7FsAA64hVuKmRgrkfzFSnfMG9hOgobBq6jsxZ5nggH/PbYeF3WLdyDuDZsYeUB
         VVHOHy5rNeizDKpWDh2N+BXmEkMqEODHEpr9NAkt9lP8Js47LKoMMdTF0OCibsW7NzXF
         5YNF7t31Mhg2rIs6EbQCBmezra6+Q0F91P0quBQ5Wj2l3Aa7/grBs26pJ7kiQY71jXFT
         CP3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tAILtTADKv/CIB29s0uReWYPQjot2wicp1t88xLFwJc=;
        b=hTvQJrf6bB7VDLpjYNQH8+gBI1q3SQ+oxHIb5AMZTcG4IK+oblAt0gfsLdtsXo+VAe
         nonbCmy8YKANQjyCY1m2smbesumn42r0K63bt6c9niD3iDXzy620+I10ZLN+w2tWlM8k
         9FbCdNGT27XKYPCT6xWVPYdKCF5z0AdCe3i5cSrDSLtVcaMe7WV3MK+GKZarwXye95mE
         zH0EnMMhlj+tjq0JbdHKY7tlVXev4c8Qf0HR6BGpG3nrVf0j9QsgL7cU3VfeKHsChozd
         3939AD3fSha6PdJU1vGeNm80MJzF3QYQkxzjRJAoNh6e3kjvLDTVmMDDKRv7Eqq/+XQA
         uacQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="dEM+VS/j";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tAILtTADKv/CIB29s0uReWYPQjot2wicp1t88xLFwJc=;
        b=TsfrNJtVdgN/6Kxx4zFwfaRf5fb6JsVa6jJ7Ccwc5yuHNYpAG0OMcoEQrB8So6T3ce
         jYateWRTb1s98byQSCe+oAVqEaL7imACQQ3Oqoa3xFgEhDTSHJkz9IrxaaKd4NsnJv4Z
         EaNXhM86dC2Nv63MYSMgCeYh+bpqm6h38enw00jyrGftEbtF573aIdviC6KbwLRox52x
         bOaYP4JCXchirqCmiLW6At2B5xf1LB32gySSGjZgKqVOIp6m4c0Cqnr6t8/lj3nCspI9
         7dePBr/00Cir5y5o9mekmGHq/TqvF1x7F7g5bglM3wHTgCQdTJCa98aMUYjgGYe5YHYb
         nirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tAILtTADKv/CIB29s0uReWYPQjot2wicp1t88xLFwJc=;
        b=o0LdZDRCG4SZhgJw8yV/MEHRhfV3EnDKP2RVxm34TEIk55y4VrLKzMpZS3YdgOxggg
         8df0ps7G42G7evji+qxytWfxI5O0wujhSbqO6VNdL5nVjz545kb/eCyCu6ccEWIrVr1b
         x5HXtkmW+tkPELsD9l6Glx+10to70chgjTwJey4vp+n08uXtYgiF26dWBjsqQHK53mK5
         j0mKXaUOsg6ipODulqlq3UDwWDZXeqJIE5rap2pjXz3Bj7FPyhn6l7Dlww79Vl1uVd2E
         krCttWIyT7uMZ5ElWgzstBsSag5qr7GLwbf8GcS896uo2zPzhL9c4hp+rxjGL5y5Il3a
         Roqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321ZZwyhzI6RBbxioNZX3+98+zdEzLZqKmhWUWnIYOwXUw3RxhH
	vt48/YCNB98GzVHMLaCZYdo=
X-Google-Smtp-Source: ABdhPJxOeoxykPfn6rTtcSWk/nUSQq0dkvrSKM2vRwFeCpDMz2zVZN3y894TtKbK9ARN3v8n5/8InQ==
X-Received: by 2002:a17:907:3f10:: with SMTP id hq16mr27378406ejc.181.1618233954068;
        Mon, 12 Apr 2021 06:25:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:b07:: with SMTP id h7ls549893ejl.7.gmail; Mon, 12
 Apr 2021 06:25:53 -0700 (PDT)
X-Received: by 2002:a17:906:a103:: with SMTP id t3mr27786231ejy.334.1618233953001;
        Mon, 12 Apr 2021 06:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618233952; cv=none;
        d=google.com; s=arc-20160816;
        b=VKyEZF9/lpuDFyw2Ur6B7MrNqJiVeN0hyi/oUAfAqIH5wW0LFTDLFy6F+9RLKAJe6l
         DwiD9bV7XNqo3F3D40LvwBsw9X2CcB409WkX20dX+HO3GKFKBMcmhO7EBdgLly1DtwSr
         jwRQx0iclZg+gvm1Qdqaw50h0wKLL5u3vLkkVC5bPK3VLwkympgDgkwk3fUGUwHWt5WV
         YucjP0ymwBODKvKjrCJNuu0H5PAeuV0/v7f17Cr/qb+7siYpzaA3KL2GYoAGax6h6n94
         U+b+l6w8khef3IHI3T6jU58dMqR7JsSG/63FKgTnl8vJlSq/Pn7IsD+LLYe93i52Orh9
         UETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=m3tXm2tskEPf8XTf5pbCHYsacZeJRW6yYOlfdcqetQk=;
        b=ihzs2ohSHsfP5MBSwGojyVtBSqNnuWbaEYDsw+PGJDNqYMPRBjHonoeN7s92PzSIBQ
         an/MU4UBF74sdRJ2OaCu9JT97wpGuFL76o+aaWUEKN3PqeGk3lQvwIPkeGApLunlqUrq
         nnsRkfLEzvJ4EBqHtbLdt9zy8haPeg69BGTfKOILCLxkQwFv8Y0lr53RTZJojN6oC4KK
         7bIn+tAm2qizXZtTA+thU/eRPaqA0+6eLUm3c2842olQL0Zgv4fb+MaUasG5QuEewYZJ
         8UcMmd/+v9t3c0nygMYyeRlKrHZqLVIT1mfP500vdpXwEUlDkWlTBIXwqjRtvMiN3O9k
         DtSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="dEM+VS/j";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id y16si1025651edq.2.2021.04.12.06.25.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.46.221] ([88.215.87.53]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MWinD-1l48x10AYN-00Xpl4; Mon, 12
 Apr 2021 15:25:52 +0200
Subject: Re: How to build jailhouse in Raspberry Pi 4b
To: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <96f74988-49c2-45b7-be31-67bf46c75cedn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <680669ce-69bb-1403-1c2f-8ccaa317baa9@web.de>
Date: Mon, 12 Apr 2021 15:25:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <96f74988-49c2-45b7-be31-67bf46c75cedn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0CTQazc3rjQcJWk0/d0/nW1kNBtlxBMgK/lBsm7pK/du2aSQ33Z
 q802cHriJdKBs17cPJRCMvAII658vpbrao756TyMgs41uB1aJyZYJp+MZiGNaiQEsffau2M
 wAxvraagSCokAirpO94ohWM4pEXuLHVHizOBEtf+z9Mmc++lQT2AGkQosGgNIJdT/7nAm86
 mRCLeCjzKSTmjmwEjRXrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LYu0QuOAzIA=:Xi3nqFqhv5JYjeEumtcm7V
 Amk/XJSqClSMMSSQ5xZR/WLyIqiKz1vRZ2E+9i9o6s92Zi0CGD3bay1E++Ktwu6a88kSqRT3d
 d1xv5g5ntOKh1Fcj9qwzP/scOqkcIy6XYcxQVutsqjltNmyqdU3DzZBD6vnOcccvXWFxr3KGu
 vaak8alRF7APc4nsLMhv6ZKqRTcStMiwkFmIrj96l5vDeP8mIf5ODGjoesI+4yG1pz+DXR4Qy
 YIsEiv+2ogpeGyLaxSQ5pTjlGyO6wUZ9vOBUCkoEl0D7CrA0FQdNabC/tVSDAUipyanVAg5x8
 WU6zm75RHTXusl92wKtiaX/SpDcE1FP8WckL41YXkjxRlTZpeI6j90B+PBoPpgts1dfCHLCO6
 wtddbL1Lio2r3aB7xCy1t5/iO6JK+KMJCwCdN5qKrF0qI1oz6N3f6/RXofY7waeJr0UMcwH1I
 eIOfFz10ZLBBDlHNrSOMuNNlw/yGtjWBKnBwpqV5qOrbRZTrqhiMjtkeYnrLOc+goQ+FMKUg5
 /uNhN4brp6ctmxdcBprGIRnpGaKQIfd4lyzO2MnSNWrbF404cu16fZFdRlBv/wyDQNDKtdgd7
 fQjffuTOdcCFU9Qcl/sGvars/fC7NxQQEBCsANZOdTZXdsZOdfSiyASVYSh7imi6fVaR96Apb
 jJNXY02eBK1lNhf53XcT+b1AStABhWNdvW6YucTn1/BGbVEe685MMWn8Bs5U9ESXlDMFXCZ7M
 KZ8xD9BGlFL5rBvR6MYpzzg1U2FYsl04pixroDgDdC7EXTD8ArUyi2ubuCuTPCtihlCI5ojmt
 3lxS3hjJNJzRQ1lJgnLu6rKuTZsFvPAngMUcouozvsB/kbP2OwJ6I7/gt020FeoLJmudP/iP1
 fwiO59QWX3jRLzCogUPozfo6BLElatC5H32oVFCNaqlgoFmcQxgcRn6rbzVzdH4tZyJfImcTJ
 sGkitxaYPs2VuU5WjwHOxCsKt5ZP23g+FpS+fCXlhcIum7P9UuQZBMBmlzLVSfpHivqCUZYDa
 enFZa7EU0SSKqs/E48/zm7eDOdzKTGLOxu3ri2ZbFQEocVE/Xk/lCxcCvckkTIKQ0ufqtEGOU
 jOkUK9m1QM/9sjWcQGUWe6OgWu/RLh8tHMwBcXRnLWlk0X+T/+cPUYKqu22HDthxT3ux+8MB4
 F9w78J2ElkgMv6wZER3+IVm4g61Wpywpq5P4OZCrzAp5In20epU7XPyZwqEdOr5dkfv/o=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="dEM+VS/j";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 11.04.21 05:20, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:
> I just want to build jailhouse in my=C2=A0Raspberry Pi 4b which is suppor=
ted
> arm64. If jailhouse is support Raspberry Pi 4b arm board now? If there
> is any page for how to build it in Raspberry Pi? Can some one help me ?
> Thanks very much!
>

You mean use 32-bit ARM on the RPi4 with Jailhouse. Might work with the
existing configurations as well, never tried. But what would that be
good for? 32-bit is slowly fading out, arm64 is standard on hardware
that supports it (downstream raspi does 32-bit only for legacy reasons,
some images for old hardware).

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/680669ce-69bb-1403-1c2f-8ccaa317baa9%40web.de.
