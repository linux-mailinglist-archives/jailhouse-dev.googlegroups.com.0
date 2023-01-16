Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGGASOPAMGQENFEN6DY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02566B6D9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Jan 2023 06:26:49 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id e29-20020adf9bdd000000b002bb0d0ea681sf4988635wrc.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 15 Jan 2023 21:26:49 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1673846809; cv=pass;
        d=google.com; s=arc-20160816;
        b=kU7QFkl37M2uz9XWSh9yqbnZyGgEssBnj+pyr3clbfnsNoMAl0/HtnliSuQTZwsKOP
         uRdVUq/49xS/hm8bYt4xnlWqwLlfgofrL45r6ArCrWWQ5MSxIevnYvI9gsPDGUy/jDB2
         +Ct4HFZqLTAKx/34i/Bs6jHCVlIW/ePNbKqxp2DokgJhFIz0mok4YxupzTx8b2/Ucdsv
         steAi8uf4qC7noD5lW/cCkQrR5Bri5ij3t6PCXT6fPyFo3YFEw4yHb+39pZqlGH/Id0D
         o7sPW3lQjr1+k6zx5Xz0LqCX7owBawEMZrrSZ53m8BQKeFP4jv+LuaE5qdFfwyfeMbni
         Xd2g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=LGDjQyOa5wD807Osw6qS+viKN/eMldzFyQVmHeOaoSk=;
        b=06wATHVr49VvmXtav9m/FkLAcjzRLeVniGk80sGi6p/V/Az+elZ64L2FRrvQMoZi8z
         mMNafONQLVAe68J08fy6IXUsI51+iHZeKJYOKEdgjsoelJuEtKClkIqh4NC1Zg8GqZoT
         +pmP7Ii7T8xURzEz8lX0soblFoTBv4zum1B3B6c3gbfXDfaT4PdJx+guKd48FORIjAp/
         7TrkOI76i9crkBoX8dIS1ax48oHgIuXqbuqyn9Rs5/KApu+FlBv3l6XyOMC+fMn5SJaI
         CfhWLgPEdCBR6GOCyeeA0s06ShcoMB20DfWtMXd8iFvpQD7pNMfwA1ltJ2XiPAmyqW2X
         0o3w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=OAdyyGGl;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGDjQyOa5wD807Osw6qS+viKN/eMldzFyQVmHeOaoSk=;
        b=tOB/S8TVl4WTLUUTvbL9TWUECJRqoJmfKxTNy9uatADIrs4NC3hlteEFX8klCBVpUI
         ywzKart6RgOw8XkNlwfr+P67wYqXYzfJ6f6lZ36Xk6rCqPbPO2lVa25Y6YcVMM8MMp1L
         to3A23SDf877VwgwDW1cbpfDGrRMTHdflCp7OV8ytpMXJz2/AtFXntF0tOoR6TDkB3DY
         C5vU0i9jkTM1zpL6sJrGAl6Ytd7uRQJwBEpJxNebH8FNdgM30+2lFdkCE1touc2zBpD9
         huoPvr6uVUgoIC+aZnR7p2tyE/w/HESuwOBLEmDyrmAt2gHtHpXwU3VkvT5XQ1fQLXgw
         yXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGDjQyOa5wD807Osw6qS+viKN/eMldzFyQVmHeOaoSk=;
        b=hr68ov1fJ3mxsEmSBko3Ax6h99vfxLVsxNtUh0EM5LjqJ84Sfk5fEJRnr9jgFsXi/f
         q2JyS1FAipGt2wUpqUgKnBcrVgOQlb7Af0lb5Ho9+OdiL3vzAnjRwDJ23LCO2D/FV+kX
         2XR5dX7jyBodudeAI/cvutxC4ZS0DAcwGY4Bp52m4kyX/u5G33Fz2PKhDT2jbFBGfcw5
         RJ5qZ5MJxe0Jv3Oa2ilm9wKhyuepe5HtUg8FGmNI9wm5qRl7Sat4Uk1upRFSGtTXoiqk
         Fl7iOlcYjCCBBUN77DOUZvB93K5qFeYvPrlVpfSJ6CdE36ys0r8NHBqPPkD009RY/itE
         +hhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krcOu9ZscZgZW03CRuTgJhSrqnoGaK8VWTKFUMKudNomiLOghNX
	tPH7Kv1RPfhiNaDI1jhbl7A=
X-Google-Smtp-Source: AMrXdXundQVNfj+RpJQO2jVSuP8lXyLAjkARjtE4TgJZCYx5gqxk3XG8DzjPJ/3+/MGOBaZWdwvuyw==
X-Received: by 2002:a05:6000:1a45:b0:2b9:28ef:24da with SMTP id t5-20020a0560001a4500b002b928ef24damr1607615wry.528.1673846808911;
        Sun, 15 Jan 2023 21:26:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:250:b0:269:604b:a0dd with SMTP id
 m16-20020a056000025000b00269604ba0ddls7576725wrz.0.-pod-prod-gmail; Sun, 15
 Jan 2023 21:26:47 -0800 (PST)
X-Received: by 2002:a5d:688b:0:b0:2bd:db42:36cd with SMTP id h11-20020a5d688b000000b002bddb4236cdmr9246070wru.0.1673846807233;
        Sun, 15 Jan 2023 21:26:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673846807; cv=pass;
        d=google.com; s=arc-20160816;
        b=W9FchvC+SpzHHeg3hJ9VTBzqBdH/WkF6aFGSH6DqQIsr3hDdwriX7y1Hv3wsMMTP2z
         /k998yBpjti9ctA9xUSeyts5rElrFbGCvWdQEBdn0dK33NU7p8cNqa35uZXTWlQkfhVK
         xecpHsXzUX3P/oOBhis9UMefYHgmFo6v26vKckeU6qrsd653wBY56gsm5bzxuFXv0/lx
         6/aM2893kbcJ+uGkNTlZ6lR1HA4Wvqw61o45+tqmdE9VAKFhwb+KiHf7igzYADI6skQ9
         OXWb6uUfE4q4UDanP6g/R/xGEu4KPg5yTQgeMp8K1UJnCyS1Ih6yR1ZTFVqGCfnYpemK
         FHuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=TF8xri+jhBqgyEHbWmwn6ysqM0UGoEXZoFwkheVEjVk=;
        b=JYG2yyEmO3VygqB6uYUn5HXemRffJDDZSwGnslGvpSkKa16bH1pv18AKoB11Ro2Yvx
         GX3IEnBON3G9m0kLyfuyqblpUbeDfnVJRXg8uJOel+62A4LtRTecsvL3ksonaJZhmVic
         /Tqrasdf3WZorw0bHxRuRkMpoekUbV27iMy/5/KFmMXYSsuscxtWqFdLkGb/8rMJbJRe
         rEV+FbHtb93mMH4c8C4+ta3ts/eBFv7ThdBFtgocWkgMEKo5BV6s015sz2R8H0h1hkiV
         GV+3XD9ZJIdyGLXqF2+st/AaIJckx+e968x5FMWsbeHdm+nIkMZMklOO31jo8EX+DzvE
         zH/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=OAdyyGGl;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com. [40.107.20.58])
        by gmr-mx.google.com with ESMTPS id bp11-20020a5d5a8b000000b002be1052742esi13541wrb.4.2023.01.15.21.26.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Jan 2023 21:26:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.58 as permitted sender) client-ip=40.107.20.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fl6uIJrOa9Q+Y9PjBA1zfqY1ld2C5LxEgYK34QcW6sluExfGuH4SAfeKQ+G+shYs1lM+ubjwknMWMBb29WFarl73aoJruskXgkhi+5La11Dn5oozJNhP74x+qfMLt2Be/CRFghbsHK45NNg6O7zxfR/iI6kANNGO1Vv12hvfL4N5+DiAwApnJ5Osa7HmvyqUIHfESPuCtlbkBJoHh8fsiccM90t9YtO5nDaovX9vDMmcah184sV9e2vmCwHo5ox1baCofp88mln4F/HR6+eoFbpqFMIzTI2eWgg9wta0o+VDNi+sMedP4pS0j1eGJ2er6MkkfsirC8VzRYoIjjGdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TF8xri+jhBqgyEHbWmwn6ysqM0UGoEXZoFwkheVEjVk=;
 b=APZARP7G/m7wGlbUm/IlM/YWACnFgtzfM8hmBaxby6lOHOeP69o9rk9wAgzQfgomwOtLD305xF2uDUufJqKun9NqHligzU6hmsdBN20ydn2JHWigit3z7t9mEDQCrT7OGYE2LAOx9Sst0KRTt52KXC9NsedN4UkNoTXyMKAE3GIJKuReDzQazaSwTMo+Z/rKNvvt+AkZRiKO552rgyddIZbua1W6lwW29Cw7zwKniup/NLGVKzWkG5BGqZpRzBpJBE3kZ+vlO1bBKWmSs3gjFMbH1YsL4rw9UeoRvZj9sO3717EXtNQyMRhQ3SwikFXtlKr2ATKxeRRPigN774hbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by VE1PR10MB3885.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:167::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 05:26:45 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%7]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 05:26:45 +0000
Message-ID: <e26f0792-ec58-9edd-1bce-dcc8a6df0382@siemens.com>
Date: Mon, 16 Jan 2023 06:26:42 +0100
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
 <c81bdfb1-055a-071f-8838-66b35173241b@siemens.com>
 <CA+V-a8vGTk42JrrN6_5N21i_mcUgsuzVc+v0wT1VQUaqmjcrEA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8vGTk42JrrN6_5N21i_mcUgsuzVc+v0wT1VQUaqmjcrEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|VE1PR10MB3885:EE_
X-MS-Office365-Filtering-Correlation-Id: ec140f9c-283e-43d1-6c4f-08daf7824202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ubW1WKckRoyj5R8MUVmaQVT/LQAOwJIFgfOTBEwvDA+8pIO+VLjtQiXkavZN7WjumYlP1ASnmJRCaxumj4WXyEY20I7NLD9pfzaNqDj1QT0/DbfwKB0smnZF/4H3cWcgkN5zIKqkDfp/bKyvz6EFBextyi+rKIzgngZPqg0gqPTS0q6oBpWJsCVr7LxOGXTiP2BEEeflvqgpxPuT4whfijEUzd2ql0UhsMIazzoYAKE6tmA//VISoOvSUkxKmOfptMfvy07MljMo9T+29ckCJxTTikqaZKqqDeadt7i5fLd9Jx9QBV1MbU1Mk2ovK/+TDUC5I5uIG2N+VjGvxZBLc0WPN3qwfIXhQSgqwzhY+cp+ziS6spNNq5KR/yem7xSeqWlSrsRMPuABOnuXCnTjvStfrquGn6/+6IU6714uEjffQV0Icy22SYkHqVesF8TM0wjSbaFMKj3YLCgSXv+btdEgU9S8zq4PofN+9Wmnh5lIm+ZVoYuYL+FBxN2LLjkljmcNvyoaiJCoYkG3whIx+PRECorZXtLGaqh+1m+SvZTPZY6w8vzYO2B8tmQlG99hN6nTagmlhxL+OXp9zSNgmgLkJCwXlnCF2eMqH2uXYz1B6xlq1/4pxusaK7czNqmOkLMI5fpp2lJhEiTIOpVuKDcxN7/gyzXeskTmIb2M2qJJNIqOMHNBMePRibGfn5xsbdkVfQz9mkM3Mx3J1VSMLr5c+q7tev6fT6rpOgZm2DyXF5J89RzQK/P/1grHqEqY/UEHbAX8MjNpJXNAqJRM2wDQRaMhkgAWvTldybDnnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(31696002)(36756003)(86362001)(53546011)(186003)(6512007)(26005)(6916009)(4326008)(8676002)(66556008)(66946007)(2616005)(66476007)(41300700001)(316002)(6506007)(6666004)(54906003)(478600001)(6486002)(966005)(44832011)(38100700002)(2906002)(82960400001)(83380400001)(5660300002)(8936002)(66899015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm56dnFxa3YrSUlKQVoyUExTMHBleC9EelpKdFhjeExOQnNwNkQ5SGVhRHlJ?=
 =?utf-8?B?YTY2QmF6ZmxDdzlMMXh0a2JpeVFPSVVUMUo2RU44aVhwSGtQMkkzVTNobFlS?=
 =?utf-8?B?ZndDWkhGcGYyWmNUTnZRaXQ3RXZsZUllZTQ5ZVA1OHdxZmwzMDF4RDFlaElw?=
 =?utf-8?B?di9idVUwMDdtZWpXZ3NlbkpnazNuOHoxOGhzTFV1V3hPYmdjNmhWYTcyY2ho?=
 =?utf-8?B?ZWhUdUIzbG81MWRoK0pZa05LMjFBdVIrSGdRQlNXTTRhWkNiNENYaDllWXEv?=
 =?utf-8?B?VklKZ0hGWUhLa0JaRm56ZDNHcmV6TEtPaWR5TXRQaVVvTjE2bEFJRHRPdXo0?=
 =?utf-8?B?NitreWRMaCtTeERkNEtVRzZxSTNGSk1xZFFEZ1pPSUpHdUdjcU4vY1RBalRH?=
 =?utf-8?B?bTVRazgvUkZ6c3ZTd1pJVFlxUU13cHpmajU0bjdJbDVSM2lkYXRsbzQrSGxk?=
 =?utf-8?B?R2ZDck11bHd2dzJoejBITGdLS0xhODZWUGk5Z0h0dXZOZTZmVjdCMmZFSEhD?=
 =?utf-8?B?a3pDWXM3eC96Zm9WeWNUWE1TTlRLZ3pxV0RNZGVoYTQxTXBGSDErNC9HcS9T?=
 =?utf-8?B?YllIV2trb3EwSFg0QmJoWklNNHg3eG9xVWRmMGhjR254bFZHMWtKaDlsQVFy?=
 =?utf-8?B?Y1FmZDM2TnF2WXVrSkRKNjByYWd0SXg3eDRRMzZaK2FlRDNTT2ROM0NJZkRR?=
 =?utf-8?B?QWlIMjdDRjc4RHFUcWdyUkNvRWc2ekdZZnc0N3U5dFVnUURQL09zYVpHZHZk?=
 =?utf-8?B?elpSdW9JcEFrdFdyd2plNUpFNWk1RURzV3RaVnYzSGhrcTJCTFZnYmJVLysy?=
 =?utf-8?B?QWR3RmNCSlZXQ2puVmlGODdzclFQMHo0Sk4rWnI1eVBlZVdVaisvTTVFUkho?=
 =?utf-8?B?bTMweFFNNHo0YTNtZGErcS8yNGJXNXJhMzc1WFVtVHNXczZiVEVrb0hHaXVM?=
 =?utf-8?B?NVpkRFNLaG1HYkR5TVArRWxGQ05SU29hWHZiTExZa1pCQ2xYK3ZTRUh0Q09s?=
 =?utf-8?B?eWszekpUVkJzT203TngwVkYxOVdmTTFoN1ZoL3Y3eU11QXZZYWdFR2VtR1Zr?=
 =?utf-8?B?Nmh1Y3VtUHo5aUl2Vm9QM1VZQnU0MUJ5U0JkZjBocjF5cE45eUdXUGdkSVhE?=
 =?utf-8?B?Q0QyaVp3ZmRJQnNWQ2JvTmRCa0paZGc3WWZxb2ZLVzRYMktOOFRrbFBmWXlR?=
 =?utf-8?B?Vm9WSGpvNzJJQzl2cDE3TjlqcGxHb3VEN29aYUNoUTNiVkFVODJVYWxidTdz?=
 =?utf-8?B?eVR5NWpYQmYwQlVFc2w0QXV5dFY5bHRGSURqSmFDSk5UbjVTUnMwZ0pRM2NT?=
 =?utf-8?B?T3cwU0hLRmh1Uk9jYTVjRkhLajM2M3lLeENGTHpSc1cydUVVMUMvSEllQ3dN?=
 =?utf-8?B?UjR2c0thbENKYWp0S3J1ZkprRFJnTkJvYWprbTZhdzlENHFoQmszb0FKYWNs?=
 =?utf-8?B?Z1VCdzZVMGhlTDFaYWs3MXJNanVKNGtjVis5UFZlZjdFUE82WTc1VkhJYWNt?=
 =?utf-8?B?elg4eXFaUXR6L0NqMVUwSXhZajZvMnIwN0hFRHJxR0pUa2lmQk40MUIwTnlU?=
 =?utf-8?B?NDNNeXlPNkVjdVBNUmJ1bkp1c3VkMWM4L1lndTZoQjdrcUFIZG1GSmFELzg0?=
 =?utf-8?B?NWo0dEl1WEFoZWE0K251bWltdUJUVHlLN0REQ1I1aEdRUlNBZTAzajVxOGlK?=
 =?utf-8?B?MXhrNW1zbGNmM1lzSnJFSldVakR3cmRBem1nMmh4OFllT0FtK2MvV2dhTnRT?=
 =?utf-8?B?NUp6cU4vcEhJcmlPSmp6aVE4Y2F5L2FhbnJMOXhlbzM0cm5kY0lUV3ZqZXRI?=
 =?utf-8?B?MVcyOGtEWXh2MEZzTi9ReDRpbXA0Tk9BQ1U3cEdkTExueEpHVTBSRDd4cWlX?=
 =?utf-8?B?Wk5nbU93eExURnFlNHVwT2lvUnlZNVBXNGdPVHVxT1RnbG1lUnJ1ajZsa1A4?=
 =?utf-8?B?elNwZ3FpTUpWM21kdmxIMG5pM3lJdmY2OWRkekxmNXBOc0M2UXY5SFpsWFBm?=
 =?utf-8?B?c29Hc2hGRzVFZnhNQXJiWTlldE0zUzlmZmplT3o5bVV5MW4zckNzZFdreU1T?=
 =?utf-8?B?cG9lYTRCeW1QRnFjR1IxU3V3Wnl0YVJma0dSaStmNk9LZ3NtT29JT0pFaXFJ?=
 =?utf-8?B?R1lmUURQVkZPN1BRR2lSYUw0aFBTU3NCcktGcVRWdFNZSUFPaWVPN1Y4MFF5?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec140f9c-283e-43d1-6c4f-08daf7824202
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 05:26:45.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScOT9NlAn5xyCsp99BxzrWgofP8pFABk7s9PgwM2jm6MzmcEhoNFXcgj1EWDA7WRvcTyzHHvQiLhzna1opVMtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3885
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=OAdyyGGl;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.20.58 as permitted sender)
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

On 15.01.23 15:01, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Wed, Jan 4, 2023 at 9:26 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 02.01.23 21:55, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Mon, Jan 2, 2023 at 6:50 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> Hi Prabhakar,
>>>>
>>>> On 29.11.22 15:29, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Sun, Nov 6, 2022 at 11:05 PM Lad Prabhakar
>>>>> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
>>>>>> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
>>>>>>
>>>>>> Changes apply on top of next branch [2] and the kernel used for testing is
>>>>>> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
>>>>>>
>>>>>> No changes from previous version sent to ML, just rebased on the next branch.
>>>>>>
>>>>>> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
>>>>>> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
>>>>>> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
>>>>>> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
>>>>>>
>>>>>> Cheers,
>>>>>> Prabhakar
>>>>>>
>>>>>> Lad Prabhakar (3):
>>>>>>   renesas: Add SCIF support
>>>>>>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
>>>>>>   configs: arm64: Add demo cell config for Renesas RZ/G2M
>>>>>>
>>>>>>  Documentation/debug-output.md                 |    1 +
>>>>>>  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
>>>>>>  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
>>>>>>  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
>>>>>>  hypervisor/arch/arm-common/Kbuild             |    2 +-
>>>>>>  hypervisor/arch/arm-common/dbg-write.c        |    2 +
>>>>>>  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
>>>>>>  hypervisor/arch/arm-common/uart-scif.c        |   44 +
>>>>>>  include/jailhouse/console.h                   |    1 +
>>>>>>  inmates/lib/arm-common/Makefile.lib           |    2 +-
>>>>>>  inmates/lib/arm-common/uart-scif.c            |   65 +
>>>>>>  inmates/lib/arm-common/uart.c                 |    2 +
>>>>>>  12 files changed, 1594 insertions(+), 3 deletions(-)
>>>>>>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
>>>>>>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
>>>>>>  create mode 100644 configs/arm64/renesas-r8a774a1.c
>>>>>>  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
>>>>>>  create mode 100644 inmates/lib/arm-common/uart-scif.c
>>>>>>
>>>>> Gentle ping.
>>>>>
>>>>
>>>> Sorry for letting you wait /that/ long:
>>>>
>>>> Patches look good except that they are missing ivshmem support and an
>>>> inmate-demo cell. You should have a demo and a networking ivshmem device
>>>> in the root and the linux cell, the inmate demo needs just the demo
>>>> device. Check out other boards for the required pattern, e.g. the rpi4.
>>>>
>>> OK, I will get this in. Can you please point me to any docs on testing
>>> networking ivshmem device if any.
>>>
>>
>> Once both cells are configured, you can assigned IPs to both network
>> devices, ping them or do ssh from the root cell to the non-root one. See
>> jailhouse-images for a pre-integration of such a setup, e.g. that of
>> qemu-arm64. I've just pushed a new version that builds here into the
>> 'next' branch (still needs more work).
>>
> I had couple of question,
> 1: For the pci_mmconfig_base should this PA? (If PA what range should
> be ideally selected and should this be reserved in the root cell?)

If you have a emulated PCI host controller (which is the common case on
non-x86), this address should be free in the physical range of the target.

> 2: How do we calculate vpci_irq_base?

There have to be up to 4 unused (but GIC-wise supported) interrupts at
that base.

> 3: When do we need to configure the stream_ids?

Only if you configure an SMMU. Do you have one and plan to use is?

> 4: For the IVSHMEM 00:00.0 (demo) the PA range should this be reserved
> in the root cell?

The PA should be physical RAM that is otherwise not used by any cell or
the hypervisor itself.

> 5: And similarly for IVSHMEM (networking) the PA range should this be
> reserved in the root cell?

Same story.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e26f0792-ec58-9edd-1bce-dcc8a6df0382%40siemens.com.
