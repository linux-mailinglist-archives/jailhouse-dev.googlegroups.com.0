Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26V3OOQMGQESPA4JMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0165EFDE
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 16:21:16 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id q19-20020a1cf313000000b003d96c95e2f9sf406494wmq.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 07:21:16 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672932075; cv=pass;
        d=google.com; s=arc-20160816;
        b=PDFz/lj8an79nO3aSfFSOvo++DJOkVFWdgBVxhgZv8EeTeangjJHkqbSNE6fCSCyCt
         djY4zcBS3uXRYQnBR0M6L0qgvE+qpdU6XcpNI02YOiCgayOYufSW4CnqHs53tgPGsD6a
         C2JvcQW0+QLo2j8wpyFlPEpSdcNtFNKo0EjMsaf2P1RhLDKhybIFEHg+b7QCK+iDleLy
         ogOJorKwy0S1t9W2VjWuMjZBvdoCWnELxMt/+/OGRxGjLNfwtY5L4/J3/190qG2xXmCs
         V4GCNhpnyCXdJGKxE4sFpddnxnlSrO06vLMI8tf8WK+BsQ3RpQu+E+9yd6zbe+RCaVQM
         C2yg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=R/3/DV3odccR/1J1qQK7cYo9Iy/bBR/Jc4ozq7iPyhw=;
        b=irAe+aslnYIHjtQtLNjtaTVSSWnZ4jbauGuCz4tKaTQIRNEA+rDy8xX7CiVJQyQXEh
         mIgqqf8PrdWUsITD8KSaACCpmmGpaMswTrT+s6y8aNgoOvm8ZTbQUWK0ajM+lMh7qT/D
         5QOucDiX0xX/0gDPPB+hJScK9rTDSDdLcvNrgOlrujfGFnhXIGp42+BGaM8+CFsNOXMY
         ZCTDlWrV7xiyMtbsTQR1Srzu6SquuzawxembdgM5EjevfIgNISwgTkQiwna9jcxMgncE
         HDp0AHoFtSrpI4WDPlKpb5N7ICKOF54AMb8EeiTXa0GeS01GYdRPOD5d+9zkgGHlvwAB
         rhjA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Rg+pOiO4;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.15.59 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/3/DV3odccR/1J1qQK7cYo9Iy/bBR/Jc4ozq7iPyhw=;
        b=UtcGe00scI5A1Y3zwq5nfexdXcGKbFHoTQjSBBS6r88Si06Yv+cdePGbO/IUxVh61r
         g/O0/RmIxsl1FE810WeVb2LA8P/HvzDxJm0yKljdjDlMUHxks5GfDXq/Yc3Vn6NVYdpX
         dIPWiqctUeh6NBNIl9UMheCDwtMzWALv/+77kC77puVo8e5UqNU6HIHSoJtsuc3B2pgz
         DUw4lpJcsoyZCAYdEJko1alKz+rw0Sp65gxPICmzmOjzT881+xKSIZdrsXkPjaAFXeXI
         +JLdiaXY6qRwcXilAh6B2F9yRhRUYELIcwsJcVDutXJC1SZlR35GpvJzARb6yRa/Z4lx
         G6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/3/DV3odccR/1J1qQK7cYo9Iy/bBR/Jc4ozq7iPyhw=;
        b=dgtM2knK5EAIxqe2Am9gJvmGjEj2eDM94nJqhzieFfODvWfNIv9oANsnOLsVqoBSyW
         hm8Fj+XNKAUPj7hXp1hKaYzpDzPFCh4ShKtePNYFUY3902NoMlCvQL8O17hgSwFo7M+f
         Vq0yqktV72CI/GDQmQgDtdiq5KT3d48i3LjL9SyB59ZNcRb/3Ah6drtGcZwrcpWZxPu+
         fQKfeq4FtfgL65mfqoNBZKRhdRkAK21cHSpR8NkZ0NUADaj3m/Cw02TCTT9p2T7ZKWIi
         1f/xaM4cJtf0GiDGmJt8HCy1qBt+CA0ax1quKVtAfttmXduET9mMM4euEwomN8WRJkZR
         X5UA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqPZy0g5DDRxr37HVnI3thzgcjLB+0n5fE1aZCRky3hzHg9rSEQ
	8ip6mlme0wwX1Kib+LTd8Tc=
X-Google-Smtp-Source: AMrXdXs9E35f8MsFZm1YIj2FuJiii3JUr2LCsgI2UKQ0T61QAmG4q3ZF0SH04ZEkF7YFFDe981VZ4Q==
X-Received: by 2002:adf:dd4c:0:b0:242:f8d:fcee with SMTP id u12-20020adfdd4c000000b002420f8dfceemr1997540wrm.86.1672932075825;
        Thu, 05 Jan 2023 07:21:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3d89:b0:3d1:be63:3b63 with SMTP id
 bi9-20020a05600c3d8900b003d1be633b63ls20697698wmb.1.-pod-canary-gmail; Thu,
 05 Jan 2023 07:21:14 -0800 (PST)
X-Received: by 2002:a05:600c:34c4:b0:3d1:bf7c:391c with SMTP id d4-20020a05600c34c400b003d1bf7c391cmr40941838wmq.4.1672932074250;
        Thu, 05 Jan 2023 07:21:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672932074; cv=pass;
        d=google.com; s=arc-20160816;
        b=MHclV7gbfi/D81oVlk/Hagt8vVNbOUthOwD6Xy1OMUWYxrUDjhkGiF+KPxnQYFnrUJ
         vWpUVw57VDS89CLCRCHQKdxPlfiHl0Oa1SJWHiy8/sgSfjp9zpam3hWmopoN4aE49pNF
         tFFteKaHmaHrSqOcO59y3AfAEtZ7qvsxiHVcjaHPy7cmGksZSydiRZGCR1II2DIZTZm8
         PYtdPXegfQYnne1jZyq075qHBu+OWh/PlxrjaA0XPoz+yq0zILvWGEFnbgNu36AD+/OH
         ueWIFTHeEhuB8hRC7l16HvKUcbHCzRS/iqkTz5egzfzkeXBGA59WVtRAtGRT6f0Wt2yd
         CdHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=TVaMQEdjXSUiEesSeVnHjE4oYNZkSParsYvCvTudk1M=;
        b=HOIK/uJwJScKpMugsGOeX6tmTnsxD1g8+DEQUOynTnKZz9n4bKPj5nFNXS3YJVK84o
         /ktIIQNsoZrxzjS69UN8i5FDkVqjMaBzUyEN8IaWzgq0pfZX/Rd8cvPo+Tzq38bwyz/a
         h/m63s8x7hMDeRiUaWGnRrEhECbHOVSi+CO0rXM1D1xo8Al+MrQ2Eqhl/ROWzaH/jQ//
         aFPUf14hIYpOAQ75kyaqQ0qWW6jvmXVBMd4KUNkGYqM0jJSCqkOC1MFo6mOFwh2pRptB
         WZsfEpTR74LRFtKY1DUSsr9iEebO4cGgYUtYjKJcVYyQcZsXomTYU6AXPW0KFoAg5YKj
         xh/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Rg+pOiO4;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.15.59 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2059.outbound.protection.outlook.com. [40.107.15.59])
        by gmr-mx.google.com with ESMTPS id z5-20020a1c4c05000000b003cf1536d24dsi119467wmf.0.2023.01.05.07.21.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jan 2023 07:21:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.15.59 as permitted sender) client-ip=40.107.15.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUcPtPZYLUsSB2uFJfl4huOj7tWxlR4tfij7NAPQg33xmrx4FHrhZMg3tOC99laAWLKV8kFim+xf9zBA/4loRz03x65yBOYJVtWXuqU0jhAJTboyStK46LeLQMhjQQ9ScoYWTZPndRFyCRbOvPaBrhgL0uekvDBUQhx2dHrGHzdco4T/rbhT9i7Nly0cKmuyCxWhm0WKL3DJFarWwhs3nxRiyZvUuz1Pn5AzVSHyVXXIRgtMT/k5FAKmzRitZrwTWizDyvcYRfgTcwu/BEXqp+bcW1zw67JCs4Wxaefx95iZpIdoPQnmzoMTPeWLvMhoota1dJqjYSh4W+clXhnwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVaMQEdjXSUiEesSeVnHjE4oYNZkSParsYvCvTudk1M=;
 b=lKLEnXuNP+YTfvYtFGlDHzb43A7XxpUCxt97W8bsHZFcsYTujDzWE9L0XgxqTmtjtiIVEHhOk6N1sL2ZhlBwq/1YjqnuV4V+7RsdqRNbrMZpUn4GnuXnE7LPxoFDd8XOPGYBxiSwj4pAoh4umrid7/uTwH0ESE7kz0I726qLFGJLMiuu3CUrlVIIke5wjmwUWnd5tArIZTi3FRLEKl0OKvsN4QH5nKdu+NbvQHiK4Lbj+/yIN0K8B3vxzJrB36fzXnJEHqUpsROXkvgNk89Ggmwyg47BTIySQqlvTXtiEiqopa92CBaGX2e4heAZFtwOi3rYgIsl2S/kWYkbYF/Gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DU0PR10MB6557.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:21:13 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:21:13 +0000
Message-ID: <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
Date: Thu, 5 Jan 2023 16:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
Content-Language: en-US
To: Tommi Parkkila <tommi.parkkila@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
 <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DU0PR10MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 865cc03f-c887-4552-8dad-08daef307b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jly41GtIOWWljq4dcKwjPnU+l/z9k2zMJKuqCE+KcHlhuTslUHDVx42owu/gOAFY+wxmE20hOdl2vjZrE7a3Ctujnd2+rNSJgTdW8nVonavNqJZNNfWxG/M05ZW+5wCggmYYJQWweEBLvVvdkFHZaeJkxEdnbiqU/oSjgmUmRyJS/r4/OVLz9vjahtoa0nRNTynNaSLfNqb6Ge9sk1+Jh8IgoyeMiQjH3r1RIyPz7FW7lEpvX84IrX/tJ5dZ5YOLQOmK36fCl1yJPfyHSLtFcfJQAGop6C3IdCF8JTTDcpOK6Ct/D/gEmS/6cPL+UA3t9gf1Y6zVnX0q/jF4hsTxy3hHPXY1ATWQ5bNQKgBNDrMM8oAxX+ZaDVmtorWtYcWwT2CvjBmoipaD/a6kJfrQDKxGntEoujDSgqtg1gRayxcktDQhgkvsxake4HkxlN6d8dQVhAtFWTKsne5rrmCyD3JRBQo3VwRAdaIKgvt78fPMpDKpRmgKSxVvtDy0d4ETlw42dEjWqiHvgSk/dfpA3vYwu8rJ73rRQRRuxvIN272y2vmpW7pxFxUlabBRlaqy/GceWEFlWABqr+hEWmGmP6bLM3TDB4bO2V95zVtO/0RSTdglYx63z52OhfoNwD/E1c0gWaA/Psp4sHdhMBEChqv9CBEMDEgP+HPFdf9KNgMTKTNsE1rFD+e/ujMGtIqADgCDYwNVdSClNEZrT/eESakjQaINCH3G3K7dzIKRO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(44832011)(5660300002)(8936002)(2906002)(83380400001)(41300700001)(31696002)(86362001)(38100700002)(36756003)(82960400001)(186003)(26005)(6916009)(66556008)(6512007)(6666004)(316002)(31686004)(478600001)(6506007)(8676002)(53546011)(6486002)(66476007)(2616005)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmhVMFUyNk5xdFhhYzJEMERUVnhUQ2Z4NVNSSUdlUHpGRnNPTEFCZ0VhYWZF?=
 =?utf-8?B?eDg5Yjc3RUhwRVVnSTFueWwvRHFodFcybU1lN2dhM3UzK0dhanBkV255Znpa?=
 =?utf-8?B?RUhSUElWMDlMNUI5WGttUkhFUkMzMjJEd0d2ZmRVV0Qyd0NrQkp4dnBEOWNL?=
 =?utf-8?B?VXFCM2o2cUJleXV4VW1hK0kvT0J1Z2NwbTB2MjVzeG1KQTFpT1NtZ0s1RkJV?=
 =?utf-8?B?TjNQRk9mbEFnRlM4S0QzUi83b2ZJMTlxK2k0T0lpbSt1MjBDZ0dtVVdpSDQ1?=
 =?utf-8?B?R2pSZXAwVjcwU0d0cmRKalFIbHhSTmYzc0lRMXVsMzhPNVpsN3ZBN1R5Rmh4?=
 =?utf-8?B?ajFlWVMwdlZLdWRjS0YvNUJkelpKOFgyK0poNFNCNTFRUmlFbWRVWThaZ3Yy?=
 =?utf-8?B?cGdEbmRhNDNFeWU3cWdSN3ZmK1FJdE5qYXo1Mkd1eTVBOGhOTGxGZnpmT0FF?=
 =?utf-8?B?QlBaeHNNK0REbEhCaFlmUUFSVVFNbFp2UWZ1ZlVuOG9TeUVJc1NoaGlqSGFj?=
 =?utf-8?B?SFdINDVjd3RKM1FUSnNXN1gzbHNrQ0VTa04vV3VtcDYwUmJ1Yk9DMXdKcW84?=
 =?utf-8?B?a1RqWm1VNEozSGhrQitDQjBZSTRTeWhsSVZCL3pMb3BhL2pBQ1Y4Ti83UE8r?=
 =?utf-8?B?aTYrYll0NnQ2eStoaFBDektYdTNVVWROcDlDb1NGODhoczN2Y3hIQUJXWGVQ?=
 =?utf-8?B?VFR1M0YvWlZaNC85TTNtMXlaVGNqMEEzZnJpMmRZUDd1YkZLWG4vZzZQYlNw?=
 =?utf-8?B?eE1VdUhMZ2FiMWV2OXZlbm15TDJvNkxmbFQrR216NkZBNldmeHdpb1oyYndu?=
 =?utf-8?B?K0ZUNmJmL21sUW1BSXQvdDBZZTlUdHlWWVhVcVlDOSswb1puSjM5V1lQd2Q0?=
 =?utf-8?B?RjgwYnJUc0xndGZUS0hsdUlyMUZpVHVKQW9pYkhzWDl1WkFLdjhQS3M0c25Z?=
 =?utf-8?B?QTcvS092TEVjcFk3RS8wMHBGbTg0cmd4MjcvTDlrMXVOeU1sM1BQY0puYWZ5?=
 =?utf-8?B?czFBOW91WDNmejF5cVUwaGdrdnpCTGprS3pQYUZTNGg0MW1nTExXSUJIWmhD?=
 =?utf-8?B?bkJwWnR1Yy84cG1NVUppTmhWcmFqL3NhV3JFRERkNGxSMTc2N0VTSzFsR2U1?=
 =?utf-8?B?VTRYZ3I5SlZEOGdBcExmUUwrS1Y3UERZeXg5SzZLMzJXWVk2LzhyNUx0MlVm?=
 =?utf-8?B?WG5Pa0tqV2NZd011OHhjbGdHUzdBcGFNQkgrcjE3N1JMeVJ6ZEowVEZvOTFI?=
 =?utf-8?B?WEdCSDhpOTh0YXN1dWpqOXZndlE4R2t4cW84Y0RsSWdFLzQyc2t5WlZHU3J3?=
 =?utf-8?B?TDErbE9wejdrekJHL1M4NVB3cGIwWldHNDhuVnRPQlhQcjg4eVI5bW5kajEw?=
 =?utf-8?B?QkpsR1FGR1FIRC91WUIvVFV5bUhjQStLSG9OTDJERDdRWThsQzlKZ2JwbzZp?=
 =?utf-8?B?WDZVcjhqa21uU0tuMXp0bXFmVVdnV3hPSmZCV25WYlQ4TTJ2YVc5RC9VTG8z?=
 =?utf-8?B?UlhNZjNhZkFFWSt6RURyc29rWFc5SUdtaWgyTGNVaFZaN0lIZ3JlVklLVFNv?=
 =?utf-8?B?TDNyS1kwRzlmd1p0WWdFNmRKNEdCRG5yU3JBbUgrRWZoOG16ZXF1VWxpSTNh?=
 =?utf-8?B?M0pnRWd3M1MxOWNpTkNvSTFQZXZsWFlMOTRBTEtrcEp1empBcVo1b09oKzNv?=
 =?utf-8?B?VDhpT1N5MnA2OFhYQXBwVU05amZPdU9SZFpzT2g4NnIxUEdETHhZOFVoWmJM?=
 =?utf-8?B?M202MEtqKy9WSURoR2NmVFJkLzNqOWY4UVdBeitDdWxXVkZjODBOa2oveldZ?=
 =?utf-8?B?SkJmazJLTCtvKzU2cHZRdE81K2t3U1JrSlRjVDFMVWN3TTBvOGRuSytTcHJz?=
 =?utf-8?B?Q1pKNVptOXNEdXk0dW9hY0dYblgvUkVhYlB4eVhmRTFIc0dXSkRnK0tUVFli?=
 =?utf-8?B?MVhNeTdCRTc1bjlRT3Z4RXFHYmhHZStHTDdiS0oyN3FpNCtvdktMZllldWE2?=
 =?utf-8?B?bE9YK2QwYjJwdVNrZmVvWDNiOTdJNDZkVnpEL2JWVFIxVmdaU0t4ZnlLcVd1?=
 =?utf-8?B?NTRzZ0RQY0t4eTFSSDEwK2RYTmx4VnI3cWUwNVoyZjFSZGVVZ1h1a2pRcHJ1?=
 =?utf-8?B?TGo3dVFhYlJ3Q2xmR2M1ZitDaFJhb0NCM3VDTVJRbDhMZlhMNEtCL2c1a2xI?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865cc03f-c887-4552-8dad-08daef307b37
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:21:13.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6brfXafg+vUb0Fd0Cbc8nwmnJ2CPFa0suBXzSfT2b4/MYXsBzUk0YCLuhJeCC7mcjiDP1K80SCvrrsGAH3vjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6557
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Rg+pOiO4;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.15.59 as permitted sender)
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

On 05.01.23 15:34, Tommi Parkkila wrote:
> Thanks for your reply, Jan. I managed to get forward from the 'hang'
> condition. There were several misdefinitions on my root-cell
> configuration. Now I get the root-cell started sometimes, but more often
> I get two types of issues after enable command. Any help or ideas where
> to continue my debugging would be greatly appreciated. Please, see the
> issues explained below.

Already tried "jailhouse config check"?

>=20
> Thanks,
> -tommi
>=20
> +++++++++++++++++++++++++++++++++
>=20
> 1. Terminal hangs
> -- After the enable command for the root cell, jailhouse gets started
> but then the terminal goes unresponsive. Below, example log, where I
> give ls cmd, which then causes terminal to go unresponsive...:
>=20

Missing interrupts could be one reason. Or something is completely
broken with memory mapping so that a kernel device driver gets stuck on
waiting for some register bit to flip, e.g. But most frequent are
interrupt issues, specifically around GIC resources being improperly
passed through. The config checker may find that.

> /*root@stm32mp1:~# modprobe jailhouse
> [ 1315.034414] jailhouse: loading out-of-tree module taints kernel.
> root@stm32mp1:~# jailhouse enable
> ~/jailhouse/configs/arm/itron_stm32mp157.cell
>=20
> Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 0
> Code location: 0xf0000040
> Page pool usage after early setup: mem 28/1514, remap 0/131072
> Initializing processors:
> =C2=A0CPU 0... OK
> =C2=A0CPU 1... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Page pool usage after late setup: mem 50/1514, remap 5/131072
> [0] Activating hypervisor
> [ 1355.352714] The Jailhouse is opening.
> root@stm32mp1:~# ls*/
>=20
> 2. Issue with setting CPU clock
> -- The second issue I see is related to i2c bus and system clock.
> Terminal starts printing error statements infinitely after Jailhouse
> opening. Below, is a snippet of an example logs.=C2=A0
>=20
> */[ =C2=A0 85.322027] The Jailhouse is opening.
> [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: failed to prepare_enable cl=
ock
> root@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0: _set_opp_voltage: failed t=
o
> set voltage (1350000 1350000 1350000 mV): -22
> [ =C2=A0 85.350413] cpufreq: __target_index: Failed to change cpu frequen=
cy: -22
> [ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage: failed to set voltage
> (1350000 1350000 1350000 mV): -22
> [ =C2=A0 85.365124] cpufreq: __target_index: Failed to change cpu frequen=
cy: -22
> [ =C2=A0 85.381985] cpu cpu0: _set_opp_voltage: failed to set voltage
> (1350000 1350000 1350000 mV): -22
> /*- - -
> +++++++++++++++++++++++++++++++++

Same possible reasons as above. Or do you know how clock control happens
on that platform? Is there firmware (TF-A?) involved?

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
jailhouse-dev/990aa280-3365-429b-cd73-d1b89b0b4a83%40siemens.com.
