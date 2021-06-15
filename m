Return-Path: <jailhouse-dev+bncBC44VTVY2UERBGNYUKDAMGQETUCFQCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB833A7E26
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 14:24:58 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id s25-20020aa7c5590000b0290392e051b029sf17108189edr.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 05:24:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623759898; cv=pass;
        d=google.com; s=arc-20160816;
        b=a0ODwAM+Qv3t+a6JZwOUWSNwdDMGxIubxL+GN1/Sq+l/ngbV8irLShHp2la73xzvmx
         GB4sG9ylVr7l0/4kNXQ2Xo+uH4Egx9RrI9ZWlynxY7NqnuZ0iIaazlcxxvr5iIgDHULN
         p9XcKpfIM7R6SHtdew4p2Zdd7WE8g/BcmJxo9J2I/jqV/+CIV+DUhLjznmH3EwviWfIm
         pznMhsk+GvnAYOqkkHE2vtPAJsBZVOONNitJZns/Gxp4RXyZwCoeCUdjODeIBKRxXrRp
         qbv4xwGdpuSNp+jcUxCIn7PbgSUlb/D8Ef0iRXXnFI3PEQWBxp4tMJ/gKDys9rBgOrAj
         nGDg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :in-reply-to:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=BZ2vIDeS9AJN9AA+YMtXygrkjy/+J6FL2YDze5M0faA=;
        b=sJndnYsot9vioBWou33DjBSw5ZeqoRqWlwUD0PjKwlJVQbEowfkFn0dMYiwRFbwegZ
         v5W6BXDTmb7uVA5BKOmPvM1x/jx0hBGFK8tql4DF3lC+nFiA0X8kPERja4ZH3hyPnMRw
         KZ+aQG0kLrTIEFvY3oyB1yGLbg9iXp5YbP+ncZPj2U90IyaE61N0JKSVAezGcbklUdfq
         3/BmKBPUT6JUJkLyy7h9UdVsWlggFrCaXiYrSulK0kVmn3NYU+aYDamafoAygMCFPhvs
         U7550x4Drx9wn4JRvQQ4xBEm6EthqRu+mZGE42/xxbyhzJ8VLbZ1vbanC8cXyD3HMYI6
         qIew==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="Ld/e9gRd";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.14.72 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :in-reply-to:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BZ2vIDeS9AJN9AA+YMtXygrkjy/+J6FL2YDze5M0faA=;
        b=sqgOcaaAHfK1pX1tDoEZnbEGnGBl+gZHeVFXLQZ4XrbuJwPt+0W6i7Sy33TxfY3XZb
         GMQEdgllU8c9Mx3LiBUWt2fvMbPFNBoz2lTaDPYaBn8SfJQbBB/shEj286BFTL8/qTnk
         /ilTmmcnBJPe8FIJV/UuhlsMgfZ1DU8qrHMW+RZ3n82RigTrImTvoOEbhSrca9Rs3ug9
         V8KzN7+xpj4+rL/iNHGmBU5t6nBYAADQrp+44PduCkvFEwU+9up/AccgYFULe/eNv/zW
         WblMXs5omLW51v6P2RevI/4yd3ttrAZn5TBLr7XmuIjL365GBRAsRMslPSQRTeHw2ro8
         kRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:in-reply-to:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BZ2vIDeS9AJN9AA+YMtXygrkjy/+J6FL2YDze5M0faA=;
        b=QsR7Bsf1Kj7Mx8Iv+hr2j6eBD3EsdKa4R8gIOqjtl/MhYJvvOLoG5ZX4eRSHVFr4mz
         QtGwT+SH5VuwakUh1KWvTtcPaaiTMXO2fCh4frVr5QtnnfgkpUyBXMBNnpv9Vb+scNTT
         GBmIWbV94Fo8BM75WDQcGc8SHnJe/uYvXDrmfGZ8pdXiz+ZPs3ydT+viXxsAAkMi8swr
         ouCKyGso8nSI/914isb140FssjzU+LsKZ66bCYdOiuBeeEnadaEyWTM973/9tF1mqKRP
         Dqr5T4BpitGqHSTiw0lP2p+TwwCGaddBZSW5F086MoK8Zhl9boj6tevhUOBNiycsoTvv
         YZOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531y6Pei32mRhbWJf9zt9JpCDQiIfJLXskHkJquFRFEgPU1M4/Uq
	CD46lCKd+U0quIDw/mfecYc=
X-Google-Smtp-Source: ABdhPJzmroeEXsMbbm5JlwPZcdmP7W4ZqhTHkeHLsCRJhRe1ANJAMUkso4HP4i+5xBdxYJjXavZvbA==
X-Received: by 2002:a17:906:b352:: with SMTP id cd18mr19983499ejb.222.1623759898141;
        Tue, 15 Jun 2021 05:24:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4796:: with SMTP id cw22ls8009011ejc.3.gmail; Tue,
 15 Jun 2021 05:24:57 -0700 (PDT)
X-Received: by 2002:a17:907:9047:: with SMTP id az7mr20211774ejc.4.1623759897150;
        Tue, 15 Jun 2021 05:24:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623759897; cv=pass;
        d=google.com; s=arc-20160816;
        b=f4yYPIm8y9xv2CVhqatTvfI5QSqILJ96fykXFvq3+U9B5LyXNDUVpoVCWIPfQjmhIb
         YK5tI0K8GP66xjXajBINdYGw/ifWP9HJqYA4tdLgaM63EmBHvn5IzCSzUY1QJPZ2Ujhp
         rO3IJMM49I6cqT5WPgBu0yQH7K4qv6RBe3rc6d2Kl3Vh/AwMPqGbsaoM0XVYbIbDEl9j
         VUm3/KwjtourX0e8PbFQLmjdcYCr64u/mHLxv/mmrsNFFnlZJcb1IttXMgYRBhF9Gd5q
         mYMToCTC27ZF4gYjzm3H0C1bbsMMUEhLkkGzDiDJ3Bb3OMeUGenXpfShCtOydiBI1DNn
         Pfqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language:in-reply-to
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+97x2/ITcvOOC5bivEd3nbdtQliHZGR3lcWPCmkGUCk=;
        b=mWyi3uYN8Jct/zMjH6EhKUORFpFPu/NXml3i39vqeEjj/OAkljcsqFsHwODl4AuRIi
         BUBBVo4WdzMXZ9WsGArkRoV4WNb622CtWs29i0Vdudl4/0rwO4ALi7mepi5ZE7zYvcyq
         gchJoyPgZzVENU6um90MCrFDFkO6nTZMJOSnXheLL3p53SoT7ym2TRp3n+ziIwbbhMRI
         TX6jtbbQ+om8ajlW9STzuF4bdnWsokiH46OWMSGZ8nwuQUjcBdQe8ROlYP6mNURDBNVm
         eZQypPW4zHVQlKMcX8SopQqMfyR2JNVqRHmxBd0XXkLkI9rh2sc+G0FxNY6AmItwjg9Z
         hcvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="Ld/e9gRd";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.14.72 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140072.outbound.protection.outlook.com. [40.107.14.72])
        by gmr-mx.google.com with ESMTPS id x10si108199ejy.0.2021.06.15.05.24.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 05:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.14.72 as permitted sender) client-ip=40.107.14.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBwV7daDz+jURl0Xb2lfa3Q0cPEVz4vxVD7eroldAJ58OdIbi5fDo8eAI9yVzsQA0FYmPzctPGdlmky1NUVe7rV1wabxgE8DKeLFey7G3ltIciIQtOX3TSpArpKKTvj7+PsyXE99zFW6ZIzAbi00v2kBV2RGFdRiM7HnrkTdRHBmf9Y2/Lq5NKJJBtKs8qW4Cb/hiMkwJRu9pqJRBJzWb6vm83a4csonEtzPrgfG+0bHW9LNj4pFbBeE5YiRGnD5u55krlT8qTh3wvlrJ+ESXJ5md4YYc+qUKqPAOyQ00fiOVmF/H6RMU8iYD5VKHEP4sVR/pL6X3Gmlrro3NTyK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+97x2/ITcvOOC5bivEd3nbdtQliHZGR3lcWPCmkGUCk=;
 b=kiS0jUOZfw6MmRE8Co1Emqq474qGCpSF+zn6WUQmdcEkEB4rQ0DqumLkjfgViKDQ1yHJi0X7aFkfFlSplUii/ZCvnXOslEWIQA3cr+mtPX2EtTrrpKQoB0Wxa3Lw3XfU+6EKLxIBKHZuGvk2uJsjGMZHVHwL2lhJMEUD0smrNG5LF954IjP465VsIGhiaK2nSKWClMp94LnyIdTAX3JDOqc0aqHpgXJlGksui7Dd4pHhKMen62h6jHqJ+z/OcaIwozbd6g5IHMmMHu4tToCbva8kVbLhTfuhiYUkO6X51ukDC/eWhJI750ncqGgT4bDHqc/siJOUv7E9uBNdjvIccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB1969.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 12:24:55 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 12:24:55 +0000
Subject: Re: [PATCH v2 3/4] tools/scripts: Remove python2 specific code
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
 <20210615093225.162909-4-florian.bezdeka@siemens.com>
 <365e8552-76ae-f78c-d786-de6d41ecf161@oth-regensburg.de>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <3f18f978-83c3-d9af-f8dc-0f00bb1e2bd7@siemens.com>
Date: Tue, 15 Jun 2021 14:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <365e8552-76ae-f78c-d786-de6d41ecf161@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2a02:810d:82c0:38fc:5ebc:d45c:b1da:6111]
X-ClientProxiedBy: VI1PR0701CA0058.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::20) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:810d:82c0:38fc:5ebc:d45c:b1da:6111] (2a02:810d:82c0:38fc:5ebc:d45c:b1da:6111) by VI1PR0701CA0058.eurprd07.prod.outlook.com (2603:10a6:800:5f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 12:24:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14760a73-4ed2-49b0-ffb7-08d92ff8955f
X-MS-TrafficTypeDiagnostic: AM0PR10MB1969:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB19690868C778785EE6F6AF64F6309@AM0PR10MB1969.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TP8GqJwcucFw7h6afzFYipYeB9Owzf/vtme2F3QhUflBWvR6Q1ZGipKJgjqRZ42SkyldnaRN27nO11kjbcD4bYkMM1RW6JTCfjNUXQ3Xq0BYkWFOWvmFyCmXcIYQU75CTdprxwSlaZOl4V/tbsFUOcVO02byknXcoZ/EFl4n/SYuHqpHQHgoZ/qrUl4hQypu+yh7SSWxCec/QwAyuRv+SW9P/q9kdU8Q/I147SCaZmyNDJSQITGl24H1hrSuGdwDOKUVY3DZI+bFlow/fLGLL1mtJIdB7BmlJNyzfKaVqSRavc/NWzKdurIiLNCAzwvybP5LelNZZRrCmoi4q9sFYAOjtyctIyexSlHnGuQz+okeOfZZNz5anIfSsiI4IFdVfh8Jzc+Tv9mph0iYxsU72zwsPSvblH4aDFMiqhXknJeIcPorunYrr3Q+liVpeeXtzVri+klc1wgIpl87BpUtKPj2Io3Z+bvOC7ziuaz2D/beEe9ZzSUvgXbzl5xabab6YL54t3KwU/WoKWdWKrJe74Pz7C8ms2A3d6fYXCtfOjD52M0UDXppb9al7YVaFxQQpGexHe2klRzvgk3/4Xmv9Zaa1ZpVHlmhi4pIORU77I/eXz3k9kmL3S3ZlESpFA88h8BJGELNLL6N41kncXXDHXeDTn4P7YVpuPP7M6VBkatXP37DyV15OREOJuPKZ1SC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(38100700002)(53546011)(107886003)(66556008)(66476007)(8936002)(66946007)(44832011)(5660300002)(31696002)(6486002)(2906002)(16526019)(186003)(2616005)(86362001)(31686004)(83380400001)(4326008)(36756003)(498600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xNSlpNN2M4aWYzVVlyekNweC9TTHNOaEFtMGN6RXI1QVdiS0RERDZ4cndG?=
 =?utf-8?B?ME9OQmVWbC9hR3BSK2J3VDBPanVCU1lSbXU3TUlERU9VMUozK1VWMW95eVN4?=
 =?utf-8?B?ZCs3aDNBV3hkc29pRk41dTBOQ2k0ZWNqaEdQV1YySU0vQWJQV1gyc2taUmNr?=
 =?utf-8?B?SnVpMWRqMXJjaWxiSkZFMGs2WFBiRytHTWt1bnR2cjB3dExGS3hBUDg1Y2Jo?=
 =?utf-8?B?d2VCTFJDYjh2Szc5bHpvVHhxc21hSmJuYU9xU1JPK1FLUG5uVWIxaFdWdEdF?=
 =?utf-8?B?UGxBMEYxMEg5Y1dvM3ZpYmRydmtRdjY5VlJrU0tOV2sxbVJHSnhrMlpDUm9Q?=
 =?utf-8?B?cDV5WFZYRXYzckhqZkxYVWFaVGIvS2xwblRaUU9lSlR5c09za0V0N0FxM2RG?=
 =?utf-8?B?SVdZbmJ2UFp4OU9OSjROU0V6TVpQenp3WjQ4R1kraTdvTEpNMWYxbjJVdDBj?=
 =?utf-8?B?YkNhL1VkTE5MU09QbG1MRTB0U0lXM1krQzRhZnpPOHdmUHFmc3RMY0ZYaGtK?=
 =?utf-8?B?MlRXbzhoUjljeTNpcHd6ZEJUdG9CbFVzNE13N1I3Njk0aEJ1b1BmUWNuTWJi?=
 =?utf-8?B?aEtWMzFXV2labDQ3alRYYlBFKzdqWW00NGhOQzE4NWZSQlI4NXJpc3k2cmVo?=
 =?utf-8?B?OUpsbFR5b2hPVlVUN0w4VUpUWDQ2bGdSWTZWekhUVlF3M2szYnJieGdJeTY2?=
 =?utf-8?B?ODZwYjJYdnk3S3k3V25ZZU9NZWlvbjQ4YytnWDF4d0V4UEgwY05ZbTNGVTdM?=
 =?utf-8?B?SUJLekVodFp3ZEZvcHVXUU8xZGRoQ2dWb0pYdVAyNTNISmVMYzMwV0FySE15?=
 =?utf-8?B?YXBtYzkrbHMza002eUlNSmk2YTNDZEx5RjE1cm8zRlNrQmhSZGlPa1lYVHdJ?=
 =?utf-8?B?T2hKTzBhY3FZNUYwWUNYZ2pkVGJLV3FLeXZ0TW5lcWxTcHJJblIySjlzS3Ft?=
 =?utf-8?B?TTRKVGNkY0ZQeHJmR254SWxKWEh4UUt1elRpUWpBd0g2QmZ1WEFTVUpqQnEr?=
 =?utf-8?B?L2pwaVNHdTF4NHh5d01OZkE4ZCswdGw4MDhaZjlHVkRWcndqK28ybHBVZTFO?=
 =?utf-8?B?MmQxVms1N2x2ZFJRdjJldUJFYmFuL2NDdzMzeU5TMkthSWh6c2J0OXVwZmlQ?=
 =?utf-8?B?U3YxTFpvM2tUdXFGZ2h0a0FuVUs5TUt4ZFc5ZzBPblFEb2JFS1AyVGpkYmpN?=
 =?utf-8?B?WExkQjRQWkpwL3RiajR3NTd0d0NvT0tNeXYxQUVvR3lJaWpLZlJaaWlLYXJL?=
 =?utf-8?B?U1ArbDhOcTlsUjBNMVlDRXhLaXVZUVd0SmVkOVpZSUlkazZYWUtwYU9pSndU?=
 =?utf-8?B?U2Y0V1lSajRPUFovN1ZUZERsV1JtemE4VHlRYnZxZDBmZmZFWEJyaFZVcGFC?=
 =?utf-8?B?eTkvUHd4Sjl5eWpOc015bXg3YXBhYnJIS2FSTkRiMEczbGF6dXJjQ0lMRWxy?=
 =?utf-8?B?bkh5c0FoUmVHa0o1Z1lab3psZU80OUllWUVTWk1uL2I5UmZ1NHU0QllxMndX?=
 =?utf-8?B?Qy9FMnFjYVJKNzRkbzZXeGQ1TGFtMVlFMWZmUEQxNmF4UERkRm1iQlM1VzdQ?=
 =?utf-8?B?bG9DSG5vTlRBQWtxSldmSm9rWDRlSnRyMFdXMkIzQzc3YU5URVJ5Z09peDZF?=
 =?utf-8?B?cE55YzE3UUJENG1WN21ocDJEMndUUG9oWEkza0UwL1FFY3hzSmM0bEM2YlB6?=
 =?utf-8?B?d0F4STRqNytoOVZrUCtFak5BOG1zZjY5VExsUWt2VEh6TE0zMkdqN0dad3Mw?=
 =?utf-8?B?OWlpSDhPQzkwemNlazYwSnUwdnpFUmJpVDYzWjFBWWUzZ25OeG1PZlB4dHBR?=
 =?utf-8?B?cElGZXpUZFdXMm1xR2F1T1FYOUc0QnhkUzBSUURWUzlDa2FGL3RLeEVNcjVy?=
 =?utf-8?Q?idZen40gvHsHv?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14760a73-4ed2-49b0-ffb7-08d92ff8955f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 12:24:55.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DR8foVRwlJqQbjukwxggK85TNAA7UAthzHS/hTDzEJ/m6Hd/ZnUsXLhrh/shWDDvvZdIUj3gYn5XFfjXO8gleiOKp+2ZY8zTisI8fu0euHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1969
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b="Ld/e9gRd";       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.14.72 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

On 15.06.21 12:44, Ralf Ramsauer wrote:
> 
> 
> On 15/06/2021 11:32, Florian Bezdeka wrote:
>> We are now calling pyhton3 via shebang, so no need to care about
> 
> python3

Thanks!

> 
>> python2 anymore.
>>
>> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
>> ---
>>  pyjailhouse/config_parser.py   |  1 -
>>  pyjailhouse/extendedenum.py    | 12 ------------
>>  scripts/arm64-parsedump.py     |  1 -
>>  tools/jailhouse-cell-linux     |  1 -
>>  tools/jailhouse-cell-stats     |  1 -
>>  tools/jailhouse-config-check   |  1 -
>>  tools/jailhouse-config-create  |  1 -
>>  tools/jailhouse-hardware-check |  5 -----
>>  8 files changed, 23 deletions(-)
>>
>> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
>> index cad761a5..7a7f48a3 100644
>> --- a/pyjailhouse/config_parser.py
>> +++ b/pyjailhouse/config_parser.py
>> @@ -14,7 +14,6 @@
>>  # information about the system. For more advanced scenarios you will have
>>  # to change the generated C-code.
>>  
>> -from __future__ import print_function
>>  import struct
>>  
>>  from .extendedenum import ExtendedEnum
>> diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
>> index f3dd1bb9..9d6043a4 100644
>> --- a/pyjailhouse/extendedenum.py
>> +++ b/pyjailhouse/extendedenum.py
>> @@ -9,18 +9,6 @@
>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>  # the COPYING file in the top-level directory.
>>  
>> -# Python 2 and 3 have different ways of handling metaclasses. This decorator
>> -# is a support layer for both and can be removed once Python 2 is no longer
>> -# supported.
>> -def with_metaclass(meta):
>> -    def decorator(cls):
>> -        body = vars(cls).copy()
>> -        body.pop('__dict__', None)
>> -        body.pop('__weakref__', None)
>> -        return meta(cls.__name__, cls.__bases__, body)
>> -    return decorator
>> -
>> -
> 
> Did you actually test and run jailhouse-config-create? I guess this
> should fail, because there are users of with_metaclass that need to be
> addressed.

Yes, that was tested. But as it turned out there seems to be something
wrong with my local test env. Generation "works" but output looks quite
funny.

As I'm running out of time I will no longer take care of that strange
Enum type. I will resend v3 without touching ExtendedEnum.

Stared some minutes on that "Enum" but unable to figure out why it is
implemented this way and where the difference to plain "Enum" is. I
guess there are some python2 specifics I simply dont't know.

> 
> Thanks
>   Ralf
> 
>>  class ExtendedEnumMeta(type):
>>      def __getattr__(cls, key):
>>          return cls(cls._ids[key])
>> diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
>> index c695706f..54f4fd66 100755
>> --- a/scripts/arm64-parsedump.py
>> +++ b/scripts/arm64-parsedump.py
>> @@ -14,7 +14,6 @@
>>  # the COPYING file in the top-level directory.
>>  
>>  
>> -from __future__ import print_function
>>  import subprocess
>>  import sys
>>  import fileinput
>> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
>> index 6d1743f3..a1650912 100755
>> --- a/tools/jailhouse-cell-linux
>> +++ b/tools/jailhouse-cell-linux
>> @@ -10,7 +10,6 @@
>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>  # the COPYING file in the top-level directory.
>>  
>> -from __future__ import print_function
>>  import argparse
>>  import gzip
>>  import os
>> diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
>> index 4c5289fb..7a634212 100755
>> --- a/tools/jailhouse-cell-stats
>> +++ b/tools/jailhouse-cell-stats
>> @@ -10,7 +10,6 @@
>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>  # the COPYING file in the top-level directory.
>>  
>> -from __future__ import print_function
>>  import curses
>>  import datetime
>>  import os
>> diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
>> index 62db24c3..d6ea7079 100755
>> --- a/tools/jailhouse-config-check
>> +++ b/tools/jailhouse-config-check
>> @@ -15,7 +15,6 @@
>>  # information about the system. For more advanced scenarios you will have
>>  # to change the generated C-code.
>>  
>> -from __future__ import print_function
>>  import argparse
>>  import os
>>  import sys
>> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
>> index 2095f4e2..c2cd5952 100755
>> --- a/tools/jailhouse-config-create
>> +++ b/tools/jailhouse-config-create
>> @@ -18,7 +18,6 @@
>>  # information about the system. For more advanced scenarios you will have
>>  # to change the generated C-code.
>>  
>> -from __future__ import print_function
>>  import sys
>>  import os
>>  import math
>> diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
>> index 7a41b48e..fc8ce4f1 100755
>> --- a/tools/jailhouse-hardware-check
>> +++ b/tools/jailhouse-hardware-check
>> @@ -10,7 +10,6 @@
>>  # This work is licensed under the terms of the GNU GPL, version 2.  See
>>  # the COPYING file in the top-level directory.
>>  
>> -from __future__ import print_function
>>  import mmap
>>  import os
>>  import struct
>> @@ -20,10 +19,6 @@ import sys
>>  sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
>>  import pyjailhouse.sysfs_parser as sysfs_parser
>>  
>> -# just a dummy to make python2 happy
>> -if sys.version_info[0] < 3:
>> -    class PermissionError(OSError):
>> -        pass
>>  
>>  check_passed = True
>>  ran_all = True
>>


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3f18f978-83c3-d9af-f8dc-0f00bb1e2bd7%40siemens.com.
