Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVHWYX5QKGQE4JHWJDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A627A726
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 07:57:41 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id 134sf1584950lfm.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 22:57:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601272661; cv=pass;
        d=google.com; s=arc-20160816;
        b=ojOfRimavE1YlfRpjlqBXiKoCG1U7rqCzR0KZ4cvDZr9jXng0khzdTT4avGiYMq1FQ
         BlYl1/BVf2nJ4PculuWOGSClnSDOpVZfhnIwrlBYwiv9wtegtX0sH455WDGpUfYy+7S1
         u6fDM1ZcTHPAqnfTqlhmxJd6J4EMrqWR640WuOI1wuF1gJX+j2LKMcXq+YSjhDSgv168
         2xPIALFuugAzGu6czKgGLwbSoWy3pJzldDCUbx6pjI8frRHPTMU7M95Snm7QYFXdq3xZ
         23kpHIj3A2Grw4Bmi8OHXkVee0UF9h0pnHJHQcb2O5ViGGaj4wRXgEUXEVgF8p5qk0Fu
         GOfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=HU9U8RlRN/p4x+f4GljU3/ybVRIGfQ++1L0lS9wGDhY=;
        b=exHgUSdoqNXdyfNBgNrG+nxUzEexCLDqTVHQxphaoo2WE6Z0LCum/eoofRE/APTL8F
         ifg6bKbaSAVlyhQ25Ff6ZrYDigBd/SFfwYbZlU9XEVVaXwrRH9GF6GgTSVYqrTuktsnD
         emBanUDOZwFsZypsSAd/evZhKr49vK+dYxcEBdFNhenWHqK605WGSToq3faiFdEdm1Ju
         +Vr3PtW5IyXe+S0QVPtTvC5euNM6BoXPmQAaAS1SoW8vlxlfaV/NGD/zJg+Dw3JbvzYE
         33bbOil1XvB2aWWdVUA44PcMyXfuKKd5+z6AFrvBkgaw+/A6KBLFrNtx+PMAjzY8oFkd
         Aw9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="NiN/duR9";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HU9U8RlRN/p4x+f4GljU3/ybVRIGfQ++1L0lS9wGDhY=;
        b=oOfmaV9AiTtWs+Goys87aBgJxbN9CcRm/5au+e200a076b8jIi3RpgFslCHPyoHK/j
         tPaqjlTKripyHU6goUUyLsrEntVhSckU7WdNMRm4O/mI7kxAyhdrvq6npik/xS/Q/tKg
         RZIOull6jlQT4hiyO9SF48OBLbTp/cG2GTcGd8V1pqCFGLb1TGdejWtfzhkiaRRdACPR
         OQx4hV2bJRv2cnbeaaQuJRRCZIo7XM5/BBr/cgEN9ja4j2jsH/LI3vjyw1Qz2wbKOyKj
         SbO1LQL4XySfGshYykCEI9N+kZZWD3lXBj0p5rVoKKRdSR/B6U4aCwnQ3aCRNwVBhiaD
         0rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HU9U8RlRN/p4x+f4GljU3/ybVRIGfQ++1L0lS9wGDhY=;
        b=iMgsCEXKvmm7b3G4yKGnTjc8ZKUGib8e4vdizyXeVzrui/1J4so2WAXwLa2WwRdxFD
         /uwQ6pO0WT2Dcblsc1JBvwvj6bFhdKUB2uyxzsIyw7OeB+WGVQFZMybsAheXsOaHN28D
         ZNy+oO1FWnFD+Bj8uuoyxnjE+0HkRqBFw+/ZwB0xMo0qo3gtykScuOjz+W2tGGU/058/
         wkTQQZdY97YoKTmXOaqDCwkbDomq6/LbhvWPmhEREKJd5fJf6vx2dRYk2rbo4t1MjB0F
         yg4+oelfD+xIugIQ3f2tAe34jrkWd/GIZe7PsHDdzAQEtQ21KsbByjTrdyX3Hs4CIz5t
         lyJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531SMkEAWp80yV3IaLIV6z6HdUQnaf+zZ9AT3LpBsOddzBTgsd0A
	UlelQ1UyQbngVEeVPYb3gu8=
X-Google-Smtp-Source: ABdhPJwBkY2x33D24MVoNlXTGsAE14psFkTgHm+DWfVrD/7AaEDJbt5yILw59dQswqywMLTt+4kZpA==
X-Received: by 2002:a2e:964b:: with SMTP id z11mr4770109ljh.364.1601272661398;
        Sun, 27 Sep 2020 22:57:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls65132lff.1.gmail; Sun, 27 Sep
 2020 22:57:40 -0700 (PDT)
X-Received: by 2002:ac2:5dd3:: with SMTP id x19mr3690848lfq.340.1601272659961;
        Sun, 27 Sep 2020 22:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601272659; cv=none;
        d=google.com; s=arc-20160816;
        b=pG0waBE7nQJXgPLGKbwfpZTrV0/snnHlLCa3iSrc6ldaRKA91hB5yUW+Fql/kJ1gDW
         PEGrDB9oivrGpDM01BIAa/KkBHMdHAWkRc/T05Czn/50TsiBGuDAgI+Q1cZukrjlAaX3
         mRfacEehgaTtwsSElTESlkSrXlP3KffqMYfxBGjdca8eoWOKlhDzBR0BV3zwpm9b9tMn
         tSPdXf0ibKcOBm4WRF1h+/l7KbQo5VabNY18FPno5flskcMdCNQF7XBb77nXNnUZlvyW
         Ba2XgNMkyetawCC1IqM25VlnOJfHv08UIklK9WLNFeyFZwezfxZNdIFlr7rJvorgoiqg
         rg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=pmSlm5JeBF7ciMskXWJ+2TLLot3t29TB5rMj+z3hheQ=;
        b=gpAYt2uoebY3qfc69+Y9o23xYaN2A2bOmsL1+s4MAG8+HhKy5S1tYdKsSzlIAyPU3x
         NGxweGzFSE77XFW9wnAsN1WEgxGYhVX2K7MXHYZ//mb0buaPXld8ROMOo4r8HbOqtK3J
         CUN74c9DPCB05hwQGbsYQ7Z3CRVpNxrgwVD6RJPW00qGs9OeM7sw4V8kTYfolv1XLstz
         a7d4WA3Jl8eNp5Wma0KwGUFD4A/7tk1HfHfPGywJhxwXPX7NgQZfzNNK3ilfECCmo0oZ
         27lml6djTg1xFjG9V8bpJfSYllpJ1cYvmGf7udAdU19xRK/ICG91QeFYgxYliSzXLTvG
         Or3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="NiN/duR9";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id q20si164623lji.2.2020.09.27.22.57.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 22:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Movne-1kmhjR0OI2-00qIi7; Mon, 28
 Sep 2020 07:57:39 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
 <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
 <AM5PR0402MB2756949C49DAC709F669D7F388350@AM5PR0402MB2756.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <59ce287e-bcc8-16f4-ead3-ff4bf8211628@web.de>
Date: Mon, 28 Sep 2020 07:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB2756949C49DAC709F669D7F388350@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L7ryQUBtFpCMstG7cklIvV6VyMUvgzMLPpo8z3KiIQNWILg10zI
 q8zKyP4TuvWQGoVwWSrAadw5WgqL9uFWl85a8f5gFV13y6c49LLHSzXGW42VG95et/WRT1/
 L6MR+6NFV7vwskQYNAPIs3ziQwSwMNSkvmKp67JGfslg6DjUANYezZGDkGW56/lN2QJSx7y
 Nrtk/wU4tWVxlGDTO2EGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G1MZ1/FuQNY=:hyFdeFM5Eu7MsHcBzztFJ6
 tlhhapxe88mLboXLVlWukbRasDmG6WjABDgC8A3ZvwpmC3Abq5/cg/iU2wVUlJIrQ2+cp22Ts
 WGmKL/7sVZyTRp37oVHeNlkp2Gv2g1gjsSodyvWX0pfszRLulqWmLFYBVz+2dYd+q6fFhTZbH
 3RgJhJXC3Z9K2lB68JlhWeeP5cjzeVv/wBmXrtKKOfO3CCFFI160vSNCnYtjSBl8aH+pReYe3
 O/TaNByvV3ehf0StVaha8lqk8Xpu22UMtLbOCA+ajG9JqovnK8oDNYWtmcNOIa7UXyHcBJq9o
 zt1evGR4Rtb8cvETBSdpBagFQzWHYDYgFvjsYb5uk/fJwC84YE9y2mrS75iAZAzo4GIDkv2px
 3VR/gH/p7evGiaOsLQiqUfLR1LuJVe7xQQc4Xhmc36QQqQd4JktGRu+tf92Q4kX2PANN1Sxz5
 hDmckr5Sc635sKaMmLdxEaa4xhti+UaoQ7Nrv+5KXghwK12mJWKZrPeUgsScTqx3gm5I+TbrD
 qj9MVdvloN6DW56EHaivRdipMY5jjSAHUWdR7YOHQ8haQuzDE4VTxbo1HhG2JHgFaVR90TZ2u
 ZaerSVH35wHiiiTauz8DV52tg0eBvz0lBiOz35gD+06l81qo7zw0LOhO5k2aelhbEOnW3hW8p
 8dyeEhKQ2dgGc352bEH1guFxI4K3LQ+D+XffbwR0Aym845lX6kfWZg/u7nqA+isRmHzu2z85q
 +EVwm7R7DMZQipXhN9d9CVF22Z52Zg5lJQrO5/CaUA1f9DJKuBdxErnPL8ALavKDQAt3hoaHd
 hNKPHUtK0Ye2pYfxeEMPCFwIVASnSPT+OByQgM2Y2vI74DkHCFS/RxsdRpBIaYZmnL5Gnz3bd
 kZKGXwNTm/3/uWDDxyHOFAhWTxNWkMH2sCooA7WM5veyB1H1g3O9iUgqAhgW47z9iUHDZTX2m
 zrW4eIGPwcIwD+s8Crp6wwY6H02QsqWSM3g4aCzdC1kfFKcE1Ee0+SE/rZZk8uI6y6V3N2qSC
 0vK2LCmIUjFvIFSgTdKz3kMicvEcrEQAnTIOS+m2jqKxDY3BtEP5LFRIvaKmi/mvNYVnCKeon
 jL5WTrKllnU5U1hGXhJhEn4IottSnhGi6sDMo8U7Lr0zmYUZqKWAlNr8Nl3SBrdwaupXverxM
 VZWt7uJAkleiueKa3inu6IOrnn8WN6spZ9eulrpj77tXxolnzVUHOAcGocCD3DnoBuxYoxSGL
 QRq7J/2TRFvvKAiJI/ElQ2r1J+zIp5hIv6DjNbQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="NiN/duR9";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.09.20 03:14, Peng Fan wrote:
>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>>
>> On 27.09.20 03:13, Peng Fan wrote:
>>>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>>>>
>>>> On 25.09.20 09:55, Jan Kiszka wrote:
>>>>> On 25.09.20 09:30, Peng Fan wrote:
>>>>>>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration
>>>>>>> files
>>>>>>>
>>>>>>> On 22.09.20 08:45, Alice Guo wrote:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .platform_info =3D {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * .pci_mmconfig_base is fixed; if you change it,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * update the value in mach.h
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * (PCI_CFG_BASE) and regenerate the inmate
>>>> library
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_mmconfig_base =3D 0xfd700000,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_mmconfig_end_bus =3D 0x0,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_is_virtual =3D 1,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_domain =3D 0,
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .iommu_units =3D {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D
>>>> JAILHOUSE_IOMMU_ARM_MMU500,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base =3D 0x51400000,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x40000,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arm_mmu500.sid_mask =
=3D 0x7f80,
>>>>>>>
>>>>>>> How is the sid_mask of a platform retrieved? Can this be derived
>>>>>>> from information in a normal device tree?
>>>>>>
>>>>>> This could be get from device tree, to i.MX8QM, iommus =3D <&smmu
>>>>>> 0x12
>>>>>> 0x7f80>;
>>>>>> 0x12 is sid, 0x7f80 is sid mask.
>>>>>>
>>>>>> Sid mask is use to get the extract the exact sid from SOC internal
>>>>>> BUS, You could think as below:
>>>>>> Bus signal & 0x7f80 =3D 0x12
>>>>>>
>>>>>
>>>>> Understood - but there seems to be nothing like this on zynqmp, so I
>>>>> tried both 0 and ~0, so far without any sids assigned to the cell. I
>>>>> would have expected that something breaks then, MMC e.g. There is no
>>>>> error reporting in the SMMU code so, thus I will simply see stuck
>>>>> DMA requests?
>>>>>
>>>>> I guess I need to study that SoC to understand what can be expected
>>>>> there, i.e. which devices are under SMMU regime. Unfortunately, I do
>>>>> not have the MX8QM running here yet to check your setup.
>>>>>
>>>>
>>>> I do understand now how the 14-bit IDs on the zynqmp look like and
>>>> that they cover all units, including the SD interfaces that I'm
>>>> currently using for mmc and wifi. But leaving those stream IDs out
>> generates no apparent error.
>>>>
>>>> The SMMU seems to initialize fine (I've already cleaned up the output)=
:
>>>>
>>>> [...]
>>>> Initializing unit: ARM SMMU
>>>> ARM MMU500 at 0xfd800000 with:
>>>>   stream matching with 48 SMR groups
>>>>   16 context banks (0 stage 2 only)
>>>>   supported page sizes: 0x61311000
>>>>   stage-2: 40-bit IPA -> 48-bit PA
>>>> Initializing unit: PVU IOMMU
>>>> Initializing unit: PCI
>>>> Adding virtual PCI device 00:00.0 to cell "Ultra96"
>>>> Adding virtual PCI device 00:01.0 to cell "Ultra96"
>>>> Page pool usage after late setup: mem 63/991, remap 37/131072
>>>> Activating hypervisor
>>>>
>>>> But that's it. DMA is still happily flowing. What could that mean?
>>>> What do you get on the imx8qm when dropping the sids from the root cel=
l?
>>>
>>> I am not sure how zynqmp use SMMU and how their bus signal looks like.
>>
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
>> xilinx.com%2Fsupport%2Fdocumentation%2Fuser_guides%2Fug1085-zynq-ult
>> rascale-trm.pdf&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C7d10728c
>> 715d4d712a0908d862d2bebb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C
>> 0%7C1%7C637368004563253765&amp;sdata=3DkD0%2BEz%2Bavbv6YUM0hvx
>> kcSoDGqZarTmIngdHLVbehcg%3D&amp;reserved=3D0,
>> Figure 1-1: There are 6 Translation Buffer Units (TBUs), managed by the
>> Translation Control Unit. Those TBUs seems to intercept all interesting =
DMA
>> transfers, including the SDIOs I was testing.
>>
>>>
>>> To i.MX8QM, if the IP DMA has SID, but without SMMU context
>>> programmed, the smmu will bypass the translation per the configuration
>>> is bypass in smmu driver, so if dropping the sids from the root cell, i=
t will
>> work well, no error.
>>> Same to inmate cell.
>>
>> If I take your configs/arm64/imx8qm.c, remove SID 0x13 e.g., will DMA
>> requests from that source be blocked with the current setup?
>
> No.
>
>  And if I remove
>> all SIDs, will nothing work? That would be my expectation. If that is no=
t the
>> case, we have an issue. How to isolate a device from a cell or the compl=
ete
>> system then?
>
> Ok, then we need to think of change s2cr_init_val to default FAULT or tra=
nslate.
>

Indeed, we have to. This is the key purpose of the SMMU in Jailhouse:
isolation. We can also use it to avoid 1:1 mapping for non-root cells,
but that is secondary.

Nikhil, Lokesh, as I didn't have the time yet to play with the SMMUv3
and the TI-PVU: I hope your defaults is "blocked", not "bypass", right?

>>
>>>
>>> You could try to not bypass SMMU transition in smmu driver, then the
>>> system might not work well.
>>
>> Where is this bypass controlled? In the SMMU settings? Or is that
>> platform-specific?
>
> S2CR_TYPE_BYPASS, smmu settings currently.

Just flipping the type does not seem to be enough. Could you tell me
what is needed to switch to "block what is is not permitted"?

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/59ce287e-bcc8-16f4-ead3-ff4bf8211628%40web.de.
