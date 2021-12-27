Return-Path: <jailhouse-dev+bncBC44VTVY2UERBUGJU2HAMGQEK4PPQPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C147FC3B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Dec 2021 12:34:41 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id 144-20020a1c0496000000b003305ac0e03asf9778420wme.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Dec 2021 03:34:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640604880; cv=pass;
        d=google.com; s=arc-20160816;
        b=CD2XndiupNbDZ04Q/gSefZotBEADanJfPRZ/O/1Qal2gHiIJwuLPdFZED64JKhiaIP
         +OAnAslp4MjP1F6ZdYnqFv9O9AmFOp+Br+U278NLzaxUAyK4A94p5iINuSrk0e5fGuZu
         Qni3tpySekRJx63hdPO84rO37977ZReAbIs+vwcX4PvApPtQFqrvpWRO9uB7Dvikjrlm
         qONPUjrRy+D9/OyKZKGx+cep57Lu0hqoDZnMiNLj3utEYUXcRDGq/74PYnoqA9ZHi9IX
         SN8irE80LZh0337W2YtN5pB56NzM4psaXZ/jmbXt5WxuqyKB5akPiL+plwE3+8Xqw/NZ
         WClA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=iy0cNR5JB7rsdOs2O8WjwgR7zP9vLBTD1DHmdLB8Obs=;
        b=0DHq4FvE9rLDsd2vDGRpzha8cGDt8td67yFadikUdkP0yRFOeyzfaQ6/+DxBSxCj/1
         YVr8qkBETGFEo9deLEnHfd2B90MTCgyr8pXJ/cquOMGPf1zDbCoL5i48d8BZc9j27+FA
         igU7T6ZXVp/00tnBOgbgdKE/586f66p5E1DrkA09Kv4rEJeU0EL0Ka+96GQO3UuyWgIC
         SjrbVqLdD60Sq+JcS2BBMzGfhNio8VZdvcYgL2/V1U7s3hyvd8gG0la5qLD/ETm652/m
         I2ISq5UddR+9YgKFBCABERT2IVEUSHrei2NxkKsRvej/BBz8lowmed2GUAfkhwoY+NPW
         ygQQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=gzkDQ8XI;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.73 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iy0cNR5JB7rsdOs2O8WjwgR7zP9vLBTD1DHmdLB8Obs=;
        b=BBpEBUk+PwjmjYNAwtq+JMtbTuV/2Ye2FZRlvfphnhGCg8HQxXjyIEu20EL0hSeBnp
         z7iNaORayMY1oYftmiPDpPW/MljET7LLHydKv1S2qInP/kn7Uzw3tQuf/slVZd0y6hDT
         dQ7ZiDP5Tf4Xxsz6MjLMuETIkdJwRFb1i/LZMBh4CVgKCWC9byq+UFMcZvlJEH5vIPoR
         wdWGhvsnq93em3z5E+pXtfLka70/Sv0zqe0wgfIEeuc4gFLK3rbYAEjoIFfY09dtAoNJ
         HgV83jvFA4hOEfOiGko7TxXGMLOvX17SMFUuiFGePY0ks9fWfRFZ4SJcqzfdte/wQ2gx
         5qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iy0cNR5JB7rsdOs2O8WjwgR7zP9vLBTD1DHmdLB8Obs=;
        b=V+QPc2SdE6YiP7URmZ50PZwXCXznhdKOaYL5XRkGKoXkPo52Gr4b3NFjYFt/BpR6Af
         gmO6DnxFwluulr9VKSjdJ6dMRXf3R8BWHhs2LWoeQNTBpHiDEEB+EViEsxdYeI2tw3IN
         Di7KyXy1H/+kopAx2qj2ye1iMPPOAV89z4pIXeqSqOfdoL5Dr9uNIFGjWJc//dkfAoEf
         eJoIbdhqTvWFIOUkxtwGnDjBRtpIKeN+9RzN6K1FgNcgnZGTuKWxahAfT406aKX6rmxs
         VjjtSi5OnKOFoOBpM8ojMt2bBnUA22ThUDVd9Be0Bq5U1C5KXKk2WaODFsjnm9Isa36L
         JmUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530XH5/rnZCnGQdw/2Ac6VEWPzfz6fYWEwPjhHZIjHaWoh5nZHbL
	Tx9hFUAvp2ZD2o94viMpyMA=
X-Google-Smtp-Source: ABdhPJyNxjpMBOpno4d1doTRlXov93Y7bTBVGE9P7yAEuGmUX/5j0JfMXeHLB2OEjtQF92wJMPDIOw==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr12512845wru.311.1640604880655;
        Mon, 27 Dec 2021 03:34:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3b56:: with SMTP id i83ls7500148wma.0.canary-gmail; Mon,
 27 Dec 2021 03:34:39 -0800 (PST)
X-Received: by 2002:a7b:c202:: with SMTP id x2mr13058537wmi.57.1640604879577;
        Mon, 27 Dec 2021 03:34:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640604879; cv=pass;
        d=google.com; s=arc-20160816;
        b=DgjE3bDtpMrwIMYmd5KuAJE7qmkkA+D4LCIxsKBSIz5bgGsJM2Pq5CB4HdYUkGh/kv
         JdWO/i03DzynxpAoDJo1jb2FLhIzV4nC851EbNG5X8XrkwQuXffpba0TFXjyHdSzV30p
         DaVvU3eBUnsEWjqA5WlT4AvFs4Q7iiUPibPsSI1x9xelTNv1Jskr4H6PHjn3POdD918W
         gZWX84hoiiNIBdgrsHZ11Nop3brdpf0t7O8vbHEmcRl5H2SWEPVaNpKIQmNsE1eZQ6yy
         1HHbq/I0wJFYYM3sECOE5gkz8EqjCMA4oh0RVlAKHV8euEmF6hMGSsdQqib7xBUwW0Qc
         B9hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=G7DJbp/02OCRbQZZRFFcnKg429/dqtxWi0h0xzw3I3Q=;
        b=Xipt21Mr6iDcno741CvLbW6VGmUL7YLW3wFs2OmqfUFd2DYvAc7UMjbsB61LaP/+0O
         lcdz1gW5YIkVd5Q5rKu+F+LgFpkrjrB237rwyTIaX4NQilS7p7k6cEy5WOmS7SKfEZrg
         CwjWGQhDOqTR5lSlM4rEaopD2oeIMtcsg0/uOoAum7axPQMywhqxYin4qvMHRVPmrILn
         trJH6fL7kGaYJ9hb48rnXwZDo59Dv49EcvbLFUnkRlr7FyAMQNA99k/eDF5laQXnLmDw
         0ixY3il+BkII6YsDY6mama7m/EtyatXz3yaKG4/Gu0u/6rRTKQpBLnE4MkNV2yLZyqDg
         CxOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=gzkDQ8XI;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.73 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70073.outbound.protection.outlook.com. [40.107.7.73])
        by gmr-mx.google.com with ESMTPS id j203si529311wmj.0.2021.12.27.03.34.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Dec 2021 03:34:39 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.73 as permitted sender) client-ip=40.107.7.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLxXP7K4QG27z/yitFy6Z3wDdjFWeiZi0MtFwuKaVBthC4jUU4Pj+knmXS0FNhRw18lmK3h0jPczC+oKKDsZ3m6NJjfq+m4coaC9DwXla+90fPH9Rt6rrShcEs8ieMqxG8RzKPKv9dp60QNst+Umx++nl2B/FRwJBoAvaQv4YuUem8Vpz2Qk+Q3prGAehEZd+6k6cYW//5XH+dd74NSUVbXp70i/5DwbZNhfaclVLytzCxBVat3RwEmrTky+wSM3WRnsZmxad70tfpPx6XLSQ/hX2wJ87J2XuBZ+eOtrr+Pjt3866AvQTPLHzwixgVbpAdLQcwI9crOQ28NdJEFhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7DJbp/02OCRbQZZRFFcnKg429/dqtxWi0h0xzw3I3Q=;
 b=Ht8rwBe2Gcj1xJD8TsTyVnzcX+mk62uju3YRLruRjcO0mrjUXYpdA6wUsttKbhcy4O4YGpjysQgxInL76HktRYD6AVF2iFUHgPFZDmSmvunRi/iM/gInGVzXvFjdGrBElQJvIvgHayhba35k4jgyB3e/9Akdc8dPJJiO6NyQW2HXmHYK63QJ2Q8svvYcosg6EsjuEEpTztXISwHRcAzNCYQFyhaqkt1EagmK+AUB/HKpSRxZYMTjw5fU5oFdOmRUcsOInjKZ3Z00WhW72eqJ5+/V0xI3JzUauS8E0V3DHoFdfrWsYuNx4eIQYbPoT51njZkv6URDozR+fKS1WmQszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2340.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Mon, 27 Dec
 2021 11:34:38 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4823.023; Mon, 27 Dec 2021
 11:34:38 +0000
Message-ID: <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
Date: Mon, 27 Dec 2021 12:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
Content-Language: en-US
To: jiajun huang <huangjiajun145041@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
 <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
In-Reply-To: <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::40) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ae4135-51a7-4fbe-30b6-08d9c92cdd32
X-MS-TrafficTypeDiagnostic: AM0PR10MB2340:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB2340592C46BD5E8F657F853EF6429@AM0PR10MB2340.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SB/e+lfL5N805QfktWdeF1lWBaoHgM2zTGr4Iuv31c2bkC1zc9CG2+icyPYjcUoQbGdJR0x0o7EOUflenM0HsGeuzgbSkKi0jdrjI/PzuzH/42sGxMB4bGHCP9ejVOxdm0umFNRSXO4lJUzT02MWZ/o1dQkW4eJd8tdU4yBfYxxHDBx7OcC8f7Qphc91cGmUDvoqIt83z9RDDcOnwFn/BA/T8574LOGLsx0mX/206M/oCO6bxP3WXJj3Ql3f9h74MI3mFcl1H/85/wIHBVEJFtCvZ+N6T6+b05vRb8Q8Pb3SHDzGSymZ/WrROa1BeZ5Uy1QsmCQ9EiIlbZMEjSxO58EjoO7EFCQcHgKVaH4957YobZp/BmubGCchO6BDSEV3qsYJcPMWvGGvTlPX80ZWH4N0Me5SzwC4dzpZUjUStCAqqRg9Z7C85e6hgU1q9mJ2xsfMcfjm/kxYbERXBvaz+usovEW7TppR9NzaXXn/Q6vRnt8Ee7uX20ofq38xKIF/pGCWTGK5VTigO7rpMExjNrt6bZ6QQSSviNekx1Ag5eQsENMD4NQCkiCsrNzfGsPmwPSVQZkmZhBnyL6tb+Zf5eDY+FLcmd+HC2nP9yh/iez5btYyvypvkBHpUfQLm2cYGacaiWmHuSFCLuKIhxEvxwYmRPRtUdToFkvrqVaTJ+oxQMIMqTQ6XssiLhpIVMtU0PER8CnI+CcyDAt6mHznij6yJomFwnIgcCOL0/Y95HSeUISpKOpsKxFcS/RmAhoyINDaLBkQK3riZ0qrpHpl1tNuuCzzAipsHqS8F2du9+tl0NwwajDYnOacdwgHYEVQ7Rwq5lNMrMYN8ypSKTwiwvLRjygCctLUUbeKZv/dJa0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(82960400001)(53546011)(36756003)(31686004)(30864003)(110136005)(5660300002)(8936002)(508600001)(2906002)(8676002)(86362001)(966005)(66574015)(6486002)(44832011)(6506007)(6512007)(6666004)(38100700002)(2616005)(4001150100001)(83380400001)(31696002)(66946007)(66556008)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVPWHpoMFRvUTFHcnlwRHhVdEl1Qk1tcFdFMWFOMzRsbXdiV0RQSEVmRThM?=
 =?utf-8?B?ZTQydXBZc20zY2lZQ3A1SjY0UkVNY21WVmlxQ1BhODRxeVBiLzBhd3lJM3hK?=
 =?utf-8?B?VlgwcW90NkJPbGE5Nm5YL3ZqdEk4czBnaFBUb0R6WHVrZVp5WVBKVUdSMC85?=
 =?utf-8?B?ak9lUTBZT2Y2bzVQQU9nWmNiZjIzN3kyUGZoUzlsZmRsT0p4VHNxc0JqQ1g0?=
 =?utf-8?B?V1BwbGJBNXhFYkw3Y2lCMGJaM2hXTjR0WThWa1pYOVVIK3R1NXJLaTdsMTha?=
 =?utf-8?B?OHd0UzlDUzdEYlpvYWRPenN2cHVCK2N1cDhmeEdnWjhtZ0pUYVpPM0hoVG5v?=
 =?utf-8?B?RXFoL2dyZ1B0dnhGWGJ4Z1UvamMrMnYrVk1iQ1pnQVVKNFJmb0VOaUZvWERo?=
 =?utf-8?B?L2x2eElwMWk5N200cHFaZU9qdGRPZUtpUGhvaWRVZm9IUU9neGNIWjBQOUtz?=
 =?utf-8?B?UmpmMFdKemw2bGRGdmQ3bWhNcjlsVTFUK0xPMm5HSnBvOGJQNkRHbG1INDNv?=
 =?utf-8?B?NWlDdC9sb0IxREdwRjVlY1dYeFgxRlFZRzg2Q0ZCT0tTSW0weEhnakwxUnA1?=
 =?utf-8?B?YjU0VWltTjNSUW44RGdDTEN3ajAyalF0MDYvNkpVelYvcEVOdWtEVHcvUyt1?=
 =?utf-8?B?UnVMbG51WW5ORThzL3VMZDJudlB2bjM3Y2Fac2g0amVOL2FJdFZOeko4TW1S?=
 =?utf-8?B?VVloM1dqSEZ3NElacVlkSjFWaFZMOGpvQXJUR2I5Vk5FWllxejFNQlU3U2xj?=
 =?utf-8?B?ZVVQS3BFM0RpcUF6eUF4Y1BtQ2Z5UTFyUmI3V29UMFNyMmk4Z0xUblgzM2c1?=
 =?utf-8?B?T0dGZlhrSjdZVnRIRlFLb3NsdU1hOGozMEpvVEtWM1Q2VzRCQW5VY2FNZU1O?=
 =?utf-8?B?MXJHdTVaM3d1UWNRd2ZycFVDVG9UK1hnTmVyN0tCeTM5UE9Ublh6MG5hdUsr?=
 =?utf-8?B?bFNFK0ZLY3VIK3FIamVyREhxZk4rcERZVUhQNHRSTURjaFoyN3JYVmJoWEp3?=
 =?utf-8?B?bWVaSk1ISWxnOUk2TXNkOTM1RXgzOEtPRXUycHBpYktWcnFIYVZzMlBtU2k0?=
 =?utf-8?B?Sk52ekZQeDJUSjNqSHM5OCt2RzYxSEVDMytCcE50YlBDRURSOWJhQ1VZazlN?=
 =?utf-8?B?RDYwV2lJVUhvM3lHOHBhb3lyZHV5d2FQclc1VzVQTklFQlhiNXN2UXd2UUJn?=
 =?utf-8?B?WjdVY0Joa1VnUklnY0RWTWNuQUZ4eENNWlF5Uk52c1lGMEplMm02Sk0yblVG?=
 =?utf-8?B?aHd2YUM2YXd0ZXVIckZ3aUVHenpJM2sxZ3ZaeHQ0WUxvMENkZlpJUmZSaHhN?=
 =?utf-8?B?c2RuNDZocitaWUFpVm45UEg1VURYSGd4SmZGT0F0NUdqWWxFTVVtOWxuV0lO?=
 =?utf-8?B?aFdBSElPUWN4NHREc0plbVVnU1owSFNkaGJUQnpMTjhWSkhuTDUzSzRZS0xk?=
 =?utf-8?B?V3VaMWxyclp3NWlDWGxIbHBJRnIya2wxblBXSGJVWjJ5SEc4K0hRd2N4QW1j?=
 =?utf-8?B?Mjc4TnI1c1NGVEhZcG1SUHNMKzhmT2IyL2F2VzJQWHpqVlZab0ZJaTMwUTBP?=
 =?utf-8?B?UlFVVXhpZTFJTnpFSmdxeXMweFAyR2NVWURkNXFJRnZKdUdTbGVYNnlEUWIv?=
 =?utf-8?B?bmg3WWJJQjNkYmYzMnNaWlFkeHA4K3BFOWJhUEF4akJGcUJ0U2hXdWR4WTUy?=
 =?utf-8?B?aC92anJVdHRaOENPYzBxK3R6c0RKMmgxUjJmbEhLdUM1TjNzclI2N1lOb0lF?=
 =?utf-8?B?dmpDTytuQ3puTUQwMVBDR1d3TlNlMGkvN0JZTFlTZkVkeXVYUURZKzAzYnM0?=
 =?utf-8?B?cVlMSEYvWEkvb3FUMlpVN0lEYU1aL2prNy9LdlZlYjBDd3RETllMU20zcWt5?=
 =?utf-8?B?VGM0RFJOa0kvWU5GMW80WlU3c3owN0xaNXFUKzBFbmV6WHdSNWNIcEpXNzBo?=
 =?utf-8?B?ekFPaVNOUjczMCtydzRpMVB1bE42RncrNVlDSjF6dXFZUGc5L3dGeEk3MFh0?=
 =?utf-8?B?bkR5aE9PRHZaMC9PYjdwVVpHNmNmdDByTW1kdjJTZUV6WG1SeFo3dVNKQ0sx?=
 =?utf-8?B?L3hjQjhIekRYU2JvdGQ4TUJsemNCUmJXMXp1Zk9uNE1pQytnN09TMkFZdmNa?=
 =?utf-8?B?d2Z0cXdTZTE5Y2VpcW1iK2lqb0dPTlFhVHJnMmw2ZlcyVW1qaTZtT2xEcjNy?=
 =?utf-8?B?REFJT3VNSWxGenoyTjF0YUt6TU53cTlTREVlVVlNYzVlV0Y2dzBQYkFrUmdW?=
 =?utf-8?B?Rk9WUS9mS2pGeFhkZE8xVnhGWnZxSzJMT1RleDJETkVhTnFlYXpIcHNaRmtj?=
 =?utf-8?B?T3VOaDNNd2RsNXZCTm96TUlGTlJCeG1HZENhK3U0czhPN0RZbVhORDVJL1Rx?=
 =?utf-8?Q?2hvoPpl+M1RxjLn0=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ae4135-51a7-4fbe-30b6-08d9c92cdd32
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 11:34:37.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0WexPKvnhBeWekbSb6cfOWzEjdKNS4ficelZznhQZAsMn+jz7skcPuY8nA0bxjK0x46+iWGdiB5rEweWOVG65qkPwGXEbgmITt/jYj/lmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2340
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=gzkDQ8XI;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.7.73 as permitted sender)
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

On 26.12.21 17:21, jiajun huang wrote:
> Happy New Year=EF=BC=8C
>=20
> I successfully created root cell and inmate cell on QEMU, and nuttx
> running in the inmate cell. At the same time, I added the ivshmem-net
> device to the root cell and the intimate cell, and loaded the NIC
> driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for the
> network card. But when I execute ping 172.16.0.2 in the root cell, the
> error "From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable" appears=
.
> The attachment is the driver I used in linux and nuttx respectively.The
> network driver uses the virtio interface.=C2=A0I tried to log in the driv=
er,
> but I found that the control flow did not enter ndo_start_xmit().

Looking at the hypervisor logs, it seems that the memory configuration
of your virtual interfaces is correct now. The shared memory between the
cells is detected, the device probing seems successful.

I guess you don't receive interrupts for your virtual devices. Could you
verify that by looking into /proc/interrupts?

Are we still running on qemu? All your devices have .iommu =3D 0 set, but
the .irqchip configuration looks different (root cell as well as inmate)
compared to the qemu example that we have.

>=20
> ping
> PING 172.16.0.2 (172.16.0.2) 56(84) bytes of data.
> From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable
> From 172.16.0.1 icmp_seq=3D2 Destination Host Unreachable
> From 172.16.0.1 icmp_seq=3D3 Destination Host Unreachable
>=20
> route -n
> Kernel IP routing table
> Destination Gateway Genmask Flags Metric Ref Use Iface
> 0.0.0.0 10.0.2.2 0.0.0.0 UG 100 0 0 enp0s2
> 10.0.2.0 0.0.0.0 255.255.255.0 U 100 0 0 enp0s2
> 169.254.0.0 0.0.0.0 255.255.0.0 U 1000 0 0 enp0s2
> 172.16.0.0 0.0.0.0 255.255.255.0 U 0 0 0 enp0s14
>=20
> ifconfig
> enp0s2 Link encap:Ethernet HWaddr 52:54:00:12:34:56
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:10.0.2.15 Bcast:10.0.2.255 M=
ask:255.255.255.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fec0::8070:776d:7dfd:da1/6=
4 Scope:Site
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fec0::1493:dcc2:ea12:8774/=
64 Scope:Site
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fec0::7c68:51e0:8aab:db34/=
64 Scope:Site
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fe80::feb9:1534:861b:722f/=
64 Scope:Link
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST MTU:150=
0 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:675167977 errors:0 dropped:=
0 overruns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:248205 errors:0 dropped:0 o=
verruns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes: 52687970572 (52.6 GB) TX byt=
es: 49989174072 (49.9 GB)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interrupt:22 Memory:feb80000-feba0000
>=20
> enp0s14 Link encap:Ethernet HWaddr 3e:27:50:f3:c5:16
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.16.0.1 Bcast:172.16.0.25=
5 Mask:255.255.255.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST MTU:163=
84 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overru=
ns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overru=
ns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) TX bytes:0 (0.0 B)
>=20
> lo Link encap:Local Loopback
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1 Mask:255.0.0.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING MTU:65536 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets: 491565 errors:0 dropped:0 =
overruns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:491565 errors:0 dropped:0 o=
verruns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes: 29522474 (29.5 MB) TX bytes:=
 29522474 (29.5 MB)
>=20
> arp
> ? (172.16.0.2) at <incomplete> on enp0s14
> ? (10.0.2.3) at 52:55:0a:00:02:03 [ether] on enp0s2
> ? (10.0.2.2) at 52:55:0a:00:02:02 [ether] on enp0s2
>=20
> jailhouse output
> Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU 2
> Code location: 0xfffffffff0000050
> Using x2APIC
> Page pool usage after early setup: mem 108/32207, remap 0/131072
> Initializing processors:
> =C2=A0CPU 2... (APIC ID 2) OK
> =C2=A0CPU 1... (APIC ID 1) OK
> =C2=A0CPU 3... (APIC ID 3) OK
> =C2=A0CPU 0... (APIC ID 0) OK
> Initializing unit: VT-d
> DMAR unit @0xfed90000/0x1000
> Reserving 24 interrupt(s) for device ff:00.0 at index 0
> Initializing unit: IOAPIC
> Initializing unit: Cache Allocation Technology
> Initializing unit: PCI
> Adding virtual PCI device 00:0d.0 to cell "RootCell"
> Adding virtual PCI device 00:0e.0 to cell "RootCell"
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding PCI device 00:01.0 to cell "RootCell"
> Adding PCI device 00:02.0 to cell "RootCell"
> Reserving 5 interrupt(s) for device 00:02.0 at index 24
> Adding PCI device 00:1b.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1b.0 at index 29
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.2 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1f.2 at index 30
> Adding PCI device 00:1f.3 to cell "RootCell"
> Page pool usage after late setup: mem 339/32207, remap 65542/131072
> Activating hypervisor
> Reserving 1 interrupt(s) for device 00:00.0 at index 31
> Adding virtual PCI device 00:0d.0 to cell "nuttx"
> Shared memory connection established, peer cells:
> =C2=A0"RootCell"
> Adding virtual PCI device 00:0e.0 to cell "nuttx"
> Shared memory connection established, peer cells:
> =C2=A0"RootCell"
> Created cell "nuttx"
> Page pool usage after cell creation: mem 871/32207, remap 65543/131072
> Cell "nuttx" can be loaded
> CPU 3 received SIPI, vector 100
> Started cell "nuttx"
>=20
> nuttx output
> x86_rng_initialize: Initializing RNG
> pci_enumerate: [00:0d.0] Found 110a:4106, class/reversion 00000200
> pci_enumerate: [00:0d.0] Jailhouse Shadow process memory and pipe
> shadow_probe: Shadow[0] mapped bar[0]: 0xf0000000
> shadow_probe: Shadow[0] mapped bar[1]: 0xf0001000
> pci_enable_device: 00:0d.0, CMD: 0 -> 6
> shadow_probe: Shadow[0] shared memory base: 0xf0000000, size: 0x1000
> shadow_probe: Shadow[0] State Table phy_addr: 0x176000000 virt_addr:
> 0xf0002000, size: 0x1000
> shadow_probe: Shadow[0] R/W =C2=A0region phy_addr: 0x1000 virt_addr: 0x10=
00,
> size: 0x3ffff000
> shadow_probe: Shadow[0] I =C2=A0 =C2=A0region phy_addr: 0x1b6001000 virt_=
addr:
> 0xf0003000, size: 0x3000
> shadow_probe: Shadow[0] O =C2=A0 =C2=A0region phy_addr: 0x1b6005000 virt_=
addr:
> 0xf0007000, size: 0x3000
> shadow_probe: Initialized Shadow[0]
> pci_enumerate: [00:0e.0] Found 110a:4106, class/reversion 00000100
> pci_enumerate: [00:0e.0] Jailhouse Ivshmem-net
> ivshmnet_probe: Ivshmem-net[0] mapped bar[0]: 0xf000b000
> ivshmnet_probe: Ivshmem-net[0] mapped bar[1]: 0xf000c000
> pci_enable_device: 00:0e.0, CMD: 0 -> 6
> ivshmnet_probe: Ivshmem-net[0] State Table phy_addr:0x1b6205000
> virt_addr: 0xf000d000, size: 0x1000
> ivshmnet_probe: Ivshmem-net[0] TX region phy_addr: 0x1b6285000
> virt_addr: 0xf000e000, size: 0x7f000
> ivshmnet_probe: Ivshmem-net[0] RX region phy_addr: 0x1b6206000
> virt_addr: 0xf008d000, size: 0x7f000
> ivshmnet_probe: Initialized Ivshmem-net[1]
> shadow_state_change: Remote state: 0
>=20
> cRTOS Daemon: Starting...
>=20
> cRTOS Daemon: Initializing Network (eth0)...
> set ip
> set router
> set mask
> =C2=A0ip =C2=A0up
> cRTOS: Initialized! port: 42
>=20
> cRTOS: Waiting for client
>=20
> =E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 22:46:01<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>     On Wed, 2021-12-22 at 06:33 -0800, jiajun huang wrote:
>     > Hi,
>     > I will try as you suggest.
>     > Currently I try to run this open source project
>     > https://github.com/fixstars/cRTOS/blob/master/Installation.md
>     <https://github.com/fixstars/cRTOS/blob/master/Installation.md>. I us=
ed
>     > to follow the guidelines of this project to successfully run
>     > linux+nuttx on QEMU, but I found that the ivshmem-net device on qem=
u
>     > does not seem to work. I suspect it is because the mmio area create=
d
>     > by jailhouse for ivshmem-net devices is not registered in QEMU. So =
I
>     > decided to try to run this project on the server. I want to know if
>     > the ivshmem device is supported by QEMU?
>     >
>=20
>     There are examples with ivshmem on qemu, if you get the memory mappin=
g
>     right it will work. Normally you can't re-use the same hypervisor
>     configuration on real hardware. The IOAPIC/iommu setup is normally
>     different.
>=20
>     Root-Cell:
>     https://github.com/siemens/jailhouse/blob/master/configs/x86/qemu-x86=
.c
>     <https://github.com/siemens/jailhouse/blob/master/configs/x86/qemu-x8=
6.c>
>=20
>=20
>     Inmate/Linux:
>     https://github.com/siemens/jailhouse/blob/master/configs/x86/linux-x8=
6-demo.c
>     <https://github.com/siemens/jailhouse/blob/master/configs/x86/linux-x=
86-demo.c>
>=20
>=20
>     >
>     > =E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=B8=89 UTC+8 22:17:37<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A
>     > > On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
>     > > > Dear Jailhouse community=EF=BC=8C
>     > > > This bug occurred when I tried to start nuttx on a none-root ce=
ll
>     > > > on
>     > > > the server. I added two ivshmem devices for nuttx. Below is my
>     > > > configuration file. I am not sure if there is a problem with th=
e
>     > > > mmio
>     > > > area in the configuration file. What is the communication area?
>     > > > In
>     > > > addition, if jailhouse runs in QEMU, can two virtual machines
>     > > > communicate with each other through ivshmem-net?
>     > > >
>     > > > Below is my root-cell , nuttx configuration and log output from
>     > > > the
>     > > > port.
>     > >
>     > > Have you validated your cell configurations with the jailhouse
>     > > config
>     > > checker? I did not look into your configuration in detail, but
>     > > nearly
>     > > all of your inmate memory blocks are tagged with
>     > > "JAILHOUSE_MEM_ROOTSHARED" which seems uncommon.
>     > >
>     > > I would start step by step. So start from a configuration where y=
ou
>     > > know that both cells are booting up. Add virtual NICs afterwards
>     > > and
>     > > make sure that IRQs are delivered to ivshmem devices.
>     > >
>     > > Are you able to follow the boot log of your inmate? Hopefully you
>     > > will
>     > > see the reason for the VM exit there.
>     > >
>     > > HTH,
>     > > Florian
>     > >
>     > > >
>     > > > Best regards,
>     > > >
>     > > > Jiajun Huang
>     > > >
>     > >
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/c7eaa08e-ae92-4c5c-a57c-7=
ddac379242cn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/c7eaa08e-ae92-4c5c-a57c-=
7ddac379242cn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/514e2fa3-9e58-5b79-038c-fe4ac21e803e%40siemens.com.
