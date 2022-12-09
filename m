Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBUSZWOAMGQEIRNB6UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9156483F7
	for <lists+jailhouse-dev@lfdr.de>; Fri,  9 Dec 2022 15:41:11 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id c9-20020a05640227c900b00463de74bc15sf1508935ede.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 09 Dec 2022 06:41:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670596871; cv=pass;
        d=google.com; s=arc-20160816;
        b=ncHQ7Ee3lW6Gs5ib5NfrBrnVAhshwZOdPTnyFnaSVk4fdVGeWMqZqiZij8EIKsJULr
         /yRwn4/UsDqO4tSkf6kzyytVWBIJjs/1SH0dLP6nXrXjezdvewwFAj7Mdi9glVBa89RK
         r1pa8JqOhISBwCFBXWvadvdz02lbxxpG/mXaMKDoX7HRVu25vNpnUdFgAGXkpqzCAVkl
         sUhMm3LquLj+TrHJgAZDkEoHQTRZdT1MXP4n1SkFA4BM0Yzqmtb/Ep6wLeACzlb4a8No
         0GpvxbeDhF1qmHaujJw1wDuvbAwV0ujCwpouzwQ9cZSWRMDyiW2b+ZqfpbNVzmPVZ+Ys
         sK/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=ewiNodgzRrKT2dV1doWzF6CjYzivQ+t5eJtiYFLVfBg=;
        b=brV6Q1s3cBDw5FyxdHzCOTKZFF50k/H1XXMqMfWw2MLHAwlGZm374YASVMjk0nv2ng
         B3tjo1LzcwXVdAfz3OO3RjNnfOnsaBOlkkRlL4nijseQddvucfBdHc97wuWBwDp6qlfg
         196/uU9F+/ci/qtL0S6PlBpVKHSk29CR3nUllDXChI5dbBXn4VK8uPVnuTQl0vOXAJ+b
         bntr4oju8ZP/82ehsyTVo+gU76/FRD5HowuyoogwEU3BJLv1u2jh9+jQ78hwURkywzom
         rJniyuqg5V+V0ZVlzXp1CBueB6aqATsaXa64V/a7ir2PeLBdvZgs+O27C2XYBz6T/Mbw
         Yrmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=NSioLrME;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ewiNodgzRrKT2dV1doWzF6CjYzivQ+t5eJtiYFLVfBg=;
        b=NFHqQdxPyRx3ovOOl7//ue6nAoJ/cMQhtT0o6yynwv7k/DIgZB15r2iO4PaCX+1SZ0
         UxCYoKWXR/NTJApimOWtqgkfvDwST+gROTKTbHjOpcWgtQV47fRjXAdf+kOqinppmbMa
         r+Wi5WmJ6ZTgYMs2mKayuI4iz/sPkfCHmr2ITuqZVU5UBRnNoL7tpL7F37xH1/LOT5xa
         jjg3+2x3dalaC86OhLqjWn9Q9u+9vkjkoasnSYnO+fc1hpooFnUpRuzVSOo3Iaex8ESS
         GiUNtEPu+m+8VWt9ZIAAQbmy5otfpdHz+i9lUguM/deYQSKXp5uWNAnY3tY8/HBVTUKS
         QqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewiNodgzRrKT2dV1doWzF6CjYzivQ+t5eJtiYFLVfBg=;
        b=rd7Yx7pElUkwgn/2VNfnhFqomKRrn7k6XfHW+Xu/q0QjYVkvT+fP/c/8jvmWWsOe70
         7PO84N0GHdlNs/M1ZrdSFZUdNPX/r206WdOdtNsZEQLvl5ymUYvbixPqSDX1WSU7t7fj
         h9AEZQY8aAbTw3UXa8D+v7KwCEuGpz7Ji3ChkkVL/hFnIa6xqY/XmQE76sPvl7wcUBzN
         xRUwN4eYGB00KyoI5RnR5UBFFjcS3a1hO+KGXn0litVK+Rv954jq27Ec2o0DHsgFpwOs
         yjlibh6A6Ns4Z4UKthIh93C1rHrzqrfRofTMqxZVAZkajclQc8jUaVkFceMeUMUNFVNb
         K8jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkeprau70RgGvi9BzPUyXqFaOl1ReWYx+6uYS7uL+RCdcMuNr4I
	3DWhNk8q4FIeEKFe7Tanios=
X-Google-Smtp-Source: AA0mqf6bOWFabFw0vs9ljmeWDZmBkZ2DLNG4fmaMNGVS6ktr9zys9Skiy+XlL8zXwbMETfRnAaJ6ZQ==
X-Received: by 2002:aa7:c750:0:b0:46c:3b3a:a75b with SMTP id c16-20020aa7c750000000b0046c3b3aa75bmr22018275eds.328.1670596870738;
        Fri, 09 Dec 2022 06:41:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:34cc:b0:457:99eb:cba9 with SMTP id
 w12-20020a05640234cc00b0045799ebcba9ls1082731edc.0.-pod-prod-gmail; Fri, 09
 Dec 2022 06:41:07 -0800 (PST)
X-Received: by 2002:aa7:db43:0:b0:46c:2c94:d30b with SMTP id n3-20020aa7db43000000b0046c2c94d30bmr2407758edt.33.1670596867502;
        Fri, 09 Dec 2022 06:41:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670596867; cv=none;
        d=google.com; s=arc-20160816;
        b=fR42Bm/7u63lKk8vBXBTV1Xj/hBCXvhfLgLe15x+rtlU4GzRAO58lwwN1Qw+sM5VJK
         Jn+KSHuJMydsl2jCzMW6Zf3UrTdEVTFkANbneommeLYwjOCc4bMp91oONx4s1fUvsNZf
         p/EU98qmNFiup4u+DOyZ5KZwr3HEuucP+Zfbc62wEsrY8anWxwkC45hyvDuJXbMvyyZS
         pJDfsri2LAEEOQAG0uEGvdV5Z50XR0SQtnl3KNTiyB8hXK1zZYn6s+9p0gkiSyRpM0bu
         FOziaVlEkGKuF4LCcbfjcrlyaKGHjYG/vt0kcUzhZOment6PLa3LP77uIN35VPDg1zou
         u6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I5vBsZTiqKCe3mfNgwPJxwL5MIsB8sVbuuhNNgqFtHc=;
        b=Duw78/p6jkGJdrJJpXGJ7+ac3ElZzD71MPdi0zC6RGaMwa4wm/M2yFuZOHR49uhRIt
         dBhNUDovhBNmZsAxpwHKCdjVJH3GItO/NctnKjeBWKo/wlQ4IDly8INuPyUsjZpCrh4V
         hVPWn1zb8+2U2nlxMAxFc/8OBdireEGmkbBPuSWm1kXemaQSPWj+nArE1z7DyWjKNQJS
         JxXiJO91EE6/ep/ikdM5fVdy8uPMEn8GNO0AZhVbeTzWkcCDLIsXPWYxQhOjBji8hf/N
         HTdGaJjoDd0p0hdh3eO73BNGBZOPr1w2uXxjTwW1tiCaLJHf97CNuIHW3XhhpFi/SNI2
         G5yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=NSioLrME;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id t25-20020aa7d4d9000000b004621a13c733si110033edr.1.2022.12.09.06.41.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 06:41:07 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NTDGp6ZWrzxsf;
	Fri,  9 Dec 2022 15:41:06 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 9 Dec
 2022 15:41:06 +0100
Message-ID: <2dfa4894-09d2-cf25-8dea-2e6c7e0d6062@oth-regensburg.de>
Date: Fri, 9 Dec 2022 15:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Help: Is there any tools to evaluate the cost of Jailhouse?
Content-Language: en-US
To: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <a92dcae8-653b-41d6-b235-81835a442ecdn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <a92dcae8-653b-41d6-b235-81835a442ecdn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=NSioLrME;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Jiaming,

On 08/12/2022 17:12, =E5=BC=A0=E5=AE=B6=E9=93=AD wrote:
> Hi,
>=20
> I want to evaluate the number of *VM exits* and other information about=
=20
> the Jailhouse at runtime.=C2=A0I'm not quite sure if the *perf *tool is=
=20
> available?

If it's just about VM exits, you can use 'jailhouse cell stats'.

Thanks,
   Ralf

>=20
> Thanks,
> Jiaming.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/a92dcae8-653b-41d6-b235-8=
1835a442ecdn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/a92dcae8-653b-41d6-b235-81835a442ecdn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2dfa4894-09d2-cf25-8dea-2e6c7e0d6062%40oth-regensburg.de.
