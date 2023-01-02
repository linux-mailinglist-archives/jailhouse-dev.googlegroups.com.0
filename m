Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEEKZKOQMGQEVPZCRIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23065ADAD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:17:37 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id r17-20020ac25c11000000b004cafaf9e530sf7791687lfp.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:17:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672643857; cv=pass;
        d=google.com; s=arc-20160816;
        b=SgLdgYDeVNTlGNuL4+1NcB6PPUE33q90ksaTtSEl9QmnjAGbjoLPO4Fhio1lFbtrlG
         7XN1c8WA3ZEPNxJuD6pyA9aDSbrRc5oLGtxkdQzMB/cwm1++MTvwDZI+EzuX8B3T7+L2
         RAIwfFqXrf6B0/P7Whz6QgPydExm+44ncGqMIqtQUQRp98sgccFGFu9+Sh3pMbm140tZ
         UDYtmSX1kBEc5OfwOxooRaOTT24dzLVEOB/eo2bzMJ8krXCGUC3CrIlKCAbXeI8BtnR8
         6/HLgnv/7D7VTW8i9wsBw0NmE/lgGeOGA4YsTGLkdmpAL0DVQoJGPb28q5Q7jmLcWHqX
         MiOw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=PLEMBgnaYY8iuCMCU0mccMyY5Icbg0jI8b8bXKHzLEI=;
        b=kxvPGntoj2W1esgfMioPfV8t8mpw9m3ucwIGoWaIIJeKZtNeXkMngr42pMm/dQ6FC9
         Vt8xmEGab8y6si/2MJVo2YP7f+hNw516ArLvFLjYBy/MZEY9qriIULM7nThpSzhBEnbR
         r1IVWqe86ksVflrOQiVSo7Nlhn8UKe2tsBbj4XQvC0Rt/kOW1HFSHBccOpaeSc9QmEyl
         WGQ7EEgXt1OsKwbYgV/NrxttUVn7B/81y/BP9xwPWrcM7OqAe4RMxkI1vqTYqSG7oOB3
         1vW4rELxZ+6qdtDzGFkhAC8rNWuuYXdcZyU/XUFV0v8rzMoOKs1B6phJREQWN+WyXPg6
         3JbA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=B0KI+XPj;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.247.71 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PLEMBgnaYY8iuCMCU0mccMyY5Icbg0jI8b8bXKHzLEI=;
        b=WW3ntiB7fkhN8OJI8UJCpVQLH8YPB/gaJfMa9czKe+7iQk7SrB3QA9qJtxuGQEqFnf
         hyx5hH/+SqozBQXbOrJwuy6WguSIUMaclJFm6g5Ocvcfc48R/vY8cwmVgTTgALS0Bvq4
         /pN1TCrrn54y4pFpGdmHWf60idCxjlJbob3/u6GjWVOvYu/kWCGhZJtYQZI0V6w4pR/3
         3l4xou6JU46keX9LzFauoWVMV4hX77AIixuHAP4NgVpHpqVckFmwujgUEKfk90yEJp0c
         AOZbk1x3i6n11Msb9UhODa6kTqnv78lq0mJK0Lz1q/W36aZcshLjAC/xafGL4y8gmYkR
         mX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLEMBgnaYY8iuCMCU0mccMyY5Icbg0jI8b8bXKHzLEI=;
        b=o3xnIYhSVMbRqaiK9Gpw7zHrMe05a++VPMT8CmHzkjB7w9EIpvj+DvnHtnRjFz0jPa
         jba9Birpt5AklRmxGdytR3PHFhglm/eCSx5R/hGlNNCacu9iYC+5t/kZla40hqmvP6r8
         VgJ/xVTqk2bE6VZsxM9E5h1MtgHK2K8aAx91xJI3U7b04fyKzn14JYNtHeqyGvLkEalN
         6mI62KRUHTJpTDESco3F9nnYZCNhAkxvjpSh3zDXxEOrsy7eqdKaAh6MhlvjYC0RTiFO
         3CgDue/MmZVZPXfLzQiWCz68MG36c92s189GSSGRi10GirmvSQnQ1XUocJLkhQAWgggy
         kotA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpHIRlq8Nam5VFjJ5gIwXu1XHiz4H8765ap1JROwhW2lqblIuh2
	RX9Y/x8T8qxjltKZGAk9LA8=
X-Google-Smtp-Source: AMrXdXuIUF+u7LGcoh3ecPAMJhixe2UrCn+1YGJfhU+in7kVBz3VDjRdjARGpjmiO+3LoPyWDPxn7Q==
X-Received: by 2002:ac2:46e4:0:b0:4bd:de32:b780 with SMTP id q4-20020ac246e4000000b004bdde32b780mr1943272lfo.402.1672643856892;
        Sun, 01 Jan 2023 23:17:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:5d5:b0:4a2:3951:eac8 with SMTP id
 o21-20020a05651205d500b004a23951eac8ls8676018lfo.0.-pod-prod-gmail; Sun, 01
 Jan 2023 23:17:35 -0800 (PST)
X-Received: by 2002:a05:6512:3a91:b0:4b5:799b:6c8b with SMTP id q17-20020a0565123a9100b004b5799b6c8bmr12181224lfu.56.1672643855008;
        Sun, 01 Jan 2023 23:17:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672643854; cv=pass;
        d=google.com; s=arc-20160816;
        b=eJgplaDNw+fWI4ufu5Uh8Zye1fwgCLMUV0adWSCcq2D4RAoRYmgpO/D6ar7h8Lq6lK
         laF0hQtGNLW5Y0KuqSon7+iACUznN/+bK6WZWIBbs7hTH3JSKsODI4QwutjlMTLPbHIm
         65wRqxYshG7V4jMo48ufyvqOVWIWjpzTGGhXmaMDLZwuNKlbfW+pouG8/ho5JesiHYjv
         /njnA7Fv8zMj1f/69RFD4jDjBQwGn2PKo1ygYBaNvWkFQAo+LbBsEvFJ/Ta1CBiYQpGB
         3PWPeOsfe8vV3/218BErN7MZqCYNpQ2Ob4y6z0A5nMds3hG2nqXiYWW50KyPxFTkeWZ3
         qenQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=HYNe51Q2OHdt0+Zlptn/JPxexxIIIuNQdRf15QGkI50=;
        b=K9zlGrgYRKDpUwZTCgsfANVvo3aLlykMWPUmCBtLB38hPuphhAmnrgOAcuyMj4cw/6
         t9d+k3VcqV8yuqdSP6+XCHhnKv5Tl0OFcMRliB7MGLe70PvhPu6L1EU94iom6fMrVFF3
         Q0CuM64K1fAWOt5sn1wdQyV2nlOvigxvycUQabL2h9k0GkZaKxWyjNKNS8QDZyjJfal+
         7X5awqKiGgmraPk/cvrJvhiFFdPfvPhnKeAr6LMP9cI0CfCYawpUk5Zzkuu8J4ppPRZo
         qi6Z+lF8ODMGM3zHS3inFW7QKOyoc79aho/pCtf+W2G6vD2uJJYj8qf1bXaQGE2JEyCC
         tHmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=B0KI+XPj;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.247.71 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2071.outbound.protection.outlook.com. [40.107.247.71])
        by gmr-mx.google.com with ESMTPS id s15-20020a056512214f00b004b58f5274c1si932330lfr.1.2023.01.01.23.17.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:17:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.247.71 as permitted sender) client-ip=40.107.247.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcVMbZ234UE1/WCE4XaXV1wayd4A+llA767yed8UWMeMb4UpeOWR+os1J9iBOFJ80J5YbjPNPuKY/g2NSNevL19Th4ULN/e6I5FgulkE9nzl+N0GXN6G//dGdx2fmtj0rkZWOaJoHbGWmWV3D+f+JyQr6RIbJCn5sboT4cSCXijXMf+lt9D3eOI7hoV/9Y9jT3PHhVee2BaltM1iru1TbZIA9IMShaEWQ7EAzxURvKhAE5nWua9cJZYI64ovqn7iX9ymf1qGw2Ug7wYcR4f4OSEfsckfx9ish4PhFhTNkCIr70fBHk5FlEvIGxxtpLO/Ii0OyWl3tscIe1mIMixhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYNe51Q2OHdt0+Zlptn/JPxexxIIIuNQdRf15QGkI50=;
 b=mfGe3QfxGirF1GrddKXxpgCnl3Ek5BGUpPG/V+pgNfq+3ZtdRyDhZyLW5LKC7zS9YDAkbQk3KUqtqiAMIvUkF2/gWhLX58tWjFso4RkHDmPy+OqiS9jLZXF0ubFpt36iI2Ql+hPmorgrwJ4mewY2rf5yKNV+oBU56TjaAM5TfsTJyzh+zbJvF3RZ1GNbO6pBqU7KMb/dLSWIEbA67MYdi2eu2Mpxs0/9jBY/eLSfNx+zWXRfHGS+nxEGVwghMF5nujfeDaZBEVWd/FvLVGHNlsfgzuZeuSn8867d/soUsaRjl7hsE0UroTC2bfgsZfNQKowqPLMjKW6n90G/rZgE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PAWPR10MB7392.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:17:33 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:17:33 +0000
Message-ID: <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
Date: Mon, 2 Jan 2023 08:17:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
Content-Language: en-US
To: Tommi Parkkila <tommi.parkkila@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PAWPR10MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bc6ca9-6c7b-4339-5368-08daec916ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0qIJPz9kOXGvaKhE1LD/AM5e51s99OikC18G2mYMjjVssW5b91UBAKfAxUJYoduNlnExwMLmoaluXNODJlUKwl6gLmbaMTNGKDK57MaCSdcZLk4dLgOt2Als67d+F58XCxQCi74qUWHSs0kZ5bOXyHVDGUxugq0qvfpI3ZUIt0m8Y27q9uu8T7Y4c3nQo+iF/q9C3PV1dFO/eQuVN/1JXuhzjrLrUrmyDbXXUBac5dr7YtVxMzYACA42qJE/SAVV4nWqYcq3LGwFFh8zQupvGZxZOtqlFcowzeSj1HxePPQaOE6Fs/l86lVeeuSKg6VKm3u4VjjX6RuEdTMtQG99cbyybHLrCCm2qF6r/LEhVmUoIxD+QthDeTFv1LQI8yBMof06M4PwIto07HftrY4u4vy4zR+bUVSiYfxVKDEB7xBXIuqZALr7knD8oKkRIO0VVPZdHtcbXbFsc8UXTUGOMwjpfr24mxEQJgSiY9M9Sklco8u3xbiRvFxChHNF6u6AXXxm84Y//SFXC1Vp7s0JWsPNiSwAoPwyEL/bwzmBqXwGOCxy0TSGRyD3YjpKysFeIwTcsjeRJ0xSD+f+fP1KmGUIV8R1PmylE1snq8/6NNkslYB6AjCaT9FJtPGzTmgnbC+el1UqAKFb33F+S18ZhAeYe20VyBPQ1IFt1RwWHDOdcH4dKutdPbM5Cle1J8rRpertrR+3yK3OWQey2nkx0GZDMRvu9ZIgkQKRf4daQK+TqUjaKFjvnJ/3G2JRekE8hYZqY+QS0bM8bYKlF3l9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(36756003)(2906002)(82960400001)(38100700002)(8936002)(5660300002)(41300700001)(44832011)(83380400001)(86362001)(31696002)(6486002)(66946007)(110136005)(31686004)(6506007)(53546011)(8676002)(66476007)(66556008)(316002)(2616005)(478600001)(6512007)(26005)(186003)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0RPMHRZTENYZjBaaDkyc0hlWmVIL2tVUWFMcUVCQkRETWpZTFE1MFBOWHJV?=
 =?utf-8?B?M0RFbmJNL2pmRi9rQ0pVTDhkME1nbXRYVUNwQUxoRUVLQnQxcVJneHF0Nzg5?=
 =?utf-8?B?SXpNT241Q2owOFR3QVpXNGlrSmZMbkJleHBobGYwb2w0aHg4MUM5TFBaZHly?=
 =?utf-8?B?YnlkZGRIMDdXMmNUNDhBYnlzR3N1bXk4aTZUVmlNeDVoZVIwWmQwOW9QaEtx?=
 =?utf-8?B?eVB2NnU2RmdVWDhJR2ZQRjJFb0VweXordUZKNUlvQWhWR0hveDBvemFhbmVI?=
 =?utf-8?B?Y1luYkw5RURJMDlOZ2l0emdhVkd6TUl5dXhRSWQyTXNOU1NlUVI5bVkzVVhU?=
 =?utf-8?B?TDViQnI0WC90V1RuZkVNYWc0UEQ1TDBIOEFxc0ZDYndNaDFNUFk3c2NheGJk?=
 =?utf-8?B?aTBJdEtidjUxdVhabjhNcUk3dUhoSmh2Z3VVbzdyTXhDbml5bjcvVkFwNVgr?=
 =?utf-8?B?T1IzMHg3MkgxbUZOZFpzb3R0QmFIMXJWUXluVHJSeWx3bms4VWEwVFlPTFNJ?=
 =?utf-8?B?cmFheE90ajJZL2drSzZiQ3phZU1SSmJSckRDWTgwVTIrODhSK0RiV1E5ZEtt?=
 =?utf-8?B?aUdUbXlUWlFiZzNpSk5mSHRrYWxoMFVwcTFuMEFhbUtOZ0xrTXVpck1COFF2?=
 =?utf-8?B?ZVNUNE53bEFBZkxHS3lRdHBKRTRybGt2cWh0THpIMnRuVnIwSWROc2RhZFd2?=
 =?utf-8?B?SGdaK2dJbTdpV2hMellmZ1pGZ2JxRXFlQ1UrNlN4enBhRGlVa01kTXZraGJh?=
 =?utf-8?B?djIwUk9JSGFLQlVWazdBeGdlTTNpd1NZVCtxanU3bE93ZnliUklpWW5PS0pu?=
 =?utf-8?B?ZmRCZEZ1VmlMem1aSUY1VWV2MTdmY2dqTzYvUWlpd0dXS05oNElPdFR1VXRX?=
 =?utf-8?B?M25xckQrMldralc2R1FjUUs0WU9tTkJnNHlqZnE1cGtzblNxL1VZTUI2eVgz?=
 =?utf-8?B?aWl4ZWIzUVVmdERPcnFjeS9SeWs3QlJQWnNDaEtPcUxSbG1NSkttOFhLb29r?=
 =?utf-8?B?djVFNGsxNzY2bTBoRS9PdFFyQ09KUlNYcWorMm90MFVrUm9vSzFOYXR0UmN2?=
 =?utf-8?B?OXc3cnphWDU5cTN6ZHdkV0I5aTBLWnlKNHZDbzFNQzh6ZjM2UXhHMWFUMHU4?=
 =?utf-8?B?Zzh1R1FMNStva0ZMSllXS3N6Tit2OXVvNUpaeEI5N24yVURsaFFHWld3YUlH?=
 =?utf-8?B?SEtqcm5tVStLRWowOWNjSTlsSFhEVU1SMEhYeWU5ejRUVDZXb1VBRk5KM242?=
 =?utf-8?B?N3ZsSFI3bEszV2ZhY0tENEloaXM1cVE2MU9vdFR2bWhtcXRKeE5DenBDUXh6?=
 =?utf-8?B?MGhQbHRXT3JUZUE4TWNwR3hVMlNFVjZTTU94VDdhV1hRSFUwWEd2Q3BTYVky?=
 =?utf-8?B?d3V0TEQ4WnFBQzc3VDRpOU5iSWpZdEtPeDVvWUt0eUJZYWxaelBKb3NQblF6?=
 =?utf-8?B?Vlc5L2dCNVo2dFlSYnh3bFozR0lhM3VTb0ZHOUNqL2J0Nml6aHZaQ3dUZG9N?=
 =?utf-8?B?YW5GY1RqclhJL3V0MmpiOFBsUG5TeW54Sk91Q1lWOW9Wcm1hQVJBMGV6V3Bz?=
 =?utf-8?B?WlhLVjFrY3lCZ2NTVnFCZ3R3d3o5dllBMWhOOFphdHJOSUJmUUxlTWxPZllm?=
 =?utf-8?B?UEpkd1RrT09hbHdCUjhFa2c4TjJhSWtqdWdiWTF2dmxyc3dhb0R0MUsrdGJK?=
 =?utf-8?B?dnFad2ZZMWE4YktUeXBEMEtlOGpMaFo1YTk4VnlYOWloK0dubzlwTFh6U2Qx?=
 =?utf-8?B?Q3llQWNFemViditYMGVRNG1UZE03d25RUUw1cE53bDExczJuMEZjSVJPSlhV?=
 =?utf-8?B?eHZRUmdSNkh6cjhJdFlNek5maVZSdVllYlVkYkdVVTRjL09yajB2ZHBmTVN3?=
 =?utf-8?B?SUZmelpzaEgwaGZMVDgvc1BYeW9sTFZ0K1Q2SUxjWFBnV0NxYWxLMUExWDkz?=
 =?utf-8?B?ZStDdmlEa2g5NU13a2lHb2ZFWHcvMS9Wcm1WaU8raGVUMkNsbituSGNUQUxa?=
 =?utf-8?B?VjJvd2hJQ3U0bUZWOHJTRFpSNHl0Vkw5SkV5ZURsSkhhSEZSbDM1V3FQaDhR?=
 =?utf-8?B?cWZyVUt3a2MySWlGdHArTGlJUmdnWUJuby9DdU0wR2ZpNXNIM3FNWXdFNVdx?=
 =?utf-8?B?R1EwWjZyVWVDSWRkWW1QMXE2cld1cGtJQ1JnYWpZUEcwNlp6UnVDVlNBYit5?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bc6ca9-6c7b-4339-5368-08daec916ac3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:17:33.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTiAGi6jiMnsrJEOv3Q54W0Itl3I+ph7oFWAI20VjGF2qNQ7BufXUVdbUfXGtlSnBMKVTyAnKq+ejqI5Ph0Lww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7392
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=B0KI+XPj;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.247.71 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On 13.12.22 20:33, Tommi Parkkila wrote:
> Hi all - I am trying to configure and deploy Jailhouse on STM32MP1 w/
> dual Cortex-A7. I get Jailhouse built and installed on target, and
> kernel module installed successfully, but when enabling Jailhouse the
> whole system hangs and restarts after several seconds by WDT. I have
> hunted the last executed line of code to:
>=20
> /err =3D entry(cpu);/=C2=A0
>=20
> on /jailhouse/driver/main.c::enter_hypervisor(). The process tries the
> both CPUs and both hangs. Here are some debug prints I added about the
> jailhouse header data before the entry call, if they help any: (/number
> inside [ ] is cpu-id/)
>=20
> /[ =C2=A0280.734679] - [1] header.core_size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 0x16000
> [ =C2=A0280.734687] - [1] header.percpu_size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D 0x4000
> [ =C2=A0280.738521] - [0] header.core_size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D 0x16000
> [ =C2=A0280.742961] - [1] header.entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x3720
> [ =C2=A0280.747400] - [0] header.percpu_size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D 0x4000
> [ =C2=A0280.751840] - [1] entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xF0003720
> [ =C2=A0280.755775] - [0] header.entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x3720
> [ =C2=A0280.760215] - [1] header.console_page =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D 0x10000
> [ =C2=A0280.764049] - [0] entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xF0003720
> [ =C2=A0280.767986] - [1] header.gcov_info_head =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 0x0
> [ =C2=A0280.772627] - [0] header.console_page =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D 0x10000
> [ =C2=A0280.776462] - [1] header.max_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 2
> [ =C2=A0280.780902] - [0] header.gcov_info_head =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 0x0
> [ =C2=A0280.785443] - [1] header.online_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D 2
> [ =C2=A0280.789278] - [0] header.max_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 2
> [ =C2=A0280.793718] - [1] header.debug_console_base =C2=A0 =C2=A0 =C2=A0=
=3D 0xDF96D000
> [ =C2=A0280.797653] - [0] header.online_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D 2
> [ =C2=A0280.801488] - [1] header.arm_linux_hyp_vectors =C2=A0 =C2=A0 =3D =
0xC0114BE0
> [ =C2=A0280.806935] - [0] header.debug_console_base =C2=A0 =C2=A0 =C2=A0=
=3D 0xDF96D000
> [ =C2=A0280.810871] - [1] header.arm_linux_hyp_abi =C2=A0 =C2=A0 =C2=A0 =
=3D 1
> [ =C2=A0280.816419] - [0] header.arm_linux_hyp_vectors =C2=A0 =C2=A0 =3D =
0xC0114BE0
> [ =C2=A0280.826307] - [0] header.arm_linux_hyp_abi =C2=A0 =C2=A0 =C2=A0 =
=3D 1/
>=20
> Where and how should I start looking for the issue? All and any help
> will be highly appreciated. Below, a snapshot of memory region
> allocation in kernel device tree and a snapshot of jailhouse root-cell
> configuration that I use as an argument when enabling jailhouse.

Did you enable the debug UART properly already? That will give you
fairly early output from Jailhouse and possibly hints on where it fails
- or at least where it still passes by.

If the hang is actually much earlier, you could instrument the entry
code, make entry() return early with a special error to see if this path
is taken at least.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3071214a-b5a8-4096-8ad4-3a79b6634de5%40siemens.com.
