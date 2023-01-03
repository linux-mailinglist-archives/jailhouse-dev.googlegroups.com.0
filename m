Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQXJ2GOQMGQES5YLA5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48465C64C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Jan 2023 19:32:36 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id y19-20020a05651c221300b00279958f353fsf7208910ljq.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Jan 2023 10:32:36 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672770755; cv=pass;
        d=google.com; s=arc-20160816;
        b=frtK+zEMIUiwoBSyIis6Zg/3PPm8hwEV1AuJ5l3nfLhTGD2MD+X7OIM+vs2zSO8oSO
         EypGVshYfxIvGkGNBaWq0ioJtDIrIqfzaAEnDvnuCLkg1D4DroHC44HNGx0Z2ZId0uQC
         lc+obmbUV4eQDopNHMADaXYBHFg+PNwIoFjZntrr3Swf/k/lhryY1JAjBN3L1H8modS2
         5zPvnZ0GcpzyCf18qhD+UWMEzCT0HGQLMTOCQbbTMcdtKaR1BLxQm0scmgSd+akmt1jr
         IqZlIVBnenevbc3+TbPemwOckzy9iQDUHQG29w/+GH5aYz46+nkIkLMase7ZtstE+C7n
         YNCw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:to:content-language:subject:user-agent:date:message-id
         :sender:dkim-signature;
        bh=RdAUlg/oWyyO8X9g2dVy3JoUs2aM23NHfmwayln2sdU=;
        b=Fy00YrHSlZ7JON5Sov2uf0k3awqSbmsRTSa8b/UMJ+jc7UjdcuodPDrbiAG/VO9mMy
         ryXzxdTgQOtIoi1jtk4UXrOtdLHkCAV2Ziho5xhNK80GDGKrL/xNK28j/IY1+wK79yJH
         JL85OatY5kzhiOSp+8/tKx70/0cvzHp/yHT3iQMy8vJ9MOuQst/b6nZrs53fETHHE9/1
         8j/nbnYZL86LHhDsEtUyN2Unw7Djk6pxp3xcNTtY3eOh7ld4Gu8GMqdv+Nrg3j5b4Rhn
         Uw2EC+vTZFcTxU0iQSASACyrj7t8aSlyPyGPvNNlNsgg5QjwlvGpS2gLebiikDBMtts1
         Ro9Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=fGwGlb1u;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RdAUlg/oWyyO8X9g2dVy3JoUs2aM23NHfmwayln2sdU=;
        b=YHzNTaMHq2/m77mFSnV7nHFJR2nOFojBv+IgUiTCMe/oEZt8lRUWZaalZ8a7bN6Fvb
         y1m9sceov+1yjed60U9fZozKjJ2twSithxbQvCjwBH73fWdyIv+0aGflCTUOaC/vbp9C
         mcWLQ5o/04MdzgkzJx3cKO2jdL72zeuz+/64BMxdScYW1Td02G4b9gWcusQqnthxlLvj
         lkm6jeluoUMD36xZCZ0OpIOy2A/1NvPw3KTrkAUYNs7noCz+6pBI0yUa9pgOnCx9QCsX
         lXD/DL3vI/9gM72LMpcIRms2pyrJIa6mKI8X9aKej34S9TqPYHW+hj8S47TVb/zh0L85
         j3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdAUlg/oWyyO8X9g2dVy3JoUs2aM23NHfmwayln2sdU=;
        b=HqSn5eb3BKrbPm0tn9fgLVQQcAWHp02attKK2+HZdao4WnPT6G2gKvwD6y5/v3rfP5
         jFm5dlKMx23zofXgRdJKWPE2qFWd7VsWOOsU7kMdIjyDwD4YQFhF3J6K38H5s8ca3vM5
         ZT7PR2AcGgC1IdpS9xGse6M6EMnloVCxedhrNDJjy3S73MY87aNIKllcZ+YFJWoYoYDk
         kUb5tWPB3rGN3PLnr/cP9FiQdIrhqQPXtZQAi2vYCjV2gUs5eYkuPvz6OtEIYZ8p8vjO
         J5VoD1BB/cjXYb9fYiqGIfVMSF2+62Na4O7Wu8cWiMwdrT2gghZwEzSYbSRQMDwdnO8y
         U1lg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kotRaQxJotuk7f9W9tx4VA8Q21wvtgH12SAQSx1eoAAnjI2dBBv
	1Of6ROR9d7D6CBMwqCT1OLc=
X-Google-Smtp-Source: AMrXdXuTSacnehcGxGtOviQqH29TgVw/X9f6nOb+VZTWpGk42Ne8ul/XMSYUjt4xKN9sCNVqwaJa6A==
X-Received: by 2002:a2e:140b:0:b0:27f:b4ab:f32e with SMTP id u11-20020a2e140b000000b0027fb4abf32emr1550369ljd.269.1672770755581;
        Tue, 03 Jan 2023 10:32:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1182:b0:4b5:3cdf:5a65 with SMTP id
 g2-20020a056512118200b004b53cdf5a65ls1805980lfr.2.-pod-prod-gmail; Tue, 03
 Jan 2023 10:32:33 -0800 (PST)
X-Received: by 2002:a05:6512:25e:b0:4a4:68b9:1a10 with SMTP id b30-20020a056512025e00b004a468b91a10mr11721767lfo.56.1672770753806;
        Tue, 03 Jan 2023 10:32:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672770753; cv=pass;
        d=google.com; s=arc-20160816;
        b=sGsxNCP6jls9uYQcEfvfcyVPhBpLBOiKFU6KDn3kvsG3QZ0AeRgrphfpYAQoqbUvjC
         m5l75b6tJ89rdu1UBj4CVhtIhM+gqzMLnuiuvIAccwk0wciR8jPUwH1FgCS+v9ZX8GAX
         Kx6EakEvS1O7QLRJl8O1WTE2TMok2y1zxQlRS3qPMx4uz2jnwQdpVgRT0/j3nPg3AouU
         2fQBZNYefXhyUw5PX7xmEiw0HxW7S76JxESaIP0kvv6rc8kCIO9NHAkDxA9jwu3Fsa/q
         MbCYtTWFIDRxyqXP2LO/IVKNsecx3dCfJJK7lVuwMD9xrUonuQylLFHysdfRe1DE/6PY
         l7oA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=cHYYLZOuyxfELBO6v0DaXi1YKe751AjeqvyHqYKqNs8=;
        b=TikcxATU2svQ3dXObeavGZc43Xbfu6am+MK1KuynBgpTS8oCyA/aGWZZam6HL+kI94
         OIVnRpynnr4kK9qHVK839/Um3n1pBwYyqiFFUdgQ/Ib2scbzdgM2G84mPgWEiK+VXY1R
         D/C1F+TJG53QPugkq9PBr1H1ElagCXXDgEsjHOHJBNdtSThiRlTTkVFKnQXDiKkBXd6K
         mON9EvKzowqHmzWf222uxk+5uYLjTS4PcmfgWHiU6lzG6NzBjUgO0CXqK9cd+3qH00zL
         JCQh89TNrEWWi3/QKpnOpQBsxv9wSOmTLdjN1Rc1zZhDxkgJ5JS+50R9pTYde6ZbD8g7
         CGbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=fGwGlb1u;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com. [40.107.105.58])
        by gmr-mx.google.com with ESMTPS id t5-20020a056512208500b00492ce810d43si1105611lfr.10.2023.01.03.10.32.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Jan 2023 10:32:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.105.58 as permitted sender) client-ip=40.107.105.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3S9WPI5ieSgH/VlEh4IdjY80Bl0yAdMwYlc4+tstJT0XYOQq6tzcgGlsZTnCltEdLweusR5B8M3JNiyqY5MescaxJXy0oamViPPwmMso6OVG4oGOcxfRr4NhECjMNtxcEFkS6Jn3+AsZMfwH62lJ/82cS1tQLLNVvYpKNF1pqCYplDLSKkmcHAI52l3DZIMgA26Ad0omCadfzLkWRaLCK2B89uPFpB8Pym+9iV490e742aZn7EIIvLhpliV5upYeTjk6atoSfeL5QBp7IoE7RefkijosgdMqpnryzAMs46CFCU5BKaIVuvKRsYAcDb/A6Jl3Mcceko8GQPQJauLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHYYLZOuyxfELBO6v0DaXi1YKe751AjeqvyHqYKqNs8=;
 b=lyvveEL4fbxrV/bqcTmjlwNseBu1BznIyWh9vkUElGDcwWfqjlvhea+f6mnfOPn5rZHIgUn1qLwmDiMOfPMwy9SvB9319Ng5AJPZRr5geRNVSS+2ZdEP4lEbLW04OsEXnJdUs0RkanZ+R525lQzmrlG61YzXJfH5B9Vw+t31298Y8BKh+J7g94EzWVlealXya/kn2mTMUw/n5ZseQT6Mxec1hWzTfR/Ksixc1VBotgUs6baiaHxHiNtocbjOXxnoQot1W4xxaucUXOs6Xe/BCd0Jh5JBQtPgZaL/PFtwid/0tb22ZTa1ZbGTIyyfm58Usk/aByf6p26HYlOqQpFH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PR3PR10MB4016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 18:32:32 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:32:32 +0000
Message-ID: <5786bf3d-f0f2-48d3-609e-a9fdc68de40f@siemens.com>
Date: Tue, 3 Jan 2023 19:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Question: ivshmem-net
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DU0PR04MB9417606E9DA7F4D450E98990880A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <b8ff927b-a86e-9c92-e834-a8cdd790a679@siemens.com>
 <DU0PR04MB941785140D4F2A6620C2AF4888F49@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <DU0PR04MB941785140D4F2A6620C2AF4888F49@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PR3PR10MB4016:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df4bec5-b71d-4e6c-5fcd-08daedb8e08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WcpplAfj5v2nLnuMZQXoxv2/tn8JG1nESBxq8wOn5xYiL3AwOPmJwxT6USmzJeGrT14OICXuyaPakCh2HVH7sEgI1hT5XCzQEYsmaaEqG54xYeuKeryuqf85eQGY3iuUESuCtavq6a5aZhnRlZe3c8ew/Hjd8PJmHISBf6jcdUvTvzsLHporqu+HByH5s1wmKQVFnEkORFAUPP4SIgXexBvb0KpPwUKk88Yz7iN0jGnWuZKYGuzmKKGNf9mk8WHSin2cqEVW8r33smZemfwqBGG3RbiXyRhCh47vX9QBqYgtAX6oNdgUN5QBlTRyMSZac8eGgjGGhKD6B2XErREYZHC8TBkdpCmXfaScCXP+7YD0TKiiWjpZovWJ38SW8wcUQifoiM3wRIloizIhntSFZfwJR+RWKkFlXubMrWSOQ8t8NT7xN4D4KblGKPQIf80gmSqNqBSS8a4S9LrQVfnJvULgk02fbS7/y2TKOPfHQvPOoX5je3tulvh3UM/IkqNNKNbpB8UVvlL+WddIiaoVvi/bvc6/hS0bH6dsqbod23QFPcP6v6YDeB68efiqSoIZ02tIDwR4t4O5jifFeKkULPdT29Zs3fWzICjwEfs4Ywc0oyeryY3NLOzy7fKVPx1BlJldqxDKYGEniwVkzeYcep0lh4XnN4f3nHZlkihfq4pHhPX/XcCusc/c1PB4nkaAeqPWAo2hHnTlilaZ2NZxa81xxfIgsRab+qzGIhayefZtvOtOPRzGIq1QuhnSYpEe00AcKfKQtEW0gA8B3gAs3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199015)(5660300002)(2906002)(44832011)(8936002)(8676002)(41300700001)(478600001)(316002)(66476007)(66946007)(110136005)(66556008)(966005)(6486002)(31686004)(53546011)(26005)(6512007)(6506007)(83380400001)(82960400001)(186003)(38100700002)(2616005)(31696002)(86362001)(36756003)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdXV3BQbEpTV0JMb0dNajhSTlhPNFFrYjdHNkxFS0Y0bkJPVE05TVQvbnVp?=
 =?utf-8?B?WWlUREtRZXp2Q3lCUGhOQi9iNDJ0bVpaaEpuMUxpU1Nod05wL0JvS1J0bUV0?=
 =?utf-8?B?VHNHU1NLTGxOZEJpUXpJR2V3a09vNE1FVGxQMEw2QjRkY1gzc0IwbGlIdmQx?=
 =?utf-8?B?Yy90dG1POWorclhhcDFaZ3RySUc5SWg5MHFacG44Zm9NYnpmYWFRUkJZRGpL?=
 =?utf-8?B?Z3NDL1R2cHZSazZXNjRLNDZKeTMxdU5US25saWpnR2E4QnhncnBpSkFzYzNm?=
 =?utf-8?B?RWNXZXdqdTkvajFKRVlmdXlkT1lGYXV6aklLUUhGTG5YTVFCcGdzVXdwL0VJ?=
 =?utf-8?B?bWxKVGxMWmdWMDV0bG5mdFF1OW56emF2M3RqazluWUFVaXl0L09XQmZobUNL?=
 =?utf-8?B?UEY5cDl5dkltSWhzTllhNUJZYVRYSGlaMHpyam8xTGo2ZEcvTHFlL3lSeHA3?=
 =?utf-8?B?VWtTZGhlQklRQW5XaklHTFVscGtKWmpqbzROK1hVcyt5Y3RiUnJCZXAvSzNT?=
 =?utf-8?B?MldId0ZlWGFMaEVoeVRJbnpaaU5sdEtObDA1ajRWcnd4bGloR2Y1WCsrS2g2?=
 =?utf-8?B?OHR0a3hQMnFrOXhNUWRSeEdWcHlSaHlhNDdrOVp2aW5VWFdiVzJNSEdwSHJC?=
 =?utf-8?B?bTRjdjVSNmMxU1Zmd3hBSzd3ZHhmZkd6aEQ1UnIrWThPT082RFo3SUFiWDZC?=
 =?utf-8?B?SmZHZlB2ZGdpUEw3b2tNWVExWFlYaTBkN1JEVnF4MExBSlBTdUhFaXJwNHdx?=
 =?utf-8?B?TE50azI2RCtCZDJOZ29HaHE2WFNXSUJ4L3Bjb0xsMlZkRU9WdDB3RGVCWW01?=
 =?utf-8?B?cEJnMXlzTXkvVEg0UzBxWnFiUmhJVXVhQVNxNDI2c0JvQ3ArUUxveGJHMnpv?=
 =?utf-8?B?dFhtMS9GRTlHck1rQmhLV1VaMkhIbGtZRW53MDVuU25rS3JEZ2JhUCtwRnYw?=
 =?utf-8?B?TFVaKythQ2kyL2VybmVxeDFRUmlDUEVHN2s5LzN5cE1yU284dldpTWlUS3Zl?=
 =?utf-8?B?ZGhkTC9rKzZ4Rkk5aFhFeUUrMUNLeE1tRzkzc01OenBUSzdqS0dFaGtwRzF3?=
 =?utf-8?B?MEtQNkdna3ZMQjc0S3hkRC8yaUxmUFdZeUg0emVTYkhqWFhoa1R0NjYxL2FN?=
 =?utf-8?B?U0dWWjlnSzRmSXl2SFR0WFdqVlFya0w0ckhwYnBiUldtQnRYZHN6RnVQdVpD?=
 =?utf-8?B?SmNsSVMvUU40WXBvQkkwWG1vOGkyRFdmNUlsaTJpMHNRa2lUejZlMDMwbW05?=
 =?utf-8?B?Y1RVMTNuUXdTVUtmMGlxNzJKS1lyd1VRdWhlL29UbldWYkIxM2poUjNUL0lD?=
 =?utf-8?B?cVlDL1dYLzAwTmx6MTFRNVgxSTVpRTlqRElGY09oU2RwYmZZenNPVTdCZDgx?=
 =?utf-8?B?WG5xT1d0Ni9CKzY1SkVua01zcGZCUkZ0cEk2QkJnS3Iwclk4QXhLenU2a01K?=
 =?utf-8?B?Nlh6TktzUWJXbmxzOElwbXhhWW1OZmpjSU1iV1M5cTMrSmNJczZibXV3VC96?=
 =?utf-8?B?NCtkS1lDTWV1NTdlWndXRnJvZ0cxUEZYTzlNUEw5K3d5V3dybWpJODdtYzhD?=
 =?utf-8?B?dlBzZks1aTV6SHU1b1ViZDlVSEVFK043ZkpTT1FLZk5rd2VsY0ZZNURZYStu?=
 =?utf-8?B?TW5wOWVzdEtOTXVPM1h2N0pEdy9ZZTFweHBjZVlMNDJ4cEU0Tm5QUjBsQVRu?=
 =?utf-8?B?c0Npckh5V2RPWWVmMnRnM055NlZ1TjdNU3BGb3FCQW5vcXNFajg2UFpzSE9v?=
 =?utf-8?B?d2NZZ0x1QUtjY0dHYXVIRDdEU21qZklTS0VPbVFoK3hiQzdSaDVrTUNWRUNr?=
 =?utf-8?B?TURKVThnQjBoWkdBRGdVWnpxNWtJMVl1cVlmQ2ZlY254RER0cHZxTkxEeXdK?=
 =?utf-8?B?VmErd285cG52NGoveTgvR1lvUWJBOFhpWHFsZjNzUTBTbmVDOWUxMi9ZaEs0?=
 =?utf-8?B?TWFySnVyczJIMVB1b0VoN01ZWHBaWWpCRG84a3ZXbWd0RFFVMXUycDNxMkd4?=
 =?utf-8?B?WFYreExuZVRLN1Mwc1FjaWI5SHlWZzRQQW84UnF0ZkJSc0Q4OWRacjJpTkc1?=
 =?utf-8?B?UTVSemM3SlVQOWdPVnpUcFhDY0pvd2t4d3ErcVZ5T05iaXFNTWducXVhbDBp?=
 =?utf-8?B?OFlFVHBJckd0OHdLTWtlM1JjY2FDQnJHdTNUZnJJdjFyYnc2UkxpSlVuMEUx?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df4bec5-b71d-4e6c-5fcd-08daedb8e08f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 18:32:32.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsTGS7m0KAFobMKW3g8P0161tl1hxatngDOhJHMNv4BH5k8m8wKEiHvwrLqCvkhExujhDSo2j73083rUEWcesg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4016
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=fGwGlb1u;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.105.58 as permitted sender)
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

On 03.01.23 01:57, Peng Fan wrote:
>> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
>> Subject: Re: Question: ivshmem-net
>>
>> On 21.11.22 07:47, Peng Fan wrote:
>>> Hi,
>>>
>>> I have a question regarding ivshmem-net, not sure whether we need to
>> use local_bh_disable/enable to guard napi_schedule.
>>>
>>> See below patch:
>>>
>> https://patc
>>> hes.linaro.org%2Fproject%2Flinux-
>> usb%2Fpatch%2F877dk162mo.ffs%40nanos.
>>>
>> tec.linutronix.de%2F&data=05%7C01%7Cpeng.fan%40nxp.com%7C10674af
>> e061c4
>>>
>> fbdd5cd08daec94e54a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C63808
>>>
>> 2421486787248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
>> CJQIjoiV2lu
>>>
>> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=nxYB
>> 9%2BjoTRb
>>> hTF7GGaa32nmr7hU7zCk2fEOL5ZbbL34%3D&reserved=0
>>> "
>>> The driver invokes napi_schedule() in several places from task
>>> context. napi_schedule() raises the NET_RX softirq bit and relies on
>>> the calling context to ensure that the softirq is handled. That's
>>> usually on return from interrupt or on the outermost local_bh_enable().
>>>
>>> But that's not the case here which causes the soft interrupt handling
>>> to be delayed to the next interrupt or local_bh_enable(). If the task
>>> in which context this is invoked is the last runnable task on a CPU
>>> and the CPU goes idle before an interrupt arrives or a
>>> local_bh_disable/enable() pair handles the pending soft interrupt then
>>> the NOHZ idle code emits the following warning.
>>>
>>>   NOHZ tick-stop error: Non-RCU local softirq work is pending, handler
>> #08!!!
>>>
>>> Prevent this by wrapping the napi_schedule() invocation from task
>>> context into a local_bh_disable/enable() pair.
>>> "
>>>
>> https://lore
>>> .kernel.org%2Fall%2F87y28b9nyn.ffs%40tglx%2Ft%2F&data=05%7C01%7C
>> peng.f
>>>
>> an%40nxp.com%7C10674afe061c4fbdd5cd08daec94e54a%7C686ea1d3bc2b
>> 4c6fa92c
>>>
>> d99c5c301635%7C0%7C0%7C638082421486787248%7CUnknown%7CTWFp
>> bGZsb3d8eyJW
>>>
>> IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
>> C3000%
>>>
>> 7C%7C%7C&sdata=g%2FR48KwZCOVGt6momplzAv5VwmWpykE6c0e29pCpv
>> 9k%3D&reserv
>>> ed=0
>>>
>>> I draft one:
>>> diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
>>> index 3bcd39b91176e..81e19d80bd0a7 100644
>>> --- a/drivers/net/ivshmem-net.c
>>> +++ b/drivers/net/ivshmem-net.c
>>> @@ -558,7 +558,9 @@ static void ivshm_net_run(struct net_device *ndev)
>>>
>>>         netif_start_queue(ndev);
>>>         napi_enable(&in->napi);
>>> +       local_bh_disable();
>>>         napi_schedule(&in->napi);
>>> +       local_bh_enable();
>>>         ivshm_net_set_state(in, IVSHM_NET_STATE_RUN);  }
>>>
>>> There are other places calling napi_schedule, but seems no need
>> local_bh_disable/enable to protect.
>>>
>>> Not sure the upper change is valid or not, please help check.
>>>
>>
>> Looks suspicious, indeed. I wonder why there are not runtime checks in
>> napi_schedule to detect its needs and report a wrong bh state.
>>
>> Does this issue only trigger with NOHZ enabled?
> [Peng Fan] 
> 
> I not tested other configurations, but I think so from various
> lkml thread reading.
> 

Ok, makes sense. And Peter even wrote a detection patch as it seems.

Would you write a proper patch from your change, maybe also explaining
why the other spots do not need this? Then I could merge it into
queues/jailhouse where we track the driver history (it's usually folded
in stable jailhouse-enabling branches).

Thanks,
Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5786bf3d-f0f2-48d3-609e-a9fdc68de40f%40siemens.com.
