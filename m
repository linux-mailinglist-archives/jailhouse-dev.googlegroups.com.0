Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC5Y62OQMGQEP6QLZVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 43474664711
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 18:10:36 +0100 (CET)
Received: by mail-ej1-x63e.google.com with SMTP id sc9-20020a1709078a0900b0084c4e8dc14esf8177308ejc.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 09:10:36 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1673370635; cv=pass;
        d=google.com; s=arc-20160816;
        b=vywmhItSQ1ZDtxw7pdd85l5+rwa5x0mO0S8jjojNq+eYYSxJ2ANPsEkEMacNcmicxX
         GcLuKmNEzDfF1N+QQk3CFF8pARyq4HncgKpNHLByiBxX7oKmk3naRbJYB9Kmf77RyQe5
         i/EftAVeQ+b7q7Lsv4DJBb/GjpYC6XIEtw5jEROYU613OC2Q+CL6DNvMDfVjb2zse9iI
         oMZ+XCUtRoQFdB1WznyTy4ZpNDr6NLQcelfoNXAWkzto1Ia5vuD+RHWknHszKFqb0zlc
         5EmCBeB/f8f1Hul2FNqnwhAXkeulKLnRCxGyf8h1NI1XlsG0TrXGSfnPLV1tl6fwXtCV
         AF2w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=sSYXG58kAVxPI044ypEa4e/ihemm+Q4i01/4k+T8yaw=;
        b=RY8cUU62JVlg9K11aihP3uyIEV8c3HeO9BOZ6Ze/d1hPavSIoY5SVg8VWTT0FClRR/
         Y7P6NXN+k0OR/bDKAnUxouijNcsZEM9aHX1OgNS+Pi+PTt9Z8cBLjcN3Q1268/qkZsOj
         B3Q+y8nEWmgTQfocRXT4Th5rproY0jOzCeCDC6krcl5DnQKa0B1rgnXx42xjUJOCM/mz
         tEBFMslCO0KfSKUMy+Fz7Sg/MIoHaERgS3Za4soCSde/F5Ad3rLHKLk3W+QXDAsU0y+R
         OhyO4OHfKr2QT9hhw98jKImGuzxIc6Gl/mimnsrpMf8HxhlCXT/feOQc+I1HNbif4ke2
         bAlQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=nGpgwB4M;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.70 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sSYXG58kAVxPI044ypEa4e/ihemm+Q4i01/4k+T8yaw=;
        b=V62IK0U+vxXUlrIvu+ggyvSgAGDCd9OYD1XcfQXPvJVFPa7BTQ0EvXnTCJ5THsYt58
         G5lQBr8fa5EaJKI+Kvq2W6ZAyjocEmGoFlG8oDP8jprXtxTpEJbUZLMSn5ap3vocYVLj
         eI3mN6+CZjruwq9mXMJk6WIxS5ZUIn/AJAeazEAc61Rdy2pLOa+hStXQkby/u+1/LXRy
         6CioXf42K+46RaYEmnhmCfbf5E4xicYs9vkxyiyp4+bWv9eAmnDSicTlPAYeZBtKChIa
         ZwXorxqZq8afCUOpUaeRj3ZMUFjK3gCfL/KziT1DjJAtNknx7I71G+O4YiCRt1LisTtS
         NBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSYXG58kAVxPI044ypEa4e/ihemm+Q4i01/4k+T8yaw=;
        b=ndcPx/BsmrgXUFAZJR/OYTitsO5A0eJog67kUySRC3E3aMLR7zJIvjtN3rzuy8OVe3
         ZBeZDJNw00ZW6A/tP14GfpZls3hN9mM6Hm9UlBc+at7k9WXMaxTefHOR6Z1MlTehYO5h
         mkhCaxOZC5KKS8RVNiXwiP3KcR2aP9QQgJPAeIKPKARTCQjM+C3/JjshsSiNfEPt5nQx
         o6tPp4ViSi2SVgm2qSWrt2puCrXOgCJpTFzySW3kJQCiaXRciwT8ue+fivSqCchZ9SW5
         7FMoZhtgBwlPFJ+x+7BTwXvwfWcBtnxsNdfKCZNvhEpxvEp6RBUVTJvEn6YPavhonhSA
         0jcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kp7YBgWAnjBuotmcs7gh2pTXGa4n0jW1Ttl8sctCVjVCoc6Yrya
	igp/pyqfswMmXnI2q//vlzQ=
X-Google-Smtp-Source: AMrXdXus/6XI/29xau2yWpSv9zL6IJxqyjAHkgv7yyYDrxsPI208/Fx+dHycHIbc3Wa5/r6rymmeMw==
X-Received: by 2002:a17:906:2cd1:b0:84d:3d45:4222 with SMTP id r17-20020a1709062cd100b0084d3d454222mr854907ejr.750.1673370635685;
        Tue, 10 Jan 2023 09:10:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:51c9:b0:479:6c1:ef04 with SMTP id
 r9-20020a05640251c900b0047906c1ef04ls4567887edd.0.-pod-prod-gmail; Tue, 10
 Jan 2023 09:10:34 -0800 (PST)
X-Received: by 2002:aa7:d308:0:b0:496:952f:cbd4 with SMTP id p8-20020aa7d308000000b00496952fcbd4mr14408105edq.1.1673370634183;
        Tue, 10 Jan 2023 09:10:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673370634; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y3iLnvnR0DH8weuZ8ZD4rGiL/yVrYLl4b/jFRVDRaSBe7isvyWZIzmZvzb4qAIUpte
         /weIu7qdaJt4QWVOD+Bs/IwOjcav3B6yrk0sfj43jchV8F0EnfvdurQU3yWzoWr5KqqF
         T4tHqaeAZnJxtwStsUkHYbFMIt+rPiLk2bgX+3iGXfN2c3M8zOosK3IorgtD3wgv8Pox
         iH6+xF+YJAa7M208y91NEf2xSmiWozKprw1Rzj9DcIlvquzpfaP0N9dPY5RIItRDp4KQ
         5lrNlZ7h6G8o7ZB1f5Nr3sdphQbTNi7+vnYQ+Nu3kfu6pciJQINnBIIWj9TXRIrVnuR6
         Sruw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=pmtM+VgL3hDa+ptU6gwh6a0jlMAqMN6vWcXMAkkzjGQ=;
        b=szolnbx7U6CFr0qGR61zxQjh0zLgu67HpenRaQ1qk51mj0qfKsZSjlO2gIR1BlwEj+
         KQ+QfgzcWbskBnz09bzmnhYgZAfoBxBkL9WU7CoKJ34BrSu6PKghYhuej9ZV21z7XNiD
         5EwBeZIRSu03jqz7mgsEqavqLTjNNsbSKdOzQ7VXsmg7S+76GbFSYvjNyIJ3YXCP/fl+
         pp1XA84dwMsim9Ub+9glD38lULasw2+EilutvOvi+ZVcT/HsjK/SQSdoOwqD5jxrmurf
         ZS2YGfxDTQtt9Pi8oRmorWuYmQWN9gDP0b3R5HOFZdJTWmPsT8TiFONOhgeRBD4GiuKQ
         zpSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=nGpgwB4M;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.70 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2070.outbound.protection.outlook.com. [40.107.13.70])
        by gmr-mx.google.com with ESMTPS id u9-20020aa7d889000000b0048ebe118a43si549756edq.1.2023.01.10.09.10.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Jan 2023 09:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.70 as permitted sender) client-ip=40.107.13.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4r6pvGg86e56b1ErQ0Oa65F0p0C7iFh1EeZi1shg1uj/Y61k6AR9/ab3zlk457DICz9JAJV+HC9reCjMLXaEvHzQ0l7rzU5e6sdB5MGB8RBoi+CdDDj/nY9FN7tMwRlSXNSkINDgU2/AV4hUTozouVh/YcnVd4SeBKyiy4dkNNC3IO3JwBTLfEgonYBOSbJm2ennzLVSpitzp4Drsg0wLapgNCt3RMstBRzPzxf0mAcE2eDq3pS4ZxG44BAdcScQkXUj7xNc8QKAwN2FMF5iX7yu4zsl2AObFIg0XZK+6k/L8RtXIQheo7Om2HDpJfvWMOiKU/X5wleJ2UyCxE/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmtM+VgL3hDa+ptU6gwh6a0jlMAqMN6vWcXMAkkzjGQ=;
 b=XODYyvdZ8TTz/ivFnAKIkeEOVOY1NVInlXKMhasAsJ5+Er2otjTjS6svNywng9vDdEGqkO6DKvqFGkqp37eT4DC3Q7V0S0JCnLCxl90lUhcBVrU6Vm5Iac4U4jLKP8QOqGh+gxGQb9cHCimusmSjKhDQ1kZ/pVjHkNDcrwt9zUApzp/Su792d3QqO6+q8pa9EeePuTVAB8MRxe2xNooMJg6puiSCbtNaF6BSTuGjOpAEYV1m/c8ghNynJgKSFXyvYLNQk+9vwwtUJvcHwYaJ8i8b938fgbM51oNwpwP1rEUGE1hNHnHwqFWYp208VBpr+2mO8Y+FZz4dQ9uNzQLawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AM7PR10MB3672.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:134::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 17:10:33 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 17:10:33 +0000
Message-ID: <90801fb1-225a-b828-5d94-d2c3a53c46f8@siemens.com>
Date: Tue, 10 Jan 2023 18:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] driver: add architecture sanity checks
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
 <20230110164851.88918-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20230110164851.88918-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AM7PR10MB3672:EE_
X-MS-Office365-Filtering-Correlation-Id: 94402b46-fb85-4800-9a56-08daf32d9534
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61+aG5Ibjp6wF72Wb3JtOplQzzq0PieH9FmAIuIyWMtt+gfcfWzgiTVh55SXs946OGI+T8ghw4pzWKw4hELn5VHoVu9xDgfHskyyHDrfqh0IOnxgPcl0FGPzniZs2qPQYbiOC+kAAjeiY1u062h+sttxGb9V6k3aODeFcL+qJZTyjARCR/a7NKWZG9pUr9BPFE37gMoioosj5c8Rvp6uC1TgYeXtUP2bRpd8q3nqgd/OxOxUcCyKdmWVGPM+xz2bGycfRQoE+7EJ7v1MEfrkmd5uEaOfSn1EMfkAzHpBcqUCO1coKKmzZcC6NvJ37whVWIfY4TNs3g98fObbQatjZBC5uwXd67RGU6xc+DybQxBplBHOPgDPzAqr4LQ3q4RqqcQbMCRym+4AE795w31taZlNaxJEnwkjkxC+0d3Xh1q9AfJNTwP+tMx7Prjl0rxu7NQLDMdaEW1esFgH/YVK8sbwWKa9pFm48qk2BiPdiwrvVoEQMUlCWSQ4oYJkIXt6WwIitLtBR93cd8t1P2EF1PRkKmRfGkF5NF0WhjpG6Uvt66vKaSF6BgRZyUsaIIt+vHwn+28rJpCd8WXRGF4/1nJxqk+f0iH5iR2ynC0DlWczi2eanLCVVoICnhxOeFM5siOzF/+elJ6XOjEbmyxciRWVaV3ytM0OarEYR2+Gc+zRP+gR+rsUY+O+xxnlpcC0EuyWKojUBDZrRfE/bVAX/S//diAT+yodv1QisFHIaaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(8676002)(66476007)(66946007)(66556008)(316002)(4326008)(54906003)(44832011)(5660300002)(2906002)(8936002)(41300700001)(36756003)(31696002)(83380400001)(6486002)(478600001)(82960400001)(53546011)(6506007)(2616005)(38100700002)(6512007)(26005)(86362001)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFXZjBuQVJhMkZoUXlkVU42SzJmTDA1MzZsdVp5V0N2bmsxZUNpT0dHdDNS?=
 =?utf-8?B?TmdHeEw2MENjYkVQUGxoYXhCK1VGelk5ejVpK0RwWGlHRXdnRUFxQzdwVEJz?=
 =?utf-8?B?MDU4TVd4Slhna2FzY1ZvUWRxS0loTVN6Zlc0MkdzVFRvNDVyRDVYWXBJMWZn?=
 =?utf-8?B?Ykc0N2RpeGVGTFV6cUc2UEdLOWVYTGVhejR4cDVzUVNnNGZLYjJpaE1LTnQr?=
 =?utf-8?B?VmdqZEY5U0ZxWmRyUGNGTUpWTWVvc3hzRTk5Nlhxbytkam9MSktucU5Xc2dO?=
 =?utf-8?B?OGtCeE4yQitxRUp0Ti9iUk16QmlLWlNhc3dIb29kcUlWREswS0NpbFhuZmJL?=
 =?utf-8?B?Zkxmc3E4RU1XSXRITCtOZGtRcWJ3L2VzUU1xRTZGYnM0N2ovL0RxOFJTcURC?=
 =?utf-8?B?c3JaYWVHUnB5QTZ4cVowRWhsVmhYbHl2clV3MWRKKy9WYTk1aTBSUlk2VnEz?=
 =?utf-8?B?dU4ydjFsZHF2dmU5SlNTWTVTM3pQeFovQ21GV0ZDMlpDU2lkTWZnTVdRcWJk?=
 =?utf-8?B?Q1dYbVhvUkk1UnhTamdQTjRZUVFoTUtJdXRxQkx5VTBRZWJFdmtrMnQyNk9i?=
 =?utf-8?B?L0xmOHBnNkQ4cXB6WUNMaTk1aHM1bjgyZC9nSnkwcFdoaVR4OU9zdTZybVdQ?=
 =?utf-8?B?a3ZWWkpkQzlhbUpVelQ5OWpZamduTmFCbS8zSzZ5b3UrcTNEa3dBd2RieUww?=
 =?utf-8?B?UTJHQnU4NGgrd01uZ0FvMFhidmViOE9RZmhwcTV6Q3JlZFRZUFQra0FyRU5i?=
 =?utf-8?B?c0IxTXY3UDFSL212dWVoeUh0NzBTQzBOSjEvRk1Wc1k2VGFrcGUrdWdpOGJR?=
 =?utf-8?B?amp1T3ZoVms3aVQ3akFVVVhMMzRtcE9DWlRJUmY2cU1MWFZBU1ZMTDlacWRr?=
 =?utf-8?B?bHdxb0ltWHRyNVF3WExHSTJFYTRubjYzbmVMcS8vRUIyQUpWN1pNWHJtUWU5?=
 =?utf-8?B?cjMrQkloRUhvS3lrcTZDL1hJQnpiaGgwYmpYMS8xTHNENWVsbm8yV2hSZXhk?=
 =?utf-8?B?UXV4RGM3NnJ6eDNqU05uMlNmNzNSMloydzhPblM2dTVEQU51VTJLSFVQZWVQ?=
 =?utf-8?B?V3BKd0wvek9lRGNUUDZxaVh2OU5ZbDNpbXNja0NyME5BKzRJSXh3TkRkY3pL?=
 =?utf-8?B?ZW1STTcyWnVEcGhUL1JkaXBqM01RMk1NR0F2MXJGYWZYZThQTm5LS1ltbWdl?=
 =?utf-8?B?NWJ5LzJrZnE1c1lXcUxpY1NQNjhJeXlKc3JKUHlnNFRxbno4UXN5aHlKQXFk?=
 =?utf-8?B?ZEJSS0dIR29MQStVR2R4WmIvNEliSUhpcnVMSnNhK0hvcW5DcjVkZWo2aHZk?=
 =?utf-8?B?NnlKeUNyQlVXaS9kSXZORXhRb1BaQjc4dVY3SUNKTyt5OWRTWFNuc2xsZS9N?=
 =?utf-8?B?VXhhNWF4c29nakZJU3N6UnZvN2UyYkxML2hMcjNMZkpaRjU4aEZKUVUwOWJt?=
 =?utf-8?B?NW9oY2dvVVJPOEQwR2ZGK01IU2x5dUdLNFVTTUVpNW1kWGwyQTlXdksrM0tp?=
 =?utf-8?B?L2FKeXRpRVZ5Q1dpZGJ6L3dGdjhzTVErTG4yWndLY3BsV08zdE9kTUhKOURZ?=
 =?utf-8?B?d3JSUy95U09NRWYyQWdWRDhxa3FuQkJvc1MrSTR3aFdQTlM0TTNzL0hVektI?=
 =?utf-8?B?dzlabFI3dTNHcW5CV0FQR21Zall5SEYyT2RFYlp3Qld3US9PZEJtK25UbTZn?=
 =?utf-8?B?S0EwN0puc2VmSnZuTlg5NU1ZSUg1M2lneXc5Z2F5V2h4bERQUU9QTTdrRHFr?=
 =?utf-8?B?UFhQU3J4U0czbGZOU3pJZEFDUjg0RURJOGNobnhNL1VNUlJ2Y2NYVFd3V0Zj?=
 =?utf-8?B?NHV5cHNQTGpDS3g4MUpVcEl0bWhNT3grNUU3dng3YVZ6S3Q3UWhsVHdQT3da?=
 =?utf-8?B?eE9lcTJEOW1yVzFuMWFmODBTVkF2b215ODFtdFN5cHVua1VtQmtVajloSC9L?=
 =?utf-8?B?Q0h0SFl5TllsSk5SM0hDL2pKbUVFQVNZdzFmSFBzejErNTZRdStYLzg5cXRE?=
 =?utf-8?B?alBQZnFSSTFNNDZicTZYZG5HQkxUSFpOZlppN0ZtTW04bzhUeTNBc29ES1I3?=
 =?utf-8?B?Q2R2MTd0VXhTbHlwVzNsbXpMaHRKbTIySHVDZHFUNkZlMHdyWjdPeWJIaVZM?=
 =?utf-8?B?MDVlNElUa2F4UHFrQ0FFOHFUaHY3eXRhRDZuVWp5MTdMTlcvaFo2dzVCK3Qy?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94402b46-fb85-4800-9a56-08daf32d9534
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 17:10:32.9770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM7P4jDaAf2M7oLRk9/di2s4BE4SBgjeCXcA+tIhrmlQq9gmp9EEVdCGBQ3Mpub3rxyCuDp/scEXWvNcI8Jy9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3672
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=nGpgwB4M;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.13.70 as permitted sender)
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

On 10.01.23 17:48, Ralf Ramsauer wrote:
> Now that we have architecture information, we can check it. Just like we
> do it for the magic bytes of the configs.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  driver/cell.c | 4 ++++
>  driver/main.c | 4 ++++
>  driver/main.h | 8 ++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/driver/cell.c b/driver/cell.c
> index ade61edb..f9d7982b 100644
> --- a/driver/cell.c
> +++ b/driver/cell.c
> @@ -186,6 +186,10 @@ int jailhouse_cmd_cell_create(struct jailhouse_cell_create __user *arg)
>  		err = -EINVAL;
>  		goto kfree_config_out;
>  	}
> +	if (config->architecture != JAILHOUSE_ARCHITECTURE) {
> +		pr_err("jailhouse: Architecture mismatch\n");

Maybe clearer: "Configuration architecture mismatch", just like for the
revision below.

> +		goto kfree_config_out;
> +	}
>  
>  	config->name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
>  
> diff --git a/driver/main.c b/driver/main.c
> index 64e2b9a4..fe119890 100644
> --- a/driver/main.c
> +++ b/driver/main.c
> @@ -396,6 +396,10 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
>  		pr_err("jailhouse: Configuration revision mismatch\n");
>  		return -EINVAL;
>  	}
> +	if (config_header.architecture != JAILHOUSE_ARCHITECTURE) {
> +		pr_err("jailhouse: Architecture mismatch\n");
> +		return -EINVAL;
> +	}
>  
>  	config_header.root_cell.name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
>  
> diff --git a/driver/main.h b/driver/main.h
> index 7c9f661c..9df51aa1 100644
> --- a/driver/main.h
> +++ b/driver/main.h
> @@ -17,6 +17,14 @@
>  
>  #include "cell.h"
>  
> +#ifdef CONFIG_X86
> +#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_X86
> +#elif defined(CONFIG_ARM)
> +#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_ARM
> +#elif defined(CONFIG_ARM64)
> +#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_ARM64
> +#endif
> +
>  extern struct mutex jailhouse_lock;
>  extern bool jailhouse_enabled;
>  extern void *hypervisor_mem;

All the rest looks good to me.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/90801fb1-225a-b828-5d94-d2c3a53c46f8%40siemens.com.
