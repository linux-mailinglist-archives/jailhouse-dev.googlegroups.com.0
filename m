Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU4M2WOQMGQE3L2V44I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id C710865CF80
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Jan 2023 10:26:44 +0100 (CET)
Received: by mail-ej1-x638.google.com with SMTP id gb10-20020a170907960a00b007c192c5482esf20583612ejc.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Jan 2023 01:26:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672824404; cv=pass;
        d=google.com; s=arc-20160816;
        b=rnTbTH0YZXUiHsInvZvvJWlgp8pd+549NdNJlUGDtaPHfgclddZO8S2Tgud/leua2s
         nGpWToGij8pUC96V1uQcUc9E4yGZ8B6pVcL05wzAJGhSysZHj3rWgT1hZ1MtoKWyhC0O
         +wb3SljitfG3Ipw0LKAmC49kXRv965auHvC5ZcuB6UIVWSoK2CImIwzTyI6GRJYXakQa
         e/cvhPl/+e2komWKR4aZz3B+FxhKf8vPG9Mdl9/I3FQBRlaRugk5P4f28szf+TeQv8Ha
         F4tVvOwUIL1AG0zqVoelMcs2LFAXFsnHSffDgC0Zvu3A+5A5TPnKVxGjMgyv2GTBhkAi
         5kIA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=5Z0Xr81YDfcrHzEEyR4GnBYPDB6rsgQPy8EMweSOzDk=;
        b=OarUrh14Y0KbsTlOyD4NfaaIXnt3ufN8EAhhUwHz2UiuN6HQmDvlzv1EaJcBtQv/T6
         H77c5zKjbxTpzlMXTqCstL/K8JQnoESIqGnRzOcgsQuoaJuqdEdBXnhBvo3M5iNFgwna
         XSIeRoDm1DZ2b9NaZZGDLMuFg2a5LFyPu9HtWO0UnRfvUSswcNiE3XDC2cKGh/sPjKKX
         0nqrwNpEKPO/5nidqsWzk2goSI8FQdYVgisf87VCscFhobAI83m+h3QC3k6W2DZWER6t
         xI/B4SwHbPNnztpA5uEydgnfVuY+WvZOXvU/L0I+RUVh0WoxinUsOCcEdZaP1+LtjUQw
         T7Mg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=do21t63Y;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.87 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Z0Xr81YDfcrHzEEyR4GnBYPDB6rsgQPy8EMweSOzDk=;
        b=UWG77UYTIGe58JNLBjRbVtZi6ZiRDdwKJiChOhe8lXPVP1UllQvCTNMC/8rl5ul6Gf
         g4PxlglQBaN9LxNsf02qFyknqGFBDpIyyZe9XL9UWLlp7UpK3LiRnJEBknSlH65up9SH
         kFoIO2JrDdi0xgty0cGt4Jjqp3oTSv+z9KkkD0p7siW6U4LjKgJ/w4VCv1rpesuueAau
         jYKtxdFijeWkZWg/iC8ek7yjxGJMDDGMeujAyMlhdRj0PqS13EGrBgypM3dP4TaEMxzT
         w6zR2OMOu5QanwN2EO51kRzcI6+Qs0yXx0atRVGwLpSO+dJxYC8kTmUf66rxVbPRdv21
         LcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z0Xr81YDfcrHzEEyR4GnBYPDB6rsgQPy8EMweSOzDk=;
        b=ymX4kS47318/FatFhUpxfydD8uK1+yfnVX4boyvKUiIJCmMQF7GiFFR6ugE2hGvPK2
         jsJeI+I8oVs9786+X+LlfETcFe1ihk9TIaAno0UKxuVcD5Ea4kLnfL23Z5N7HPQyF4SY
         xew8xvg7QM16H58yeC0ALO5cM6fxbCbjrnaOEPmvzlIn8K8u0xIwtYXsqX3Rw2+paA35
         KHqzeqb/xnrw5pcag8qyp+USdMBsiDedZ21Ty+cYvrklbBelH4Fo0NpVPBuEc8ZtEuep
         gkn1GAzgzfZZzRL15UeKb5d8BKVbCCX8uOSXMAspbhWF9kUVusIgcOgM5mg5z3jJsas0
         oggQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqvWh0Ha82K3Bexte3FWSmDoOAPbjiaQEypwCuBHcbrql9mknio
	mYIWAeWMj5PI36ham3MXJCE=
X-Google-Smtp-Source: AMrXdXvJg4Km+ltu0ogXJ6u0/uQsqU1p4+cHnCRFJVuBkc+x6gFEDibqEIOiq0twgMvNUosWrsuCkg==
X-Received: by 2002:a17:906:d213:b0:7c0:cf94:4dd6 with SMTP id w19-20020a170906d21300b007c0cf944dd6mr3485754ejz.95.1672824404290;
        Wed, 04 Jan 2023 01:26:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4413:b0:43d:b3c4:cd21 with SMTP id
 y19-20020a056402441300b0043db3c4cd21ls320270eda.2.-pod-prod-gmail; Wed, 04
 Jan 2023 01:26:42 -0800 (PST)
X-Received: by 2002:a05:6402:22bb:b0:48f:a9a2:29f1 with SMTP id cx27-20020a05640222bb00b0048fa9a229f1mr337106edb.2.1672824402467;
        Wed, 04 Jan 2023 01:26:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672824402; cv=pass;
        d=google.com; s=arc-20160816;
        b=dREyVhYFsFt7WszjaQX+u/BIiBW9wGgq+3lDKkHt/v7Ci3ukcw7jogoJEK4FI27IXy
         rSdtK1fmPPJhIOvYRh6V029AE2J9AWmC4Ys9qKA315xSmpYViN07Uoilr3489CBuMtEt
         z9xL9Y4CFxazZC5k246w9dWpsduEHWsSbNLKEf8s/6iwfVTF4MlsnS1iwMEs37F6EzFA
         NX6MsJew0Qpa1ya7cVr/s06ObycPhYLpJ4zCcIa0ZCaFX0ZeSMHDmizAzNlLsOs6tBFG
         9zOwHCFm+dtkWwI103x5olLGdb0E7WngloVgFMsGY+qeQMIlkpcECRQQ7NIwp/P52GPJ
         wKIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=5KXPV+g2OOUDeDRGVQeAE/M5kRzrjSmvseMZkfItm3o=;
        b=U8opEHvhBrMziCaFHWZE49b/sHETXqcbi3LnR26Ukc5Ja1UUZhIWz5NU+L98/PFFNo
         ncenq/z7TX5g1FNXTZ/TMQ4/lIOU6lM5ZZVul/0pE9bxs2Btu7FHBDD+eTRIQOer1hQb
         /g+p8npJJnWc3Lzre1SmhtwRd3pEsYf2qIXsRQwt0OFQEdUEdmXi8ADdXWHCVQVSPlnC
         OrjpMg1lk1aQuXfCcdV1FZeC+5bZ+lLgN1thfqcr8JQVm9L3pQvWNFp6WoL+2Z8LJM1l
         8PUf1KtCNSzeLvIXEfFQrok0a8ni4tcp7apuryDHp60P60wTXmw6B34xx8spxPsVA5Iq
         0QfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=do21t63Y;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.87 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2087.outbound.protection.outlook.com. [40.107.105.87])
        by gmr-mx.google.com with ESMTPS id l23-20020aa7c3d7000000b0047014e8771fsi1213767edr.3.2023.01.04.01.26.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Jan 2023 01:26:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.87 as permitted sender) client-ip=40.107.105.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvGn540B77RPdCMLj8214joa+mvQ9F0UC98mJN5PcxTfmqW8MLWDUrzmmT+gF3ucO4zFJ0meVoCPQ+QJh21IMsvQgBIpYFozVlYtVuY06RTGU7iQqkoQ4LbCNpu4aYLidm4GP8Eza7M/duON2f93H4lFxiaGwOPfgcKABbi89UIpWNYfpVlYszdlXxW9GIR/mJHT5thKqCwZWgnFW58M3MGQJfX16ULz2SR+vxuZliLuoJ2zFOJY/FEFmg8bbhqoykwJP91AtVZZ6cKKtstKseRj5azKga4KRXR78J6MfYEkaHr0+51dIfqUNKc/Rjua5AdSmp27qRIU2bjnnDlCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KXPV+g2OOUDeDRGVQeAE/M5kRzrjSmvseMZkfItm3o=;
 b=ihHy+5BRid+xoOmbrNiC2+yIHVMM2v20MdujJmLnCrMKfbk0Xur+1YQvX6rHMu6h49fJBu5pLBC3+SGUeP9y6PQb/1oVVoWoS+1oiIZYc1iKx9zJ8RlikWvlkjKDHq740SOcSq25Kx2+MeOTuRNxjcvHjo3bGBQGNeDEnS8Bx3RchGAeBaVjzeCe66HjOWW60ooQMsooABqJVRAy2JsOXOU4FYSE4MhUDMPyI+02j6SWP1Ejcj0omct6A6zmOG9L7UdrCn7pyHAWqvgeLP5OJoBtdovnKhxhkzXXf5uz1SuBwwh0lJWoMOeyGIV8SPczJ2+oapzw9c1I1dUtjZgghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PAXPR10MB5783.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 09:26:41 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 09:26:41 +0000
Message-ID: <c81bdfb1-055a-071f-8838-66b35173241b@siemens.com>
Date: Wed, 4 Jan 2023 10:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: jailhouse-dev@googlegroups.com,
 Chris Paterson <chris.paterson2@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
 <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com>
 <CA+V-a8u7x=JW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf+ScgeiyO5w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8u7x=JW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf+ScgeiyO5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: CH2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:610:59::23) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PAXPR10MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1be2e2-3aa8-42e6-5301-08daee35c9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbEYH6P7E3wUJPS+konN69UeCzJMWzj5xKMfFaSM2zSenXEDLogDtJVDL4Wqxmpftv4DmXhaiQHsne4CiWO2A+KTvQs8/Q+Dr4m9pShqAYWyfRaCIuP8wet//oleGz5nIY2G33/tBpvmQug5Qf5bhpgfgZ+0xwTPEXJypZbBrBZxwEdINXylx2VlBxOwObp2HmkyldFmMpS7MrmdpuntJrlW24d47UcwleeNSJ28VIhU/9qiHn6COQTUvl4DTWV5iSIcEPezREknSDYNM48lUtVYirEEUcDjwE1ICF4hVVe/nDRW6M1EOvHO08Q4zd7qgAcSQ08UdYQI3ilm3MTUFx44NMlt8Vw9+XhutnGE0DmDLDtuLrTNcezv1ZWG5ZU2WxXu3A99SgyexNuAgb/T0EXxL38Ya5LK1AWk/7aBctmCNAzyjlfeL7mmdsTixbMYAYwd94+SOqACbvJwdcnL65SObFCHsOWfli0YfP6OehCfTz0iAMcB4GgRmXOLMXSsUiXo4rtCvmyk4ANBUxXRpxlhqUG3zIt3dCSTYIQm8tbwPAgDGy2kVFF2ke7GryTmXnqPFdd/9L5Cr5cGu7W0AaVtCSRNSRnFmFZBwFyJkXQx72xDWitkoSfAfpxRsSCI/QKX4SQiayQACISYXPFOB952pMhLpKgVzpQDb3WM+qKcEXkOkCGV3OdQhvHZuZQBlZIBRuCAaZBIDLnifkQSSMlqvKlNVX2QnHsdYAa8Jv1i7pSYdTFmT4nPiv9RZPK6ym1G2BVjvNQosZZW/uKXn9RrBMw6bc8PnHzlv7oBZPMXyUnuRMyTq/ec0vBoU1kv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(38100700002)(83380400001)(86362001)(31696002)(82960400001)(5660300002)(2906002)(44832011)(66556008)(8936002)(8676002)(4326008)(66476007)(66946007)(2616005)(41300700001)(6512007)(186003)(6506007)(26005)(53546011)(6666004)(6916009)(54906003)(316002)(478600001)(966005)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJoWS9qckV5a2ZPcTBQVnFUaC9pTjlwLzJYUTlCcWhiL2N2NkxQK3d0aDJD?=
 =?utf-8?B?UFVIVllEUkNTbUFNS04zUVFZeVAyNDN5Y1FiQm81bmp0YnV6TktxaGtydloy?=
 =?utf-8?B?bDdDcWxic1JWcUVGM3ZyTHBvVnhOOGl3dGtsK2RNajlvRkIreDMvQWVPSnhY?=
 =?utf-8?B?Y1NEL1Byd3RIVkw0YU1ibGJYcGwwYzJDTFlsbm51V3ljODlsQTBCVUlhT2Zp?=
 =?utf-8?B?akJIZ2RsRXJWY3MxakVVWm5yRFBjQmdDSnBxMlJUTTgvQUlvVEZZUnF5eDVO?=
 =?utf-8?B?RDhsdlBObHZQRm1EMjltT3p3dE1kOGdNRkFkQ1dVNmlNY0x2ZFNQUWZoVlRO?=
 =?utf-8?B?VVNlTUFzKzZnTjhkS2tsR0R6VWgvRkJhTzc4eTBaLy9zVW5jYkNFOXFnZDZn?=
 =?utf-8?B?N2pFSzBjSktJWHVHNHhHSmpmTDNFa2lJS0pXbGVwNjRyYXg1aGJWSkxzem40?=
 =?utf-8?B?dXBBUmdodUJNT1BOQ3VBOHpaeCtnOWtjdXBpTVc5ZENGczNrYmhKTjdSckVj?=
 =?utf-8?B?ellGRjNpY09pZS84V0YyQlZUUVF5QURDN2VVcHd4VUxHd09TMW5TcW0wMFA2?=
 =?utf-8?B?R2M4WTFhWTYxcTFLbFUvVnBQVGFsRWRjdFNVSE1Rbko5YzJmM1JlV3hXejky?=
 =?utf-8?B?QjJSV2tWY2xEMlp6cDZiWGhRNEV2S2lmTWFXa29WcnFsME14V2JpQzBCUTQ5?=
 =?utf-8?B?RnBIUVUyNERLMFFUdkdzM3dlVkswbHNwa3JXY1BFOFBrUEUxeXFsSVlGcWwx?=
 =?utf-8?B?T3E0UGQwRFE1eVhzT2ZyUW1hczliSTRRT2ozY1UzTHh2ZmNDWW1kR1dLNnBC?=
 =?utf-8?B?SWtPcUFQak5QZjVpcytGdXNuUnJhMk51eTBQQnRaUjgvWmVWZk5tOEMybmE0?=
 =?utf-8?B?a1J1Y1ZScFBlLzlMT2xWZ0RaelRmTVFoQ1F0ckcyeHVoRGhMU1ZtdW9LVytS?=
 =?utf-8?B?TjVjaFlaYVJncDltbzc3SStoMEV2UStrV0tLTkNlVWFDbmFhT3U1ZUVYUG5x?=
 =?utf-8?B?eUw2SXhGMUVXUkJNSm9seHVqRDVvZzdDNm9vM0ViOTlsVVdhNmhxdnBQckdk?=
 =?utf-8?B?SCtEa3l2Z1hpOXV0dFhOVXRTa3FMNmw5dXphQTFZenZLbUJ6U1hkVG51QkVz?=
 =?utf-8?B?aU1Jby9ROHpQSThwOUZhM0RvNHM5Sk1ZZHJ0UnllOUVTL3ROSlN4aFplUDVO?=
 =?utf-8?B?RE5mV3NGTldNSGFsMzBWVUVETGpmOEgyUU1BTWV0RkNaOWFnQnNNaDQzeGY0?=
 =?utf-8?B?RDJScWdrVllqV2tDdmdacllUYThiMktzSDhXNkVBVmF5UkdIdStXa1UwV1NY?=
 =?utf-8?B?RFB6K0NUREM3ME9xNGFiczVERVpoRE5jQm9qQ1lGRUlYcjlReXBMZ0ZyQmNP?=
 =?utf-8?B?Y2RKMEJNWlV0SVFHNEt3cjVGaGd1QUV5VVpiaDRnMURCelVCdENKOTVMbWlW?=
 =?utf-8?B?UXlWYXgrREdVZS80bjZpRURpOHhJZjJ0Q01ZbWorOGJWbFBRSUpENVozdXdh?=
 =?utf-8?B?Z0R4YXAvaDlOOEhPRXkrRHM2M1FpdU1WMjQvanlielFlb284ZzVuV1ZkR3Z3?=
 =?utf-8?B?STE5UEt1QnVEczVuMGtTRVBJdlhUTkpOOU9FTU9pcFRDbWFvZCs5VnNaTWhI?=
 =?utf-8?B?T1lPSlZ1cER0bGw5ZkRwdHEwWFpYRWw3SWhISGVsV0tER3hUYkZkV3dzRVVz?=
 =?utf-8?B?QWZUNUZIYnlNTXdlcWphTGN0UHpORHd2WSt4V3NHM2NINkxySUs3MU5nSnZW?=
 =?utf-8?B?MkhweVdsWHh1Q2VPb0Ura1FWVW5URGhXVWc0Ny9wQkxoRGpEaDE1TzZBNlBI?=
 =?utf-8?B?alZxeXJRcnZhSzI5NEt2L01UZjdQbnVyZHRxelpjcmo1TG84NHlGck51bS9G?=
 =?utf-8?B?MWozVDFTeE03dU8zZ1NKaXBQYnhhWDkyVllXSEh5TTRpMmtQekNJazY5RmV0?=
 =?utf-8?B?dmlCNjlteFFmSnRlbjRzNlYzbURxc1Q5ZkxnSVg4OW4xRXBpbDFoOUtRdGlW?=
 =?utf-8?B?OUt1c3lvcnhmd00vYS9xamdOTFFxUCtoUW02MTBuYUZXbWN1QmZBV0p3OFJx?=
 =?utf-8?B?SVJva0xhcjJtZnlBczFMUWZLMFgvWE9NUmhSYmRrd0xmQmcxS3dWT3lzaWJz?=
 =?utf-8?B?ZSt4L2Q5ekJEVGRuRUxBMTF3VVRZalp3S0dMajJTelNhRGxra0QvenJlVFcv?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1be2e2-3aa8-42e6-5301-08daee35c9dd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 09:26:41.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giykXUdFAjY9j6XxZkQxmUaz9PuvxIpb/KdBINTHTLeHvcVQa9AQAqm8uE1o5z0V+Kq7YLYOshxm3Dr7sEmLqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5783
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=do21t63Y;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.105.87 as permitted sender)
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

On 02.01.23 21:55, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Mon, Jan 2, 2023 at 6:50 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> Hi Prabhakar,
>>
>> On 29.11.22 15:29, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Sun, Nov 6, 2022 at 11:05 PM Lad Prabhakar
>>> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>>>
>>>> Hi All,
>>>>
>>>> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
>>>> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
>>>>
>>>> Changes apply on top of next branch [2] and the kernel used for testing is
>>>> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
>>>>
>>>> No changes from previous version sent to ML, just rebased on the next branch.
>>>>
>>>> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
>>>> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
>>>> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
>>>> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
>>>>
>>>> Cheers,
>>>> Prabhakar
>>>>
>>>> Lad Prabhakar (3):
>>>>   renesas: Add SCIF support
>>>>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
>>>>   configs: arm64: Add demo cell config for Renesas RZ/G2M
>>>>
>>>>  Documentation/debug-output.md                 |    1 +
>>>>  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
>>>>  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
>>>>  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
>>>>  hypervisor/arch/arm-common/Kbuild             |    2 +-
>>>>  hypervisor/arch/arm-common/dbg-write.c        |    2 +
>>>>  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
>>>>  hypervisor/arch/arm-common/uart-scif.c        |   44 +
>>>>  include/jailhouse/console.h                   |    1 +
>>>>  inmates/lib/arm-common/Makefile.lib           |    2 +-
>>>>  inmates/lib/arm-common/uart-scif.c            |   65 +
>>>>  inmates/lib/arm-common/uart.c                 |    2 +
>>>>  12 files changed, 1594 insertions(+), 3 deletions(-)
>>>>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
>>>>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
>>>>  create mode 100644 configs/arm64/renesas-r8a774a1.c
>>>>  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
>>>>  create mode 100644 inmates/lib/arm-common/uart-scif.c
>>>>
>>> Gentle ping.
>>>
>>
>> Sorry for letting you wait /that/ long:
>>
>> Patches look good except that they are missing ivshmem support and an
>> inmate-demo cell. You should have a demo and a networking ivshmem device
>> in the root and the linux cell, the inmate demo needs just the demo
>> device. Check out other boards for the required pattern, e.g. the rpi4.
>>
> OK, I will get this in. Can you please point me to any docs on testing
> networking ivshmem device if any.
> 

Once both cells are configured, you can assigned IPs to both network
devices, ping them or do ssh from the root cell to the non-root one. See
jailhouse-images for a pre-integration of such a setup, e.g. that of
qemu-arm64. I've just pushed a new version that builds here into the
'next' branch (still needs more work).

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c81bdfb1-055a-071f-8838-66b35173241b%40siemens.com.
