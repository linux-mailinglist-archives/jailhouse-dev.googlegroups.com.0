Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHUTZKOQMGQEF25U3UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEAC65ADBB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:37:02 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id m10-20020adfa3ca000000b00288d176460bsf1119688wrb.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:37:02 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672645022; cv=pass;
        d=google.com; s=arc-20160816;
        b=S0a4EXTcNI0akpbtWfmYAeu3hZLQd6yBS6kTFK4Dqc2HuK1qa1ZwGlXUN9+25ZCT27
         gnJOo2l8RF10guuMi1y44TK+N5JYiTAYja0AgQMBeQV7oiDMJmVUymgCZ3lSZ/1R5gUf
         w0JVQMfxKfrIzNHeeSRr1TxLGABkkwsPEZuTReD7k5eo8oB/G3Disb4RgRe1XbrF91ch
         R/FxTfdHe7fL16lI6fhagiYgkz3993s3WW9HQldgp6YixYFQwdLo5J+8Z1UfSCPhRAzP
         9dSRF6hXUBWbm/Z5ZbqAChiCn1JoC3T2d8q0ha2jO39CYe+qkkjiClFrmo8EvBCAJTZf
         4TTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=uwI3x8JYpZuzNt16S2hj/JyZINXzzJfl3alYvt+NIYM=;
        b=xD8cSpOix7EVHgjiRHm7TC37RYFu125FIJBGUKU2hQoeQEKLoh83X7Td7nomCWFBbw
         G62iCvMEOlYgJDUW+GVWO6jbfmd6hOGHU2EYkYt3EmXBIiZsPBp9H98WJUYIfB3TFQgP
         GoGBKRaN6npWajiqt+ZFtLs2cuyHxRHjmrAnyIkttwdayYSNGsH58x4KlmCZHgBFUMgg
         V9GA3ZohhUd8SR+cOuqnBJONtRa8gEaFK0fMvjRkc5iA8TiZvLJdDVD895eYr4EdORu2
         vW9PnhZzk3rS3JVtXj7E5O21zZbFcD8J9n9/46JjshaGD30Rc2aAMxJ/++5UvtDq6ck+
         tCbA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="CzEq/66n";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.62 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uwI3x8JYpZuzNt16S2hj/JyZINXzzJfl3alYvt+NIYM=;
        b=m8CXrXPU+x9G6YuCCQuYWaXxRVsg3GMQT44+EfdIZ1NL2Hj2A4IQgpP1I9ChnZy1X2
         jktzPgGGoJOwQvObXjRJtq+ZWBOWE6JTSSMLmK9vaRSr28j5OalbgBcwJ8D9JOKNC5Zg
         tvHfX9squeLjD2vPrZZZfe1zcqdz3u7w3yRYT4CTl0u3kBcgBL0XoABxudb9uZ6Kh9PL
         i3staYKieg1Hu6TbCAbI36NQPjtNgpk2V+S/frfTGskFXDeesbLQXJrFTyZjvREA9l/H
         dkIv2wwLOW3EqBPCY8XEcvTvM8zmH1l8z2CV9VHuKdhVCPs1F4zzXOCPE4DnifAvoSkp
         W6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwI3x8JYpZuzNt16S2hj/JyZINXzzJfl3alYvt+NIYM=;
        b=Uh9lAY5s6Ve23ezVdZqOx2xtb64nqGcmqI8wHDg+U8Rs4bEq2HpmgwoKZVrSWen62Q
         dsAaKf3O91b9NFpICFnwFdwWcQCZrf9KJeRjPReedYTAw3wQFwKMU7s7XgRE2xph9sLR
         7dw/PFSLUH8/dFkOGEvhHdKlrQgc157ZX/Z7u/Bm1zHbqLgm/vAuAI1bmLhJ9HUE+rZI
         QBWna41BYJhow7Rh+whgpRX5nzxk5UBhM6nu+McrVyFoths0HVVPRX49tmODkQ8m8JB/
         7cYjxaVY/HLD2WwanvnKYz/wPPx6yvLYfbH6VzXaUpSTw5ZKczZuX0s9m7au49eSoq2z
         mLmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2ko0ANAPoSEuQA+NT2fhMwh9z34IDaml1POf0KBkPSr/vGnDPg/v
	2nwamF1K8mAxp30rHbUOwcA=
X-Google-Smtp-Source: AMrXdXu3wDgMIqbXvivJH/LvOYOWNEbyY21WTuXtyyfJ/jiONGu8LzunhCh1oKihYoOXdK2bzxBbfw==
X-Received: by 2002:a05:600c:4313:b0:3d2:3d4c:2578 with SMTP id p19-20020a05600c431300b003d23d4c2578mr2001388wme.168.1672645022583;
        Sun, 01 Jan 2023 23:37:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbd8:0:b0:3cd:d7d0:14b6 with SMTP id n24-20020a7bcbd8000000b003cdd7d014b6ls13788343wmi.1.-pod-control-gmail;
 Sun, 01 Jan 2023 23:37:01 -0800 (PST)
X-Received: by 2002:a05:600c:15d4:b0:3d1:d746:d95b with SMTP id v20-20020a05600c15d400b003d1d746d95bmr31801461wmf.41.1672645021158;
        Sun, 01 Jan 2023 23:37:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672645021; cv=pass;
        d=google.com; s=arc-20160816;
        b=XET3zcpGl1QZm/gBlEKq7pIgHOffIDb3J5Mv2cb77knki+1N82p2JeWSNUsbYhSV1g
         CnwuzAhhWy366C+CShaKfveRmCEJV9KxiEF7XhmpnuVPRjkyeE6mfXox8l8/lw5wJVTw
         HvMJxc2ELWMJB5HTZ2afQkTgH6H2HLOOlyO7ICcj53MhsRa1OplrX0vuYi4BOOXq9VDi
         NAYmsGuA+qQQn4ensfIYildusB4IAnHhTEU+mO57DluhQr7t4Z35qyufTpxfkCtULZ88
         bHT55GFYVN31YmQl3DB8Y9b/yiEJQDbXTSB/0aLyX3FlviCL1cCZ9ABddSr8zCSx9MIz
         OUjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=thGWUiIBIzP3+Hr/qK5Gfg2X0u5ydkOnYa4muPgBw/8=;
        b=h57DkpJrtlIVtTwtF1Siqb0guQPXm0reiIeQMYbGBsWe09xaDqm9QwDD71Mqj+Q7rJ
         72hwnpnVvQlpk3AsOK+J1/YT045GWXVnqyWowUPhfWiolTOXC6uxvA2utj7sjzc4GgmF
         Hdq3QPw5w1gYNiLq7PZuz71Dscj20rmFdn8kW9BThwavfkJpkc+zIqZDdwQFUdwA6T/w
         eiPc4bLReQzC/FjVLK8LUiMbDn+T/VOvAxFRCuDLsPfIzWeE5WtqgnMcSV/I2mqfnOlw
         ISNMYZeGVeMKYCJc897MZtHnUAc+fft/VVA4fqefuUl9kgyc7J10Qo2Thccg6l8l8B+W
         FFJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="CzEq/66n";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.62 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062.outbound.protection.outlook.com. [40.107.105.62])
        by gmr-mx.google.com with ESMTPS id m65-20020a1ca344000000b003d1d8d3577dsi1511031wme.2.2023.01.01.23.37.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:37:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.62 as permitted sender) client-ip=40.107.105.62;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juHNRPjiJYgFm9OUOv7OyqmWPqSSf1uXBxJU3+z5juUwdLBv9PUWrbm2PRCud6cB7753sKvbels7HyVOJFijBg4UHniju57DAqWVX6zY0/L2Va5bOWrF/AZWqLtjZsjx7HBCs/HzMSpYl5kD6MWUi9KbyaN41l+zoVQ6y/EKjip7g+Niiy7KZMR3vKvFIHTblpmd2WAkJpRGrIjMeamBgZ4pCGcXVWXTNw4AEArvy0hV9qmhln/BA4JdFX3fhA6Op5LK8McJCGFIIPybND3MEB/g3ncyIMJEikGAkHWm3ghZ9xp6w5JKUnEJeHfpkf+dZNsreSz5IpcPoEahkbRcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thGWUiIBIzP3+Hr/qK5Gfg2X0u5ydkOnYa4muPgBw/8=;
 b=DgqIcZeVc9FHOkhTrnN11gGF5rXtv9j2+o39gC821X85sxS8tcq+P6tmmRCDsVMSop5CV1aTk53oPIyqZmXc/cq+NJBoCo3tn/fxbA8aunYlxbtE5uesDXV3B2pwK8V+KPBSoSSTtD5LLkyS/IrI+NT6sYgWQwSgiWLydWkcEuikpWqg/3BWROjabPrT9iuvoEioGYT9xUBDqlhbeYqtSaepX5SfWBMBrCxzUZjDNUNdqOzSXvSXBzXyoggBI0jqVxS8P3UownTfXqGWW2uLt/d4jui4ulVBgSkIPNAQF/SosdihvzJLhfl6EpVlvEO4M8yVBnxs+SXB3we36zpmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AM0PR10MB3233.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:183::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:37:00 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:37:00 +0000
Message-ID: <97c9d6b2-778d-5e20-fc2e-00537d9d5e07@siemens.com>
Date: Mon, 2 Jan 2023 08:36:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: the use of 2nd stage MMU translation
Content-Language: en-US
To: Yelena Konyukh <ykonyukh@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <436612cf-fed1-4b6b-97a4-29683433c8e3n@googlegroups.com>
 <06ab8036-e7b6-458b-990e-2f685b5fc857n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <06ab8036-e7b6-458b-990e-2f685b5fc857n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AM0PR10MB3233:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b57a98a-0fb5-4ea2-a4e8-08daec942260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWchNJt3jN+n/I5BFIQF4XE5zj3jmoLUryo7sr/gtB2p3SNBZodua65/BHbph2685L1Auy89F/a38lIj0xABUlifk3aJFtiul/fQkrn037etkXKe8m9abDnuAsspWDQ+3hHok5T8fsslHhr/FmPpXSn6h2D2mR5TvsGXKLn3OQeDp96dvbkjz0x3jtVtToQ2928XDix0No7bTTVitOheBRue1y2c1KDZyxXGcCGC9DhFj0A69/7BCTG/Et39L57uvHKVbUkdGZ7Ngdeb7EKTHvvYSwDZ14uZ2v6ppavlOcyRYPgAvnGSYmbIhujru/vUwKNrcFC0KZTUJ9brLZTdC717FiKvAHXIXmmBcl8agqNZTZ7p62BsG4T2ZHFtQr/iFo67PN2d3qmRY+4xiue3fFBbcgpSJ5TKVE84cIjFP22eDQWvDp0QfoGz5OH77i5TNaMolLhU3HmvQMEVh7P+O7bOWWeuyID/xBjNzQEs+0j7exL+FY6+pN7MbUlamrNc8A0yMOE3qZZEAV5boU1MXYuvaZ2z2Sx/8dgDUxSl1TVBNOw2iohTybDhuAAxGzWKHp7uQBWykuw5jzQJM37GNXJCzXl/5ns6E8AkQH4MedT4mBZ0gLtIeg5xu9eFaYHX+8mXZpdSQLcWctqqIucMcJl7hgVNksmFRLnIV1ZEW9Uyo8JMn5xy4Y9qDhVE+CPgjbCvG8DIbnA0dUMqXLDaob5lwJCDDcIyaYqQxzw9lr9TSBX3GzMcGOhHyAL6U09eCh8RaVDaFoMG99cq0PZh9tZRbikU3IzEsRimBdD1E5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(5660300002)(2906002)(8936002)(44832011)(31686004)(8676002)(41300700001)(66476007)(316002)(66946007)(110136005)(66556008)(6486002)(966005)(478600001)(2616005)(53546011)(6666004)(186003)(26005)(6512007)(6506007)(83380400001)(38100700002)(82960400001)(31696002)(86362001)(36756003)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZjVFkyMXpRZlZjeVlEejRmcE9rdEVJcDdjYkxLZ05qMUJBeGpwd0NOUTFx?=
 =?utf-8?B?czlPVFFQOWdCY2lGcG5nNDE3NjAyaTBaZUhRd04xOFNxM3VvZytYRVhaNGtM?=
 =?utf-8?B?VEVFZFdNUUpPcUhueEcrTEs4Vk81ZzVOOVBRYjlXa1gydXRNb0JRaHRrb2Vx?=
 =?utf-8?B?SUJHazdUN3ZYUVBiWTEyUDFza1R6dkVDN0x2WVh6bSsyeGpHNFBKSTNHamh6?=
 =?utf-8?B?UTZyYnpwd2pSWVVBeFpaRW1QVlkrWFJYOFUvSWtCNXlpQ3NHZjRvQXJhL2tH?=
 =?utf-8?B?RTRHZ2tseDdadXVnVmFkc0xBay9YQWVFV2R4N1YxMUk2TlZQaTMrZmVXMUlJ?=
 =?utf-8?B?SWUyOGhaQ3phMURUU2FjR3hvajVWODlnVENoRmVPR3ByNVhRNXRiT0ViQk0v?=
 =?utf-8?B?QWxIYlQzRlZaZUVwQ2MrbzZGaE9Jcm1EWUVuT1lVSk5XSEJTOHMyMm5ZdUgw?=
 =?utf-8?B?NWYvUlVrZldHR1ErcmtkUWpCVHNHVmdzUnU4dVRlNk9lUWRSRHFHQi9rc3FW?=
 =?utf-8?B?Nm5vOS9jQ0xySks5ZWRFT0FQU0NZQ0Y3aTdkYnA4Z1lGMGU2STBORVhuWTVH?=
 =?utf-8?B?NW1zcThBK3FSdjhDWkpKM2txeW0wbm03akJFVnIrTGxnMXBIWnBKMWRXaEd4?=
 =?utf-8?B?dUNQRDdaYzA4OENnWU4xRmVJUENrVUo0aGRTQ1JaWFBaQlJEbC85b0dlTUZF?=
 =?utf-8?B?MzdsY0R5NjE5RXpRWXFwSFBVcjZvK0RENjRIbEgwUDRDVmVSU2JFbVliY0dr?=
 =?utf-8?B?QUJFWmw5VmZLV0pCQkQ0dWxIdHl3bWZZTkNudTdTQWpSNHlGOGxyQXlBMTY0?=
 =?utf-8?B?VTMxU0p1dzZrNmZyUExYaEovbmJnOHBpZ08wcks2S2RNdEFoNlYwdTE5Uzhm?=
 =?utf-8?B?TTFjcWIwNEx4bHpnZlVKQVRja2tqeWdEZENHaHZMNU54ZEYxSThnRU1zZkQ0?=
 =?utf-8?B?YVlJTC81REdHSm5JU2tjS2VRNHFDeG1zeUd1ZFF3WHI5QjZTUzNaY2xTSm9E?=
 =?utf-8?B?NUJGbEk2VVY5b0RUTm9HNEoxUitELzM1a2dmY2srbUU3K2IwN2Qybmk5N0xZ?=
 =?utf-8?B?dUwzQUhUUTF4VkxjbE1ZdzFpZW4vbFFWZkROVjJhMUpRbjR0eEN5UDl4cmpv?=
 =?utf-8?B?K2x0M3NhL3FJZUIxblUwQnVoQzkzZThRZlFqeXd0YXBCYWN0U3Z2MXdpaVor?=
 =?utf-8?B?ZEJJcGJqNHhhRW1qZTZLOHUxakYzclBrU2VZZVRPQXg2VDBYRHRnei9zYXBu?=
 =?utf-8?B?UkI3VWxZa3NyNXdHd2N3M2YyRjBFNkhldVhhaUNUc1hBcEQybEhkc3h4QTRD?=
 =?utf-8?B?L3VoL0FpYnBPWms2VWdHUTZ5ZFFwZldJOG5ibDRHTnNLQlZmT0RoSGRLZ09H?=
 =?utf-8?B?RkxzUjA5L0lLN2VuVUtaU096cmU3RHpEQzBNcHVHVi9rcDR3MzlOLzRVN2dp?=
 =?utf-8?B?QnQzVzhlcmgyaHlsOGVycU9ha3ZRTlcrOHg0c01RMVBBWUxTQS8rRDVMR0dZ?=
 =?utf-8?B?eXgyUldLUmM3SHVNM0hiUzJBUFVlRThDMGpZYjN6eDZpaWFqNUc1QmpSQ3J1?=
 =?utf-8?B?ZnNGeEFoYjlKRE1BSU1DMGZFdnljR09GNHRYdWd0ajc2d3ZNQTBQTVhscjM4?=
 =?utf-8?B?Y3Zibjd2YXBCMFU1eEw2alRLWTJ1REUrME1UUHQrMXptRUlPTW1pYmJGdGMy?=
 =?utf-8?B?Q3N3bzhhWFBPdmxrVFdBZWJES2N4VGNMejJXbDRGNkxLSUdZQkF4L0d6UVpU?=
 =?utf-8?B?NllzS0RhUTJEdVVRaDZXcWt4TG9wRnFzcDdzMXFhNE5rMVJPSkwzWEpsY1Bv?=
 =?utf-8?B?NFcyUjV5UjZkV2tnZG5rSUp2cS92VG1ZcTNtSXBpK2ZWam8yUWs0ZXc3ck5p?=
 =?utf-8?B?L2hubTBSaDliclJGYW10WGRtUUxqaHkzbTRxbkR0SHIraDBtN1krSUZodUlV?=
 =?utf-8?B?WWE0UlhNQkxaQWhVcCtLd1ZYYnd4eDljRW1XaFM4MVYzMXg2c0JOS0dveEdk?=
 =?utf-8?B?bXlFYVp6a2tBTUpxMFE5dk9EMFhoTmUwTk1IKzcvazBoV0VWZUg2RUZTQmFp?=
 =?utf-8?B?TlJrY0o5QjNReXJ4cTI3MzFPV282TGRZTW11Z2xFSlQ2TVZqK1oxWGdZOXE4?=
 =?utf-8?B?dFE4QkpKZHYvN2ZOek9Uai9GTGRhai9TREVFMXdjT2FrcS8yMXlWYmRpVVRI?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b57a98a-0fb5-4ea2-a4e8-08daec942260
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:37:00.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XBCCaokSvR1+5K+UrJRqihgldG40BCmsE3IhHM/ws/P2Zhcstp3etWyrsLlODVrnLS2hXrQw12NblQ0RLFmkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3233
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="CzEq/66n";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.105.62 as permitted sender)
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

On 24.11.22 20:19, Yelena Konyukh wrote:
> Hi All,
>=20
> Answering my own question :) :
>=20
> I have run the demo from https://github.com/siemens/jailhouse-images for
> Raspberry Pie and simply collected the output of "cat /proc/iomem"
> before running Jailhouse, then after enabling Jailhouse in the root cell
> and in a Linux non-root cell. From that output it looks like Jialhouse
> does 1:1 mapping between IPAs and PAs.

It does so in many cases, but the 2nd state MMU would permit a different
mapping as well. However, we do not have broad SMMU (IOMMU) support on
ARM SoCs so that we often have to keep a 1:1 mapping even for non-root
cells to work around that.

>=20
> On a platform with Zynq UltraScale+ MPSoC, onto which Jailhouse has been
> ported, I have experimented with memory accesses, trying to access from
> the root cell the memory allocated to a non-root Linux cell and the
> other way round - trying to access from the non-root Linux cell the
> memory allocated to the root cell only. As expected, in both cases I
> have got "Unhandled data write...FATAL: unhandled trap (exception class
> 0x24)", while the cells can happily read from/write into physical
> addresses belonging to their own memory regions specified in the
> respective cells configuration. This appears to confirm the use of the
> 2nd stage translations for restricting cells access to physical memory. =
=C2=A0 =C2=A0

Yes, primarily. For remapping physical addresses, see above.

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
jailhouse-dev/97c9d6b2-778d-5e20-fc2e-00537d9d5e07%40siemens.com.
