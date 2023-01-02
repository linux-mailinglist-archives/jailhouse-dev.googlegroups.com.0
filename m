Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5EWZKOQMGQEN6XOIIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E465ADCE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:44:53 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id z8-20020ac25de8000000b004c66d7fb5basf10003579lfq.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:44:53 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672645493; cv=pass;
        d=google.com; s=arc-20160816;
        b=nZ10ZZHV0sJ5FL4CPk89V47Vz2LiiWpQQlupSF19jIOV5D5PMTkgnAZHRbmBElBwS0
         rbUZZHTFDZLkuVwDXii3x4K4V6PAgt4eVACWNFT7raWBWoAa+QKRHLwpI2tOWxhr2D9t
         3krtJvjJNNIEDdOy4a9MurarZkGQqkltpQqT/juqwaUPRmbHSOkGb9V9n2tyuqVJ/WMo
         Z/Q4uJBAaWMit32RvMQuyLyQEGOHZr4ZaAilNutQXxAzenFVBRz5U0aRpJBz2SnnwTOp
         037EAXvaZKA89eo9inxMnfaudmFohDC9ICzEdHqqNvWhi+DkjLXoPqi0NRAMeZMspQEh
         iQAw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=Q/hhf+lMWhCL++9f3R1ptpPNs/QL/pbdzFNsiAyiiLs=;
        b=m8tzuyPuBD7sHgwCafmdR1/xp8iQzaEBsxKR6RVoykgg6yaYASs8cc1JarlGa6jBuu
         tRpgjl9S4c0qdNtD0EJ0M+xfqZfLbuHNNDCDDo4JXVfn7816R4tYbQPB4HnALWUJYZv3
         x96zdBe/Jh9pfoV/6/BxI5C7mnBt1qByR1TpUHlXt8cOhp4Cc8UC9zU8nT/wLXFquOMJ
         DfX8VVIWIJ+fxMgl+gfPkWepbKMkhG9aKKbNcRE/3lYFC1zJsT5BfybLrchWkwZ0jnn8
         An8tOJN2fFvstWQs2ZDGCf1nr+BL2BUf+2NTgMN10pqSCZoZfdrPv53QIQ9Dsf/IHpaK
         SU3Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=OyTxwxQ5;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.80 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/hhf+lMWhCL++9f3R1ptpPNs/QL/pbdzFNsiAyiiLs=;
        b=smUU3XmsRWu6xnMIFyodiUfNE/u81e0WAvVFRSbKm6WyZtsOQFSbnvg9Z2YoQgDQ4V
         r3VQsDKfu7BU664a4UNYFe6ywoErfjbG/lvKuVhBVh37evwDQQjY5GlM3Mtu7z21lR+C
         4/RydSUz59mL3Tzgcy4ZDQPe/NC7mvvPBpTfp8HtYUIGnjoe1Zye7ZxpalSpf9lyZhPX
         o+n92q7EkdkK6hplx/lMBSQSV9/qOhXpyv47VahE4gT5M0FWDjiI6ExhmEn9NzZfK+qP
         5hKD5XofCOQ8hETgM3IGDwTE2HYAESFrpEL1/WWPLPSXS8Kb9k5Ay8iScS61b5yK9u/P
         5vWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/hhf+lMWhCL++9f3R1ptpPNs/QL/pbdzFNsiAyiiLs=;
        b=RzO7cj/xxhIfuwlL2CpjALgUIzYswQ8k+H07jbCkU5s6B9VxRLs6gTjnvREx5B1c4U
         ggavuD28C4/xDiT5h+Qm359M2Ou2F7Hvv4EgIiH6fghr5Nuu1yaOlo7ZDGNpXSrFaLYa
         UAzYkPMZ0dW+BXp3EtYJVbc+pyRhp8rZQyWtQtcrYI/Lt6mv31SMrOlR/zfuEak62Ut4
         mCeDNcFdgoyoKodlcuF9OW4dFmJheiioB1ZaGHPjcfeBz7QKsobM2uyaUX9I8e8o50fI
         11569sBNGSZzpqy2+QIgFEb3e1jXP6WCFtWRo2N+wMp4idUNsSMWb98K1oZ1/BKziaw9
         bb9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krJ+LrZ/X1h4nZoZ/co9XeZRwxSWU0ZlX6V3LTun5GudcAH7FhC
	V420v7R/BTp5UcBeMiVYQ4U=
X-Google-Smtp-Source: AMrXdXtCX5txVvyIVIbTfMcKVWWdPbhpyBUuV9Ph2yRGGprI8Mxmvc7pV4uBL9QE2Ot8RFoIm0wOcg==
X-Received: by 2002:a05:6512:3f07:b0:4ca:f873:7cf3 with SMTP id y7-20020a0565123f0700b004caf8737cf3mr2455198lfa.89.1672645492912;
        Sun, 01 Jan 2023 23:44:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4e8a:0:b0:4c8:8384:83f3 with SMTP id o10-20020ac24e8a000000b004c8838483f3ls8708571lfr.3.-pod-prod-gmail;
 Sun, 01 Jan 2023 23:44:51 -0800 (PST)
X-Received: by 2002:a05:6512:22c1:b0:4cb:783:54cd with SMTP id g1-20020a05651222c100b004cb078354cdmr7897208lfu.17.1672645491029;
        Sun, 01 Jan 2023 23:44:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672645491; cv=pass;
        d=google.com; s=arc-20160816;
        b=q3MNNelWGWq0rPnmCVDN5QdEG1q8DsqG+QHGF4/kIpEUx76zg9p34PUBreGX57xbsA
         AvLOrAPuLM25fjuNvcIxO+VbXvWKmcl2gYjshaBXcdVi0bjGeuAX0GqERK8j6WtGc8GI
         70gz5e5ThzVW4hQ2l1xMd+ukAyvYHTwv3WAzZB4EIIy0m3Dkdm/lRyEUzVM9Bwo8KSbK
         4OzD/wbdDOeZlqu/wRuh0rga3qPN/00Fzw13mMh/jDrw0NTJXBnqfVJKSsDrusdRWIML
         LSR1ZbqwhNThCNEkYDlRKhHI/qf1r0wh3DNVac//l5q5OlxkqOYvQr322N0cmGL5ebjt
         SyUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=vmTOSifjjzn+ev9UUy/Z7hj4re5QLG7t9UcBZqlfKus=;
        b=tAQGXC071XSAL66yx6gav9UhXu2mKjEz7F9ZXaye32NMR+s9bMd1+LFVl0X5x8w1vh
         mk5PUORTwdJy5DXxbe1hVr4YwovBz1S6vBWdwVcUdN6dWNEj5AcSPWBxlJOtTkG/Egv1
         7lUiSfLc8l/J8PXiTUiRHH1/lFpFhcYoS8jo2e7x4DwnnPecd+Xps4ZsTjHNxhtWB19w
         nypQcmv9B78r5TIV1i/BPCwN0GI5mjLW11AbOTB/AwYqNP5F0wqdXF/IbBY6DkxYZN0G
         3OJnR/iUn/UKFvNMh5Szuv2HKpkMTlkMqo2zvKTScCyljyybI1VSW/uFIW7kyoJVGxTa
         h03g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=OyTxwxQ5;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.80 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2080.outbound.protection.outlook.com. [40.107.8.80])
        by gmr-mx.google.com with ESMTPS id s4-20020a056512202400b004abdb5d1128si958666lfs.2.2023.01.01.23.44.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.80 as permitted sender) client-ip=40.107.8.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvyyvnIoqZ5lLk6+gGJZdJ7jAqDTaAh2jeiGnuUM/95hGYDmX7PpZzBtuLuED544SX1XlB9ku60d9IyKFnEftgflLSqT/y33TzKzE7F0LUN6IcKj+lKTLSBOuwt+4ZmbrJ2LGcEpOnOQKbBNDVx3bAa/52BVu2owitNA/Oe4vrwpnC8BeJMiz7BIzhy09LlfrjSnNOlkZxyEjCjqUCIQnjiwJdEmgv9agFUx3rpnN/H01Mzju99k25NwK4ouWHcI+WUcdqAyPa4bqfFBsgB6J/kh69anBxAyJYqXRU+OqaawdGXxapkcLBkUQMw/kvfQHJIURe12RvAcQcgl0h3Mzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmTOSifjjzn+ev9UUy/Z7hj4re5QLG7t9UcBZqlfKus=;
 b=VipN0ZjLcBNPu6/DHBbTPGVD9xw10EPbu+ZvRm2fGP2msCp3O9mJYAnqKZq8qlULxSSmjgEH2H6rMDcxHD6XhJbmwtBmoG1NVqaUA7KLI3WQm55O7eB5l0lyXMvKPEIcAVqF+wwpRl5kap7tml8BxwEvq88uJNI2Q/hxh5MVz54MlVgS9aMbHIeASc+fsiAuZeVDnYe5w7QO+pLYIPf4LahvW+IHVAm4fv+nBIwwzOIU0/Nq6a3l7GpQIpDjyYcdkeHcw9HZZdkyGxdCVJMxWl9bWP91Sr9gGq4nnAHVcgPB5iRmpjilb0Zsj9uXXrf+JHxz64wIziBRrGvrWA57FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB5425.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:336::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:44:49 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:44:49 +0000
Message-ID: <bfe33597-4b4d-196f-a86b-c4fe9cf0df08@siemens.com>
Date: Mon, 2 Jan 2023 08:44:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Running IVSHMEM-DEMO on BananaPi
Content-Language: en-US
To: Lukas Saintz <lukas.saintz.92@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <7668f20d-2718-4cfa-b7c7-6b17ac1f2c19n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <7668f20d-2718-4cfa-b7c7-6b17ac1f2c19n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: ff25f29e-e0d7-480c-f1be-08daec9539cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zg7d1mPPmibwTIHtrb7wCs6T3rlua6L40m5iHp+VRv5zxXsgJxshev2tDSF3wPXiihXVLXCN8nKKOOJZ7Tyj/FdmIYVRE9Iet8DrysHqJFGm/xya+3uNkwfcy5fvWpcnxsa7SoiqARho7YS3bK7hqSOBKr3pbPkYPuQMdGx+9x+6KCQpvPAKfPoDFCeco96xlKLZ37FlyDL6eRNdA4w6oBehTa6rA/A0BCLE8NwoiGoFoBC/P+9UMY+Rmpdn+LC1BZb1/RkdoyywgO213yyZ4nVvo4ApSfLII4mQF3rCBA8cwJZJGglkkBlq+qndPVnQfgKyeErf+0h1Sx6rAfH2VWacrDctTgBhRzshCDGV9he1l/Ct+TRyHCz1DrUrm+6If+M+cThIwcTmpwyyNk/QUqLcUR+B4e7eD0FnTkIkO2EcrBc3Jw8zyxZ0Vcm4L0Cfu6ltHLAZjW3wycoSvjqttCZp2I00Db1KfWpIBqBefA5Ns0hWNY6b32AgKYA+cb7PtFZMtIcMqFWuBbMKKXXPoAZ5a/xZ4rsV1Qz/PePHwzesUI3HJkSgChLfbtFwn9c97I84/6Qz9qD+NYDbGMEV58QPOY24Wt96G5rindVitWxXxZRaRCDfbm9t93EouhAUx3gf8EMjc9V1FETpV465DwDv+pUwA5JdzEHQxQ/YKoX9+DP5KFWkdBLXSq1b4DSmTspFeIcubLTyuFWPRFfSM/ZFBpdTzPB5NMCmF+MWxJy/sUr2lS+3nCMc5vM5HEu4hj3D3zTWBDaybCXMVAQ6dEb1tKa4RJzGGoU+9FHau2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(84040400005)(451199015)(83380400001)(6512007)(186003)(26005)(2616005)(53546011)(6666004)(6506007)(31696002)(86362001)(3480700007)(36756003)(38100700002)(82960400001)(8676002)(41300700001)(2906002)(5660300002)(8936002)(44832011)(31686004)(966005)(6486002)(478600001)(66556008)(66946007)(66476007)(316002)(110136005)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmhZeENwajV1M0l1RHJLZmNCUUp5RjJDSWx5ZHVsZVVZYmM3WUhsSWVacG9W?=
 =?utf-8?B?T29DZ3dGWnJTRGJ6U01ZNTVyczBWcFRMMmJnbE9Ralk5WUpnekcwWVdiN2tr?=
 =?utf-8?B?SHNSWkxvRGRpMFVYaFdJNGZldXVub3hYQkNMdTJYNGlXbVR1NmlGYXo0RURY?=
 =?utf-8?B?dDliNy8vKzVsN1hhdmRVNDVvWWczdmg0TG9wNnBWUnI4WkFqQkUwZ1hJK1dy?=
 =?utf-8?B?TnB1Y1dnYWtDNitMKytuNFQ5djNIY283M3ZldFBTMEhrMzZIbjUzQWl2enor?=
 =?utf-8?B?bHpqaExCUzZPMW9SSFFlV2p6THExYTNtYmdzb3BRZGhkclI4RWU5TkxmTHlo?=
 =?utf-8?B?RE9IM3ArUFlLaFNieFB3aktXZDhTOEpUckJpamhJREkrVllSdnpXdU00dnB2?=
 =?utf-8?B?OW9ZTzhTTThzYkRQN2NMSENzWFRVOWo5L3F2Y1lhUWFqaUpaZTdjajNISEho?=
 =?utf-8?B?TDZNRk9lVzZuckRqbkNUY0E3blhCdDNSTW1NVzlVZ29HNzBBdXBlTHkrWmU2?=
 =?utf-8?B?Q2xscmU0SWRhN2IxL3Q5RnVxSkswekVUOXZpV0V0bHl3V0lZU0RsandrMVNI?=
 =?utf-8?B?YWowcTJHaHBXcnp1NWczVTduNS9DdDQ2cStqTE5COFNmRGdlaHNUTzROeXdw?=
 =?utf-8?B?Mm9SdHhPcFhMZk9HOG8waWYzVFJrczVocVJURWtvbldveThobGR1bUdqYm9B?=
 =?utf-8?B?dWdtTWxTUnZTdkRKT2tZRVQrZ1Z1THE2MFdobzFKV1VFbzlWc2xDTW9xd1NQ?=
 =?utf-8?B?WC8vUEtwZmRiRXh6UUJYRldiaENVNW56SnB1c3d0N3ppRjQ1UlZqNjJ2bjVF?=
 =?utf-8?B?NWZUcVcvV1FJWE81U3VHeldJekIzNGhCdUdpMHoyYXpoeFd1SWwxd2xZditN?=
 =?utf-8?B?ZkdoYjFZdGhjbFhuanFSdytvZndjRmhDdjI1bVJNVm5ITDB2bGJCL3I4UlVK?=
 =?utf-8?B?MkFwQTFsUExrb3gwcm5WSUxpQ015L2ZBY1lmNzNZZTFsZjhvOG50djFNY2J3?=
 =?utf-8?B?eUM5SmNvUU0rV1g2aHM4WVg1a0Foc0hLaHRnay9DMzZ3OEcwdmE1N0JVcEFT?=
 =?utf-8?B?UkppWjRieWJyclJ5bDhIR3EyR0NWY0JWU2ZLRXYzcXNyNmFPM2NDNENxSTZP?=
 =?utf-8?B?aUExaDI2YnJxSnVMd3hwbXJScVN0TmpRSit0TWlSODlCNHg5b2E1Tjkwd3Nn?=
 =?utf-8?B?aytxZCtGVElXZlFNdjNIbmVRODROUXBTbkl5WUxvR1RBeEp3YzczWkxkUFA0?=
 =?utf-8?B?Z2JTWWVYd3RCbkVJR2dNNjBnREFpM1o0a09OSkRrUTY0Q040dzhHTmd5ckNB?=
 =?utf-8?B?ZGcwZGk2c04wVXNGWEZiQnVLeisvb2ZDNXhTQndhcUVDK2lZWG04VFVNUGdQ?=
 =?utf-8?B?a21rUnMzV2Uyc3FMVVM5aS9UbjBma2VPT0VuVkx1dGh1UnpPR2VIV09pRE1N?=
 =?utf-8?B?a0V0UVkySSt3bmRKemNZL1VBc0tFaklRbWhnMDlsTHlMSnU0cEw2dEdmVVgx?=
 =?utf-8?B?cm9wNXlkaWlrVm5XUnc3ZkdMNjZBVUtpSC91ZVQ5RjczZEFOcm5FVVRzSlUx?=
 =?utf-8?B?OHlMUVlSc1RjM2Zza1BONVRHKzNrVVpkZTdkTVhwUndZdXpFU1VBRHRpWURB?=
 =?utf-8?B?c1ZQbnAydEdmWHE2UzEzazU4L2RBY2VLQWFpMVJaN2JtZmQxWVd0d290cVVU?=
 =?utf-8?B?SmRTTUVsdWdhQ2gxOTg1ZWcxN25wWmlOM1I3SVpsWUlMdGN1UFZ1c21CbXVR?=
 =?utf-8?B?Nklrdm9LSmhQVXJhUVJpcHdrWjg1R2ZtbHJLTDRobzIrVHVFY1ZUZ1YrVGpl?=
 =?utf-8?B?cDQ0WlNuUG85OEZvdUluR2YzMzFlSFNkcEpkNTdMRjBVT1VSb1VUU3pXU2Fo?=
 =?utf-8?B?cnNrczdtNXNUZkNSdFpsVy90NE1CSmJsOStobUlFUnhHY2RQem9KWS9DcEx0?=
 =?utf-8?B?VTJoK3d0b050ZlcyVTBDYXl4NzlkdjlLRXRuaWdoa1FQd3o2eGIzU3BLK3Vo?=
 =?utf-8?B?dkxsb1RoNHZnRWc5dUhIZXZmYi9PTG9rNGZ2OFB3TTl2T3hIK0Q1bFRqK08x?=
 =?utf-8?B?TWZBN2VhTlRXRjIzSk9MUm1OaWV1UjFqdm1FenpIektzTVJDNm9HckUvQlpp?=
 =?utf-8?B?RDdPVnNLT3RqREV0UFc5M3JyVkNLY0FvY2FpWjlwNUJVWWVEa2k4cXY5alBi?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff25f29e-e0d7-480c-f1be-08daec9539cf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:44:49.2432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3Gf8kR6XxOt18qstQqlb6XxInt7RcwHw6OmKnZlGFnz1A89vKy0akgbUNHuyL5sge7RGaHuK5CSbr8JX+0VRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5425
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=OyTxwxQ5;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.8.80 as permitted sender)
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

On 19.10.22 23:21, Lukas Saintz wrote:
> Hi Jan,
> I'm studying Jailhouse Hypervisor and its implementation on a BananPi=C2=
=A0
> M1 Board.
> Following your guide I've successfully compiled and executed both
> Bananapi.cell and FreeRTOS-demo.cell.
> Now I want to study IVSHEMEM and how the two cells can properly communica=
te.
> The only think that I can find is a ivshemem-demo.c with pci device that
> unfortunately when I do the commands "jailhouse cell load FreeRTOS
> /jailhouse/inmates/demos/arm/ivshmem-dem.bin " and "jailhouse cell start
> FreeRTOS" results in a fail of the FreeRTOS cell.
> I can't find good documentations on how to use and implement a correct
> communication for my configuration.
>=20
> Can you help me?=C2=A0

The BananaPi is a very old board by now, and it is not pre-integrated by
jailhouse-images. For starting off, I would recommend a board that we
have in scope with https://github.com/siemens/jailhouse-images (which
may still have some build issues for a few more days, stay tuned for
updates).

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
jailhouse-dev/bfe33597-4b4d-196f-a86b-c4fe9cf0df08%40siemens.com.
