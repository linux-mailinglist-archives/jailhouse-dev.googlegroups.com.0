Return-Path: <jailhouse-dev+bncBC44VTVY2UERBDNNR6CQMGQEUHASEUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD5387BD6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 May 2021 17:00:29 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id s23-20020a1977170000b02901fc6bd7b408sf2145659lfc.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 May 2021 08:00:29 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621350029; cv=pass;
        d=google.com; s=arc-20160816;
        b=DI3IYp7/hDvWeWqx/pKbca/W979a5IfwDz2kSTxY8GzCWCIo+zAAbABnC8jhom6zLd
         MLna46bpggB6S1JfFxLEbI7T2xL+oaEkql++LfeGFn3SkaCDO83cHzPu+C/Kg8n271c8
         1panpiVwo9QVPzD0DziVrnfnm4KhCHTm3437n2jjLeC9Re0c/T0U9SVNRn1aJ/jCclWr
         8j38t69r/QVelDglJHDidE8E99XKrHnC5/2HPGwCQlK8rM/MD8gxJh9iEBm1/rc2OLox
         80Cln5gAxYZYlWSgmQUCWjbKcucM3Wm/UfDm1uVgs3nwsXKGNZdlscCAPc6PHNdQKOBK
         piIg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:in-reply-to:user-agent
         :date:message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=eq74P5X8AX77HOswoa5Iw/4mN3GSOVC5SrfeBHDtBgs=;
        b=rVX2mbzJsU7WfLXi+TjFDmKR+GIoqlqBS7h2VQYwbdYoeM+KtbpBJLUlVKeKklKXPJ
         5kOcNdzqqLyWbXzjDvtDL/p4Z3Rj3gVKA9lQS9NP0STeF6xRKer3DSi9JqlEzS1EBhv2
         NmidHQWhcOHfRq9QtB6PPvX5X2mfVlT54sKbr7ulzwOleooPSFQQYnuHtk7c0DiGxnQf
         fNA0GZ0YsH/6wK1hss0X+ey5nYa4H23FjyvKT7xFLXH1ojQDThPSwIz5Ug6cUEoCAkvc
         OcE/96kUN1Ps4ft9BiRG7B5QDwWy63I+hp9+zpDut329hz6ZTnANw95P/cIINqa6anDp
         9Ohw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=mV8Pq3aL;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.0.81 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :in-reply-to:content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eq74P5X8AX77HOswoa5Iw/4mN3GSOVC5SrfeBHDtBgs=;
        b=J6wnezCcjft0bHdjfq/yZDD7IN5k5jF7E5xf0OOijKY1mcpWhTHhAueAw4uNei92yu
         mj4ebvrwOyOhQNym1sRWq9dfjRzGh1mdH/c4ZDN7ejEt32sPRbm1hGe42OPWm/r9ZwNy
         6yTmJ7dR35/9dxFQoc3q69y20r8Ea9crMBiLUq7wOrQAV5vPaNZFiyTouwFgvXy4KNLu
         HwzJ93e6xHdxh8RqHs3tapIVfPn8h5RUpHffF/TKXPREzbYvz4O3ueIZgOyUJf+jphag
         jERAJaDu6lfM7jxeKw4xW21pBqQp80zUtEnnsGj7rPyoigTuhroUCwsR2Db9UoJhrPna
         KZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:in-reply-to:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eq74P5X8AX77HOswoa5Iw/4mN3GSOVC5SrfeBHDtBgs=;
        b=YkOJSz+4x8qLO0YkbOMaTmXRrlyRbNLNl2ORoWem5IH/XYMC0IrqtyafRSc8EUnvSz
         6gJ8ypjGkBKFy0XQjDPgl0QsSxo28W7ZLKYCCxUO+1SyIvGuMjyD7RgNCPmWbggj5ZJB
         duum6uuRE3Cax7wTLIl1xTVqNjaA7sZ3fMMTRHi5MnzAMekUMnfHJDA0D1WTd0nXDE0q
         1ZpPAmABpPMMBmkLp8phyCBtz0VG2chhGoHqv49Ma4kjSaJtzEbxFbgL06qNv0wD3LSS
         BmVCQp3gRzCjgcvE5crGRHzYSd9pBcyzrzaUFK2Rg9JNH+i4XquHxqSOXXi57OABGW5e
         dc1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Vy01gBesfWEsPDMxjiIN+bI3UvftnALDj5eRp/eZ9Mo+3PpOv
	jKEWNVHyiwQ2AURI60gB1jw=
X-Google-Smtp-Source: ABdhPJxFhktMgYELo7bbzbnIxF8Cm/Mrl8jvzrgdbGuqSMKqlb2jQ6yn2HSZlqCgYBgVxQaccvn4vg==
X-Received: by 2002:a05:6512:2089:: with SMTP id t9mr2691243lfr.257.1621350029468;
        Tue, 18 May 2021 08:00:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5592:: with SMTP id v18ls1577855lfg.0.gmail; Tue, 18 May
 2021 08:00:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3587:: with SMTP id m7mr4655247lfr.282.1621350028372;
        Tue, 18 May 2021 08:00:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621350028; cv=pass;
        d=google.com; s=arc-20160816;
        b=CdRHTMeelKxY6rZCM+kKEUYgMH4vPmvE6pBEF7DAoprisDVTMEAhXGOWUs19V01/t6
         l2S0mQpzONi0T0BQM0egVH+nob2Kj+Gppl3CL36Lqzy0BKU547DYNsv0GCNdhiUMw9LT
         VQ43eCrkmFL9p2UnOXRXLunGzl6k0VlZ7suy1Pd0FKJq73+cryrRmxqTUrViuLx1GaEM
         q7KZ/YHPTDUwya9jq3SLSVLN2LaCO3FN38wXBglpvLO8pri03QbEqttPp4nJYs3zlVm8
         AGh7xHwBNEpuQonBI3FCPT/ti8005oyrCmddDeRxGDquCFf9/8SSTQ4uu7YuK4/3jyAV
         RKgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language:in-reply-to
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EW3j44zOgokBMykYxZakJr2lzVeIId26oLARszrYjwk=;
        b=o/ady+CCSCR8OD2PkDTyW3fhvGaGvS2zsGigkDKEfHATgjG9/69dYxUlsiwVB9HZi6
         T2wTqgUkHz2SdJf5Z0sLue921xcd+hze+OOoBEJyKs5Z/7G4qGxOq0rqCmvJXwRf3Baj
         WqdtC7TGfy0b53orT+UyxlXTNm9YESrbr5aBNTa+1j8XrWy17+6UFeJ1segNHqzDNDtX
         AcmxZbQ9Z4hMnDdmi2ve7p90sTbof/Rd8BVyUOy5/4MDqzZy8dayGv/Vz9GIrB1xYytg
         mKK8XDHMMum+KEb9J7OCndCp8wRwR0a9SmffuXfklEMmjgSBXDCgw8ipo4y/GEZf6a95
         5qPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=mV8Pq3aL;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.0.81 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00081.outbound.protection.outlook.com. [40.107.0.81])
        by gmr-mx.google.com with ESMTPS id o13si226638ljp.0.2021.05.18.08.00.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 May 2021 08:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.0.81 as permitted sender) client-ip=40.107.0.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmRW7VQ7yUviV8uD4jnBWk66bQCtWyRV38xMdsB7O2MGzl52SLBpiupyntm7nNEYStXTvXqN3n4dONt0uTImDRWsrFO17oswgkmmDZL9a33Crb5dMIiZLbHSnxXMSMQIOyrtH7KNRBs33tK7vwSv3/bsFDQds/qhjKB/1psRsCaoL5gKpJ5dr7qgzHvRMhVXuyhfHOPjY0d1zEyqEZwahK6EeqoGlx4ufWAqYEU0XRUc5jT/qoEzRhXjLUQblBuvRxrsqIFtaTDSmSwC7rlYSI4t9sanGHbXkTUzozIpHGxIoeE4PpvSP+43bNZa6TqTT/8j20Z6NV4C10pgh6b4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW3j44zOgokBMykYxZakJr2lzVeIId26oLARszrYjwk=;
 b=ksF0ewbYp5C7dsWGLRnpAXcu7qct785SDN6U+qvRzpfvHQ+2UW/MgyMXVriOxfJmLJJ6XmaSYpvcuFigwp7/t9UwV3+FBNq9feuxBB8pqQPpsDW5H8H3qIanUCTMP523DQoAoDRUO8Jmk5410KqYSuP8+I3F6YhCO4h+BZmwYMRYTk2lTYUcHuM678vHiltdo6lWixMpe9e/vAxVMK4M4i1V7uf6bIjx3wm+o60McYHDa0k0id946MkpZGkai9puW5Tm37L/y3gjDlrG6f7kxu5x6gREnBkM2zSeN9Ps3WLUrr3vxdJdhyLwWsOBR+LClNpXS/lqLwhxzSwsphGpuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3714.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 15:00:26 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:00:26 +0000
Subject: Re: Installation error in Fedora
To: Henning Schild <henning.schild@siemens.com>,
 Prashant Kalikotay <prashantkalikotay1995@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
 <20210518154123.18b0ba78@md1za8fc.ad001.siemens.net>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <c70b4564-a830-5e40-a7d2-ced34578027e@siemens.com>
Date: Tue, 18 May 2021 17:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210518154123.18b0ba78@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:810d:82c0:38fc:e180:2248:7590:2b4d] (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by AM0PR01CA0175.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 15:00:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf9cb7d9-b9fc-4fcc-2821-08d91a0dab50
X-MS-TrafficTypeDiagnostic: AM0PR10MB3714:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB3714D33D0BF91C34AC962AC6F62C9@AM0PR10MB3714.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sg5H33b9tdihkBT0DypLi2BjyII/fJiz546rGtZnqLiTFRKjCRNjGd9ntQ4dMXjKtVvxMlspinCIsoBNDESkIZgFxbdaZd8vTfV4IyQWtrwJ9ihO8jeQnHMeYTKDwqVlVheRx0GKd2/LEz5UQWqQLk5M6LIi88hPTVd9DOpnWr9IQD2X5FgavwH88Ynvc4yW5MhmXJIJH4x0MjIsbWAPYP8QP7x63uyFVEQ9Nlumgqn1gozg1Zwu6BSC8t1b5mbwjP59nLez09ji8sIAOSaYC6Y8HpXajUcUedy6o4UR8ahcex5rSuceKCdaAKhbJx1PLnSyArVJCpchtXvtoFWkVjnHBuat4vDGYa8ZRJFF1yPr19fdi3fOpn9dTjeBPNq1hsw16YGBuoNAuCNHMj12P2M45cVuHq9xPMCxOTVU0zqelqR9TDV+pncVHteI9n70yZZCimFL1IUtWgF4jE6Webq/a2YNkYn0Ub1FaaN+WNviy72w0jTeNljbVjd/XD0gMBIe3ttcLdPEg1Xbs5NGff8dlLElkk3vyY/QVAcdkrcLF3rnWN1alet63T/oMKXyFCRBdP//2P3yqeFKxMEK0gEhJNVWcFQifcrQSiZGbD8h6McV0LgFLgE5MVhDF14d6WbYVZbSjKit0iMULd5BRFHqAom5OUVXZ6lfHOlZDIVVHzMNdKxvYhQKgi8jj5UNnSlOEpcy0vx3VjZVe+2cUP55SFc0uGhhKfbCt9Yau5jIOQNWDd45BBAjZMPTwt4XrIoaILcD2FCsMdy8Y5eS7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(110136005)(3480700007)(478600001)(30864003)(45080400002)(2906002)(186003)(316002)(4326008)(31686004)(38100700002)(31696002)(16526019)(83380400001)(966005)(8936002)(53546011)(2616005)(6666004)(86362001)(5660300002)(66476007)(66946007)(44832011)(6486002)(36756003)(66556008)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDd6U0JjQ1V4N1VNK2NuMzYxaWJhSkpkSklYUGN2QVdlbTIzZTVEcnRHbnpZ?=
 =?utf-8?B?ZjNwOXlheC9Qb0ZNQXYwck9FYTFsVVBkUXBpL0ZXdnpyUk43NDBFeloxMGlR?=
 =?utf-8?B?SGhkT0wyeFZKdisyd3p2SjZKblYvN0EwMVdndENoemtmY1hQMzc5ekVON3Js?=
 =?utf-8?B?RW1DT3c2ZnR0a0JWQkVWdHhRYy95UFpRSGxwa0NCdlFoMFBqMHR1ditJRFJL?=
 =?utf-8?B?dEEvMVFWd1A3M1V3REh4REtCRHY1a3k3bC81dnpXSGcyMWxkMnVoV2tvYm50?=
 =?utf-8?B?SnpSb0w1TTh1dHBEall4MXIzZ1FKUFIyajdCV1hhT3RCb1Y1c2tkbjV1WGJP?=
 =?utf-8?B?ZXE5bDNqaUZXVE9TdDBtSzdKTCtaVTRhSWdvSldxVDl5dVd1aG9GN3MzcjM4?=
 =?utf-8?B?bFAzaUx1Z3RlekRabUVuQkR2aENiL3JOd2l6VzBKdi9CQWdJNUpwYy9ENFpw?=
 =?utf-8?B?SVVhUjlBZ2VrNkNQUGNTdDVMaXRwaE1JNnUreWhoUVNxRXA4aFcyUU5yWCtV?=
 =?utf-8?B?djJRTk4yMUlZOGdtbmVucUhobEh5VGFjUitOeUpHeElxTFdnNko3bXNRVjR3?=
 =?utf-8?B?KzVUWW45eTNoeWoxNTV5UXpxaUdZUm45OGlGeldNS3ZBNDBWK1RMdDJ6REhv?=
 =?utf-8?B?Z3hUTHhTZG5WSTc2NnVuYS8ySGkxNVQ2dVJaSlhnVVlSNHk3Qk1MUlJoaUUr?=
 =?utf-8?B?NEpFdmVOMFlybWFsY2kwSk5URm5yQ3FYb3gzTWNXTWF4cSt2dXVDYlFJaGJy?=
 =?utf-8?B?MFlDd2tqZVQ2em5QZXBlc3JNelZGdGRid2tHREZUVjFtS0FSTTVRazIrT3dV?=
 =?utf-8?B?NHJXTXpZWFU4UXN2S2dnR2pqZzJDd1NZcHZoV1VvczQ3dGRqcVAzUTE0dzRk?=
 =?utf-8?B?ejk5dVFVOHpPS2RMdXhEY2t0TkRlVWlpZkVPdm43Vk96WUNrUTdrcEpFM2V0?=
 =?utf-8?B?M2VLUUd1ZVR1ekJlb3RVYzZkejZLMXRsNjRxbzBndjdrQ0hGL1FmMG5mYzVI?=
 =?utf-8?B?aWhPSGMxYVhjRytKVEd0b0d3bGVpd3VWck5RWXU3WXRSdGU2VncwSUNudHdy?=
 =?utf-8?B?U0VMMnZ6ZEVYVEpMb3RsQ1RBZ0hNSHhzOVBOU0VJQ1FnVU9nN1V4QXExZGJ6?=
 =?utf-8?B?YTAyL2tmTVNva1I1Y01qUGhqam53T2NpT0M5MWFUZHQ2MUdnd3JPSnRLNklw?=
 =?utf-8?B?cmdZb29lV29DMEhiVHM3VWkxS0V3Tkxhb3J1SmtCQUJNRzNmWnFSUTV4OGhu?=
 =?utf-8?B?UkJEdUkyT0RteDNDRHA1SmlYQU1yWVlaK1ZnbnFWUGpxUloxdm90a1lQWGpk?=
 =?utf-8?B?akQ5OHo1QUV5QnR4QWplZzcwSmtFUit0Z0hEZS94dU9qS3crVXRQRVlXVkl3?=
 =?utf-8?B?YlBDb3RxaFc5Nk9hdnVTQTM1R0dOWld1M0hjRTloYjljUzk0bCs0SzBXMEhB?=
 =?utf-8?B?Ums4dzJTWVZ5d1A3cVlGQ1hlL3k0a28zRmV4NWFlYVJnYVAvNUxOc2NRcEdE?=
 =?utf-8?B?TnFVSjFETzVDZkFiQ0dmNGs3cDQ1clY4RFdMQkpETXBJTjJpZnB5VDNDL0xH?=
 =?utf-8?B?a1d6dU1XdFkxVGJtRjlNRXk0RXJpSmxlaXhqS3ZxUDB6N2ZpUjl2cWxPYUNp?=
 =?utf-8?B?TWNCTzNiVnRsY0xhTk5ZR2tFZGwxY1o2R2t5Y2svbXowMlIzVUdIWWpibElC?=
 =?utf-8?B?YUErNGpqem9KMnFTRHgwclNVR3FJQmw4OTJRMGZLQ1ZjMjBCb2dYQ0RhYUE3?=
 =?utf-8?B?VkdpTmRPNFJpR3FERk9iSDhzejNmWU9wNC9DaG9vSUlmdkFBQzdnYTNWRjMr?=
 =?utf-8?B?TmRtZENNbTFnTCtmS3pzbVpSTjY0NVFvTXdrL2pLREZDT29SK25IQlBTNUNm?=
 =?utf-8?Q?qZ9xcGuAuRcBa?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9cb7d9-b9fc-4fcc-2821-08d91a0dab50
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:00:26.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOXGT2ZfvI2umFKBmXzfYYei9NevOtVjMRG0hhtmaf2YvYywWPKx1+LiZJ4uFkWU4ssuPiifyC/WxqjBKkOj9re1rbagVvyDQOfk+WbZsQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3714
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=mV8Pq3aL;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.0.81 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 18.05.21 15:41, Henning Schild wrote:
> Am Tue, 18 May 2021 13:32:00 +0530
> schrieb Prashant Kalikotay <prashantkalikotay1995@gmail.com>:
>=20
>> Hello All,
>>               I am trying to install Jailhouse in Fedora, X86 system.
>> While running make I run into these errors:
>> [prashant@fedora jailhouse]$ make
>>   CC [M]  /home/prashant/jailhouse/driver/cell.o
>>   CC [M]  /home/prashant/jailhouse/driver/main.o
>>   CC [M]  /home/prashant/jailhouse/driver/sysfs.o
>>   CC [M]  /home/prashant/jailhouse/driver/pci.o
>>   LD [M]  /home/prashant/jailhouse/driver/jailhouse.o
>>   CC      /home/prashant/jailhouse/configs/x86/apic-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/apic-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/e1000-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/e1000-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.cell
>>   CC      /home/prashant/jailhouse/configs/x86/imb-a180.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/imb-a180.cell
>>   CC      /home/prashant/jailhouse/configs/x86/ioapic-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/ioapic-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/ivshmem-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/ivshmem-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/linux-x86-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/linux-x86-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/pci-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/pci-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/qemu-x86.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/qemu-x86.cell
>>   CC      /home/prashant/jailhouse/configs/x86/smp-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/smp-demo.cell
>>   CC      /home/prashant/jailhouse/configs/x86/tiny-demo.o
>>   OBJCOPY /home/prashant/jailhouse/configs/x86/tiny-demo.cell
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/asm-defines.s
>>   GEN
>> /home/prashant/jailhouse/hypervisor/arch/x86/include/generated/asm/asm-d=
efines.h
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/svm.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/amd_iommu.o
>>   AS      /home/prashant/jailhouse/hypervisor/arch/x86/svm-vmexit.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/apic.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/dbg-write.o
>>   AS      /home/prashant/jailhouse/hypervisor/arch/x86/entry.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/setup.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/control.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/mmio.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/iommu.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/paging.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/pci.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/i8042.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.o
>> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In function
>> =E2=80=98vcpu_reset=E2=80=99:
>> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: warning:
>> =E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds [0, 0] [-W=
array-bounds]
>>   429 |         memset(&cpu_data->guest_regs, 0,
>> sizeof(cpu_data->guest_regs));
>>       |
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is a warning and treated as error due to -Wall.

This warning is GCC 11 specific, the code compiles with GCC 10, but
fails with GCC 11.

I looked into that a few days ago and considered that as gcc bug. In my
eyes the array boundarys are not correctly "detected" by gcc and that
might be the reason for the warning. Not sure if it was already reported
upstream to the gcc guys.

>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/efifb.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/ivshmem.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/ioapic.o
>>   AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-amd.a
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vmx.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vtd.o
>>   AS      /home/prashant/jailhouse/hypervisor/arch/x86/vmx-vmexit.o
>>   CC      /home/prashant/jailhouse/hypervisor/arch/x86/cat.o
>>   AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-intel.a
>>   LDS     /home/prashant/jailhouse/hypervisor/hypervisor.lds
>>   CC      /home/prashant/jailhouse/hypervisor/setup.o
>>   CC      /home/prashant/jailhouse/hypervisor/printk.o
>>   CC      /home/prashant/jailhouse/hypervisor/paging.o
>>   CC      /home/prashant/jailhouse/hypervisor/control.o
>>   CC      /home/prashant/jailhouse/hypervisor/lib.o
>>   CC      /home/prashant/jailhouse/hypervisor/mmio.o
>>   CC      /home/prashant/jailhouse/hypervisor/pci.o
>>   CC      /home/prashant/jailhouse/hypervisor/ivshmem.o
>>   CC      /home/prashant/jailhouse/hypervisor/uart.o
>>   CC      /home/prashant/jailhouse/hypervisor/uart-8250.o
>>   LD      /home/prashant/jailhouse/hypervisor/hypervisor-amd.o
>>   OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-amd.bin
>>   LD      /home/prashant/jailhouse/hypervisor/hypervisor-intel.o
>>   OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-intel.bin
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../pci.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../printk.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../setup.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../string.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../test.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-8250.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-features.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/excp.o
>>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-64.o
>>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-common.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/irq.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/mem.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/pci.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/printk.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/setup.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/smp.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/timing.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/uart.o
>>   AR      /home/prashant/jailhouse/inmates/lib/x86/lib.a
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-features-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/excp-32.o
>>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-common-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/irq-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/printk-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/setup-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/uart-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../pci-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../string-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../setup-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../test-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-8250-32.o
>>   CC      /home/prashant/jailhouse/inmates/lib/x86/../printk-32.o
>>   AS      /home/prashant/jailhouse/inmates/lib/x86/header-32.o
>>   AR      /home/prashant/jailhouse/inmates/lib/x86/lib32.a
>>   CC      /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.o
>>   LD
>> /home/prashant/jailhouse/inmates/demos/x86/tiny-demo-linked.o OBJCOPY
>> /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.bin CC
>> /home/prashant/jailhouse/inmates/demos/x86/apic-demo.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/apic-demo-linked.o OBJCOPY
>> /home/prashant/jailhouse/inmates/demos/x86/apic-demo.bin CC
>> /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.bin CC
>>      /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.bin CC
>>      /home/prashant/jailhouse/inmates/demos/x86/pci-demo.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/pci-demo-linked.o OBJCOPY
>> /home/prashant/jailhouse/inmates/demos/x86/pci-demo.bin CC
>> /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/e1000-demo-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.bin CC
>>     /home/prashant/jailhouse/inmates/demos/x86/../ivshmem-demo.o LD
>>    /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo.bin
>> CC      /home/prashant/jailhouse/inmates/demos/x86/smp-demo.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/smp-demo-linked.o OBJCOPY
>> /home/prashant/jailhouse/inmates/demos/x86/smp-demo.bin CC
>> /home/prashant/jailhouse/inmates/demos/x86/cache-timings.o LD
>> /home/prashant/jailhouse/inmates/demos/x86/cache-timings-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/cache-timings.bin
>> CC      /home/prashant/jailhouse/inmates/tests/x86/mmio-access.o LD
>>    /home/prashant/jailhouse/inmates/tests/x86/mmio-access-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access.bin CC
>>      /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.o LD
>>    /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.bin
>> CC      /home/prashant/jailhouse/inmates/tests/x86/sse-demo.o LD
>> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-linked.o OBJCOPY
>> /home/prashant/jailhouse/inmates/tests/x86/sse-demo.bin CC
>> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.o LD
>> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.bin CC
>>      /home/prashant/jailhouse/inmates/tools/x86/linux-loader.o LD
>>  /home/prashant/jailhouse/inmates/tools/x86/linux-loader-linked.o
>> OBJCOPY /home/prashant/jailhouse/inmates/tools/x86/linux-loader.bin
>> GEN     /home/prashant/jailhouse/pyjailhouse/pci_defs.py CC
>> /home/prashant/jailhouse/tools/jailhouse.o LD
>> /home/prashant/jailhouse/tools/jailhouse CC
>> /home/prashant/jailhouse/tools/demos/ivshmem-demo.o LD
>> /home/prashant/jailhouse/tools/demos/ivshmem-demo CC
>> /home/prashant/jailhouse/tools/demos/cache-timings.o LD
>> /home/prashant/jailhouse/tools/demos/cache-timings GEN
>> /home/prashant/jailhouse/tools/jailhouse-config-collect CC
>> /home/prashant/jailhouse/tools/jailhouse-gcov-extract.o LD
>> /home/prashant/jailhouse/tools/jailhouse-gcov-extract GEN
>> /home/prashant/jailhouse/tools/jailhouse.8 GEN
>> /home/prashant/jailhouse/tools/jailhouse-cell.8 GEN
>> /home/prashant/jailhouse/tools/jailhouse-enable.8 MODPOST
>> /home/prashant/jailhouse/Module.symvers ERROR: modpost:
>> "lapic_timer_period" [/home/prashant/jailhouse/driver/jailhouse.ko]
>> undefined! ERROR: modpost: "__get_vm_area_caller"
>> [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
>> ERROR: modpost: "ioremap_page_range"
>> [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
>> make[2]: *** [scripts/Makefile.modpost:111:
>> /home/prashant/jailhouse/Module.symvers] Error 1
>> make[2]: *** Deleting file '/home/prashant/jailhouse/Module.symvers'
>> make[1]: *** [Makefile:1714: modules] Error 2
>> make: *** [Makefile:40: modules] Error 2
>> [prashant@fedora jailhouse]$
>>
>> I could see the issue is with the kernel. Could I get necessary steps
>> to fix this? How to apply patches if I have? Pointing to any resource
>> also might be very helpful.
>> Thank you
>=20
> On x86 we used to get away without patching the kernel, i think with
> more recent 5.x kernels that luxury is gone. Check out
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fsiemens%2Flinux%2Ftree%2Fjailhouse-enabling%2F5.10&amp;data=3D04%7C=
01%7Cflorian.bezdeka%40siemens.com%7C74ce6e998d594fed802908d91a032725%7C38a=
e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637569423110710081%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3DlM97dJOoqAwpgSrhyxCsFs5AOS%2F%2Fik2nkNjCVZ6aiW8%3D&amp;r=
eserved=3D0

That is exactly what I did a few days ago. Using one of the JH
"prepared" Linux trees solved the compilation error.

It looks like some of the necessary symbols are not visible anymore for
out of tree builds, but I did not check it yet.

>=20
> There are other jailhouse-enabling branches as well. Find one that is
> close to your distro kernel and compile a custom kernel.
>=20
> regards,
> Henning
>=20
>=20


--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c70b4564-a830-5e40-a7d2-ced34578027e%40siemens.com.
