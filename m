Return-Path: <jailhouse-dev+bncBC44VTVY2UERBSOQU2HAMGQELKNZ4JA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A647FC51
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Dec 2021 12:49:29 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id w25-20020adf8bd9000000b001a255212b7csf3058877wra.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Dec 2021 03:49:29 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640605769; cv=pass;
        d=google.com; s=arc-20160816;
        b=wfu3UF7Kdnr3qRGBEu85oIvjJTs6TwkbLuRDjU/Vs6cm4UrfoXWDNDI8IrScElMKSy
         f9cKg97OCGpgztGP6d8RVC6xVr2gXunIenRwg0VYscJ56SFKhHhSBVEs2Id7hndqzsHg
         cdNTeYC3Q4UJ7sAL1HQ49K6TJ+Un6lfHh3UPY8anfWE+IVjM7+v3BrYEdfaDOVEWw6Ae
         mTmQ6NthNRv2pOSz0JiVIPrIpmRL/cBv3XJ4bxcEQn9oe6e9z6HBtBK1zV59/7AQ+abk
         lLwnfXpWjhq3aVBC53orMZ3hbZIVyBIdeQ9iSlXJg1RvY58ZwLE5Heu7fnr2ff5uVxX0
         4YKA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=8aU/j7hsNqd8m2a0cU7xLW9BLf35/PYSS8WzUUyk848=;
        b=j1ji6KhwepsjgrVba+eoFyw28tqdGjIS2WELy4HqPI+HXseWSdtZANB6OxOZge1iJo
         IB268ssv754K9ekBfdx1c5fuaL1YI2MTdI7T1u2yqhaYrO88TcBXS2R0W9yJtG7dSzrI
         xRSQ2D1/zfRo9hXNWUJOh6a+hGYoCszl6O0M8a7joIWf2QrpIU+QFnebBCMS/fULyhQY
         wQK0i0+A6I5E7ssAqIOScg93dZUQbgXLjAC8aY8bKbRAR+KHq3UwM3dwSKwSOgt5rUJT
         Am7MIppa77LM0OOn334ZBFC1ewXiqEhc5/1J3zdMUsCribRxhHRtXnsB2rs7Fbys4wdC
         eu0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=OwkUOLKr;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.13.74 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:user-agent:subject:content-language:from:to
         :references:in-reply-to:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8aU/j7hsNqd8m2a0cU7xLW9BLf35/PYSS8WzUUyk848=;
        b=iRNfexovoUMjNIydAJGorOtudnnrrGKL1y3zBNs8Ale+Jjjn7Dvl1Jq2lzs9UwpLtW
         ryZxb3wG/hwCcRse5gTXo33VTN+pa5uUZ4cBAUCm+1GLEwmc6kf/qbbNIsLETBs3Dyo9
         tEIeqH0J1sQTvVga/qa1fdxQKKIWJvyszco57jUmmnTDco+qIxqdzadCfrs6RA6p+HLg
         cv7QdmZ15086tZrPKEl6f9kZtHCMEPSa4JrGLX1AUZgX47TOQUqRdbWTbvcl9gEoC34/
         5MCO9lNfzEyCZ96aRjMiQBFPF3D+w8ZdqTsIZ8nTDjdu/ZRQZ9QJsT/2ugC7ChpyaW92
         nP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8aU/j7hsNqd8m2a0cU7xLW9BLf35/PYSS8WzUUyk848=;
        b=6vOWAzwQqYljxkMkzMuERaAZtrVJjtp4QxKtPBEo+zeTusvyse8pL4zowgpuzn+kKn
         nts6haJYdmNpWHpDP+xUwzJj31Pr2rrlGMKSmcBRwCWeFJhv9HHvoEUxyKVxG7nHOpep
         neJD3EUimfRUf/C4VcfMpvnZDF7oYwZ35l61JFLJkBcmZxywixHGt6f/gfouPP1zLNzv
         DcZ4bw5bSJ/7gJ8jL4jKPFtYncwGE22zMvbtZ3jD9hEEy7MIJScYX1C+WjJr+mNn5/6e
         DHZSLBea57ZlsckyoBnCLuBk3Jv0zQ2qYT3VEWRl6uEgkwfTbRp7HPhA+tYKtwQPyO6N
         hhbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532m6N4BQsw5VQ2k/mADUWdJu5yUfKfw+XN/L1bz8INwsD8bCSih
	DOTBSDcd+lBYgXYfeJYvhZg=
X-Google-Smtp-Source: ABdhPJzev3EfMmHjT9Z5iYIltmNpH+Hcna5+FjGvuTLH48e0dkjftJQ3vkRTBzJv/sGe/W0upJW0mQ==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr12831905wrn.521.1640605769644;
        Mon, 27 Dec 2021 03:49:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3659:: with SMTP id y25ls5830781wmq.0.gmail; Mon,
 27 Dec 2021 03:49:28 -0800 (PST)
X-Received: by 2002:a7b:c198:: with SMTP id y24mr12876198wmi.1.1640605768850;
        Mon, 27 Dec 2021 03:49:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640605768; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oa49JOdYfwjimoUEC2VkExuKIOENV2mFU0YPJjhgaaPaYQ+dEkQ7/iL7VvFLIlqgwH
         QtILZXettcwcSnvhIX6Hqnxn6lUN4DUkpzfu7Cl4j6eLnK5gSC3b2kcAdxlA0KWTrMx4
         Py9qHlXvOM14gOk5Dt+GbKzLAPuye6i8HKRc+3Dl0ov3c2dobgumgj6BXx2E12iVWWfG
         ukr2rGZMVn10yeeRDJYc42YBgyk64yTg8nv8Wf+HB7eOcRER6V0hlUhaAXF8uduJ9IXv
         /vkk7rHdby9CkbnIkOePNOJrkYDBXOq6NwldpVIHmzrCBrzyefv5nwGzH4bPk7EBBAuV
         mo+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:references:to
         :from:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=gHS4skprfS6ZvPdfIqv7hY2Km/OylHZ+P24x/e2b3YI=;
        b=EnnEWX6lrMstYXcr0F9BeBW5WbDMwmvx+6Fs/9Ccz6faiMpXHLVTC/ORfXrMas48Ek
         3Z1JfyHsM3ia4Tokm3/dQGoYlTrhEF1ZeMdcPa+tl/vfr1upTj/6rtm4p/bDauGZXEos
         /t45TA3JW6YaZ4JHVa0aNDecSmZ/EEuUFUm4FXNx9nSw0tBWED7Pnx20oUz+Lbt/CxWN
         Cp2VzmXDsQI8xVOrw1UzLYNcyc2lQu3tAMNwIGtPmWwSg/H1FuSmAl0AYnxYhouxXVX6
         Av42rk4iZq85H3DulU2LPv6bQ+DLtG8PAbg4ifH0dDgjC7b6vZF2q2Tvh92X56v+NPeX
         fruw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=OwkUOLKr;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.13.74 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130074.outbound.protection.outlook.com. [40.107.13.74])
        by gmr-mx.google.com with ESMTPS id p20si646381wms.0.2021.12.27.03.49.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Dec 2021 03:49:28 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.13.74 as permitted sender) client-ip=40.107.13.74;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPuc5h8heZg0AOeMx03oY7x7XXWsCy9sAOQUaXdtLDf6CMJkIAdsNpFZjIN0jPipPBiak+KuHgtPU4voyXQpIoNZvH+qhwQxBlmUjM74tkAnRwLOdW9+rsDLdsNB6iCG0PYkOtQ1X0JpBV0lPG1ZLwNzQNSa8qE8+X65Rdk2zmck9X7wWSLOe7ojhRc2Z4yZb62KeJO9owm6oro+T4+FAtcQS4rpTfJsZNUYAkLCEpP4AQ06X+bwutQndAXgF+AW0w8/8ItZ5nxb6vspbzgB91jPGnMUdpuvIRj2vvKp/OiWHQTtFX8n/ZGjUuEDU5SxOjO+VW5y388MW+4ihm+O1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHS4skprfS6ZvPdfIqv7hY2Km/OylHZ+P24x/e2b3YI=;
 b=Mr581xN88BORJTdV18cjTpfhkT+BK9nLsXuDx42GFzcWMWQ+xCTXHz0s9Dmt8LxifZgmsC3tvzLpQ/IbOLC60KmEbdUn4eq01bbVY5CYFMosE/+1fsH2nou/lbwE7V9FnfxSanXLi4emVICQhcAoo/B8u5i8rSDV3tWYoDNkgeXuVE4gBcNQlKBb9pBkHUjxqZma97mVTGUWfAYdTXm7gl3Nl2fYkFihIHemuWC65TfwxSXoPvk51zuJx1JosM2IU4DCZtRL5mSp6xVlzWA/u+mFtU7fb/k8C2TewfM1wmaiwj48KQD6qvgvsJbej+1nq65cITUDuPHXsf4MY9kiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:265::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Mon, 27 Dec
 2021 11:49:27 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4823.023; Mon, 27 Dec 2021
 11:49:22 +0000
Message-ID: <f25df50a-e947-002b-5528-8d9793318aa6@siemens.com>
Date: Mon, 27 Dec 2021 12:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
Content-Language: en-US
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jiajun huang <huangjiajun145041@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
 <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
 <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
In-Reply-To: <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0155.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::33) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a702a525-f956-4c67-8fa5-08d9c92eec1f
X-MS-TrafficTypeDiagnostic: AM9PR10MB4418:EE_
X-Microsoft-Antispam-PRVS: <AM9PR10MB44181C314986720695546CECF6429@AM9PR10MB4418.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2j+GO3jpUjs4g5dHV6WmxZbH1GctnN4vipext7HX6czHf+QwPpD7I4BJjAwTKe/rXXQEMSzohLIyjLt7poOezHHpf/DHQiBGxGDtdYIjH1uSgplqdaMKCbFk3amb6vhqqS6AM5OfvtTQjqz5bfbk4YLstH+JuFde5MovuS7YmSE1trwX/rqSEtL2hquVoGvCwR2hR7FqnCNnttFqqZlDw+/Q9zKO65WY3WwwWnJpo/jbwTKBlOmgFXF0wGti2WUFxxiqHva4sQDpkOtXF+F8nXAjyZ9RlRUWJH0DshweuCb5GhON+GUCtqVFEifBsAtlQAA4MASivCzq1u2gyIrbzPvSgv7JlnwHdgfCH3pzzLc18sisH24xIsAWQ7BZvbprtU0HSeuEFfVdjItc+qRDZwskiEdKXS6jpbuWUTw747+L2R/GXkTEWW7Pi8MjoZ3PtVy5hSB10Pd+N+lSkwdJrX9fup+kVm91R72X0DM/FuKxX/vGglBTPw/RbHVG3qahgapgLUZvLv56znixPfyDcqykMqQf7VIhopyJWH61W7aunZ8+kcLLepLv63rI6MYNSAvrLOaYgzqx9pGkuCTbhJmURMnZ+wNtY2JezST7b0rBfNaR+xaQXfW3LGp6ApKWMaqbIQRkEySUsnRJezOXXVeGBk5VFsWq54OGhpKHwTM8KiBTUJbDB6i3CKA2hz+dg56y5qqBypPC5aBRNvq4jFo9wMb2IZOyBRNifuFdyNcAqijr5+rUf+X7z0PjakE9VjwpvjRBTUaTOdXMVANr9xvYN2WcWJu2CanQ8TycDjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66556008)(86362001)(508600001)(66946007)(66476007)(2906002)(36756003)(186003)(31686004)(8676002)(8936002)(6666004)(6506007)(82960400001)(2616005)(44832011)(53546011)(316002)(110136005)(83380400001)(5660300002)(31696002)(6512007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVd6QWYzZDJRTEZoQ3RPZUVneFZ3dG1CdFYrNlhjN3RSS0dtUDdZNElZSFhU?=
 =?utf-8?B?UFFDS01HdmRKWGphZUE3ZmZiaGVMZWhFZkE3cWoxcS9jcWVXWXZEVEozWmdj?=
 =?utf-8?B?dFRYdEdyV2hGNllZMnpScmJyYm1qNWhHUGg3bnFPYzUyMXFzNnFzVW96UTdx?=
 =?utf-8?B?Y0NheVFYRHl3NlVPMm1Nelc4L2RLbElkMHM0Z1c2eitHcHhOekFnblJVdGh0?=
 =?utf-8?B?YU4rV0dLdEl6RDdIdEQ5YzZqZnpqMTNZNTlUR0xFUXpPRnB3RDRtd0w5Zy96?=
 =?utf-8?B?bjN5dUx0TGNublpwOFRwNzlQWnppd3pDTDVqZ1J1ZmZIK3RWM0hjK1dTSkR1?=
 =?utf-8?B?R2kwUjdpaTlLVWU2MENEd1pWdldaMXM4TnZHV0I5dzVKVzUrbmFUR2xUSWVa?=
 =?utf-8?B?L21pcGl5anRodmhLSnREcXRoTUE2cFNBczBKMDl3Y0JwV1dYelZnRmFsMllw?=
 =?utf-8?B?WVdtVjVaYnNTVjNQVEVGOXUva29kTUdnR1oxc3RaODJ1YkNRVEx4MmtsbWp3?=
 =?utf-8?B?Q2daNTBjTy9samlvcjN6czJVSFNkdVFyTlJDcExXaGpmUnhrczZEK09Bcjg4?=
 =?utf-8?B?Q3FBd2VCaHZzSHc2NFZVRVZ5YVppRkFlUzMxWHdsdjNRK0lLR0xOV2hPMnFm?=
 =?utf-8?B?elhYSk96T1NFdmlsYlMwMXdlcW14eERsWU9ReGl3OFVKeFFiVUZ0K3ltVm01?=
 =?utf-8?B?VHdBaXhZcjRaNEs0THVHbFoxMzNiblp1Q2hROWRKbjRWYVFCWks2U1AzTm5N?=
 =?utf-8?B?aDVJdkc2Nk0wakdxMmFFRFlOMFFHWkJ5ZnNLc0Q2MTZac0x3NVh1QW5iUXR0?=
 =?utf-8?B?NWsyNHU2SWhQVTRndVczK0tIL2p6a3MrNlBoQ01HRXRLSzQ2TmlONTdhMVFq?=
 =?utf-8?B?NUY1dDNvc2NheDQ4YWJxT2pJR0VXSXZySk5Cbng0Wk5wN0J2OWRJaVdKNFlW?=
 =?utf-8?B?OGdBVmM3Q0tNSzg4ZGhHcG1mUlYyZXlzSlVMemlLU3p2TzFWTmhiOVRyVHc4?=
 =?utf-8?B?aHVwMVFpL0t1TFIvaWFUMjAxVzA3MFRKbGcvZjUzVWlhQ2RJMDBkam1LTllz?=
 =?utf-8?B?MHVRTXdiOGRDSU1sL1l4U1BZZVNlNzd0cGdLN2ZWbDZrTXZPTSt6MVU1dXVt?=
 =?utf-8?B?QWM4NjJSaDNZZndhUVd3OGZrOTVZMlhxN21uMFZUT2txTmpsMGxYRDRleUJ4?=
 =?utf-8?B?UTVFdnRUdDFMVkRuSEJnTGFwejVMZnVCRXp2b0l3Q1hGUWh4Y2l0RUJ4SDRp?=
 =?utf-8?B?bmJXMmRRR0E3TDcyR2tNMjFqQWRYMWc5TWRPK0RPOTNrV3BaeWxMakhEQTFC?=
 =?utf-8?B?Nm1tSmsyV0gzVXp3bGNlcWJSKy95YTBTZEVzQmhLYjR5WUlsMi8wbjU3cHBw?=
 =?utf-8?B?V0tnS3c0WkhTUytIc3ZENElTOVBmek5oRlg4VGdld3BjQ2pFUWhnR2lJbmk5?=
 =?utf-8?B?bVc3ZzN6T1E4Q1ZCeDU1bEJFU3J1ZE5paHBNMFdCRU5rWXVSbHBuOVpYczJ3?=
 =?utf-8?B?M2x2YzdjS25wMkZCdDlacXpDNEh3bEJGS3hkbWpKMTU2cU9mR3Q0Yk9sMVBQ?=
 =?utf-8?B?SFBQZ3lnWHdkWUNzWHNWMUxzRXF6SzhzM0hSNXYwc05EcVlqYnZRQlhyUHE0?=
 =?utf-8?B?TEw0VlRvWWlvNlRqc3Z2RUd3NTBIMzZ4NExwL1RJSWtYak9lNG5UT3M2WFFB?=
 =?utf-8?B?UVRUSlZYR0FybkE4UUF1RCtSQzNYK0dzWmZCZGhyaUl5ODdxQ1pzbzBwSHZY?=
 =?utf-8?B?QzF6c3hqRTFnTHF0aU9kOUxPU2pjTnBIMis4VnNiRTJ0ZklUTllva3M3czk5?=
 =?utf-8?B?ZlBWVWpzakVpQktVRlEyczBqWXh2MkYwMXc0eXQvZCtSYmFqeGFCZm9vSE5m?=
 =?utf-8?B?RlJ2S1N0M21qamkweXNLb2YrMTRJOVlZQVFkOUdUcEx4NzNpdlZIRTZJSlZz?=
 =?utf-8?B?SzNZSWppcWN3eWdGb0NBT1VBSmlobG4rNjZoV051WHd6aDQxMnh4WjdTMjVm?=
 =?utf-8?B?akdoM2h6U1VMOE5EMXJSL05lRUZZOS8wVWFlMVlBUlZiYWF0aGpYNXJ1SCts?=
 =?utf-8?B?di95cUx2VjRDN3VVbmhWTVY0TlVLclZyaEJlV252c1RYYWlYUWZsZWNoK2dI?=
 =?utf-8?B?b0VzZ1FhclRxTS84RGQ4U2ZPRXhXUFpxSnJ5NFk4aitNajBBSDhTKzZmb0E5?=
 =?utf-8?B?azRHdW80dGEvSUVMUVlVR1ZleTNwRXByYlFqME5MZ2Z4OFpiQUxRODFzUllG?=
 =?utf-8?B?eGJzQ3hrWVA3NnkyT2tJc1pXVUc5ekNCWGRWM1dCMDNRVUtKUWtBbjI3c2Vi?=
 =?utf-8?B?WjdLazhKUXpMTkphcjZtMVYrNG9DQnc4OEpiSmVIZ3pEWnk5V2NZYjgyUllO?=
 =?utf-8?Q?pZgf3yQMaedxkHnM=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a702a525-f956-4c67-8fa5-08d9c92eec1f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 11:49:21.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViA4DE4zQVF6UEGNtvx9gQ3xdxwBPOLnQQLW+53J9rx8beCyGjY6jUP1izMZVkgD+pnTOMxuQnccDAbrrDftjGGQLo5O42GwiNCMH29m2+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4418
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=OwkUOLKr;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.13.74 as permitted sender)
 smtp.mailfrom=florian.bezdeka@siemens.com;       dmarc=pass (p=NONE sp=NONE
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

On 27.12.21 12:34, Florian Bezdeka wrote:
> On 26.12.21 17:21, jiajun huang wrote:
>> Happy New Year=EF=BC=8C
>>
>> I successfully created root cell and inmate cell on QEMU, and nuttx
>> running in the inmate cell. At the same time, I added the ivshmem-net
>> device to the root cell and the intimate cell, and loaded the NIC
>> driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for the
>> network card. But when I execute ping 172.16.0.2 in the root cell, the
>> error "From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable" appear=
s.
>> The attachment is the driver I used in linux and nuttx respectively.The
>> network driver uses the virtio interface.=C2=A0I tried to log in the dri=
ver,
>> but I found that the control flow did not enter ndo_start_xmit().
>=20
> Looking at the hypervisor logs, it seems that the memory configuration
> of your virtual interfaces is correct now. The shared memory between the
> cells is detected, the device probing seems successful.
>=20
> I guess you don't receive interrupts for your virtual devices. Could you
> verify that by looking into /proc/interrupts?
>=20
> Are we still running on qemu? All your devices have .iommu =3D 0 set, but
> the .irqchip configuration looks different (root cell as well as inmate)
> compared to the qemu example that we have.
>=20

As you have configured MSI-X interrupts for the virtual devices, the
documentation says:

You may also need to set the iommu field to match the IOMMU unit that
the guest expects based on the bdf value. Try 1 if MSI-X interrupts do
not make it when using 0.

Just give it a try...

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f25df50a-e947-002b-5528-8d9793318aa6%40siemens.com.
