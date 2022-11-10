Return-Path: <jailhouse-dev+bncBD52BTEZ4YLBBLVDWWNQMGQELVKX5LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x137.google.com (mail-il1-x137.google.com [IPv6:2607:f8b0:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D68624AB4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 20:32:00 +0100 (CET)
Received: by mail-il1-x137.google.com with SMTP id z19-20020a056e02089300b002fffe186ac4sf2286223ils.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 11:32:00 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668108719; cv=pass;
        d=google.com; s=arc-20160816;
        b=kBoq/5PpgaYylYk3JVkdQ4sGCxrCwDzsCSirE4GZYc4Yp6VJIK5N/vpr2yfNJOU9V6
         bEnWY4wuWTHK1pqVGfZgIT0WYH0rFoGBMJk5mRjgtJBf/UcMQhqyQQwLFHZiHNOJwK3Z
         KVOiO+g+uC5JrgRNSJHXtEFMIpO0t8zES4tJOgmq7QtGtBPOk8oMFaOKIKhQJbMwk2AQ
         ZxVbqm1nLtYg9XrZmy5PeZwpBmy4VzGg8347Dss7+p9k2Hl5lXI/xN2paJtnXbH444aR
         1Hjy2UbMIRh7JBCS7K9nxIeIqZ/YFdGLU0DHm9Xc1dYPKL8HoY75xj7O7mPrkIiPZSXS
         sabQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=FoJson2vjTBrORq96TZMCbLrd+0QnmPm4l6fu8NeHNE=;
        b=NruU1QSxoNaXZzQoQkxmtmOxVrhsHd3+8G5tReunoTf0C3uWnJ4idfKQ11EdqKOKFs
         1CkijWYNqWZurYfjxecA43x4aKSUTqGD8wLlQt2IwmOWf4MP34WyeefgkHrGGsAh/MOm
         OL6IptDUkwyE5YK0ZwWVMOOw5airdpKRFMqQGegkDPPitTnv6q5fEdhv+tFStpC9ENk+
         XIaNlkIMGQnALZ9/uuHlXc8vtELYtX/v+YSyhQ0OvdbsqH2A+Un6VlHyjDGCg8Zmlym2
         cn0JEXjkvfe8raMDDGefohXaEsLyMNcCNwoRDGwIvyIw6clRGcHrf4JnWygU9FeplndD
         Bmrg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=T0Lw7Kb8;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=qJfO5IdO;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FoJson2vjTBrORq96TZMCbLrd+0QnmPm4l6fu8NeHNE=;
        b=GJqvA4aGim6kDartYO3F+oEe/SbORXAw+pHLSk5uP3XGBIozthainVkapE2CjZjqPZ
         xNS3oM+y8IvNjMxtjoX98VL7hCbwgoECOQwXVp2QL72ECDmgZEyC6XHAzTWcmrExnjk7
         RUjCdH2CJ4LrnFtYTc7IbkKlaBHJ5wX+75QXfGGQFO+sGmKWmXdbmBEHt8gxtTq9+pWc
         JkypFdjErC1KOr5k+NTczVhC/AAGUUpAzgKARFs6BW/uUsofsJacztoE4rh4be+Xsg+k
         4nYlOGKo6LTprEVa1QDRJpmPx6c2MTsVPJ2IqPEvxX568pehOhkK1aL9F3C9cNUT0GEp
         rsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoJson2vjTBrORq96TZMCbLrd+0QnmPm4l6fu8NeHNE=;
        b=ytcqK25s1s0ApdiTDrDMUHcVunoaByu5i6JcEy4k9IazahiTcslu++t0z6t5W+veec
         IxuqbfX7KLahdzxpJ9Z69vAwrqcy7SE98lTy87TTHzBreYKTr08s93KiZuQ8REvWkPQV
         uvHniDwPoTD52QcuRKQxvr09FUXxHP9rsayXMdgfUxVThbAgvGxdAOuRRqAF87IqaXiq
         MUAaOBPvlKrGnLWHfbJmdbChTyEevm/XMpFGim9YKCNbGjAnzTz516MN0kX3D74Ji/tJ
         GYyUDJp99lsjUd7icIewnlB15D612h8Mxw+AA/dWNGP+MbJkJDwdjOIJrzmS606q1iqz
         bdqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2Lzwyz3UWyDh+h4iaWVe/p6b9X6rkvulxHFoyo4KdyTTAJz5jX
	fBDBEvqPyFG4otHZWezTnSE=
X-Google-Smtp-Source: AMsMyM5jDs5AHGiiUkpe/AwT/riG2mS4pMqx9lHPCzfgCqRLsMQtb1wgvF7BZnrMVL5u07Wpy/3aCg==
X-Received: by 2002:a5e:d80e:0:b0:6bd:2e10:82b9 with SMTP id l14-20020a5ed80e000000b006bd2e1082b9mr3307575iok.135.1668108719134;
        Thu, 10 Nov 2022 11:31:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:1091:b0:300:ea3b:734a with SMTP id
 r17-20020a056e02109100b00300ea3b734als595135ilj.11.-pod-prod-gmail; Thu, 10
 Nov 2022 11:31:58 -0800 (PST)
X-Received: by 2002:a05:6e02:1c88:b0:300:2109:2bec with SMTP id w8-20020a056e021c8800b0030021092becmr3565817ill.35.1668108718286;
        Thu, 10 Nov 2022 11:31:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668108718; cv=pass;
        d=google.com; s=arc-20160816;
        b=fsVRoGaguzyxj3MZQCatokThoIroLWr3P85Tg4uO29y310DtlB0EXCVeZ+VNH0gbTF
         xDCZOLTAKjoDRia+YuV+9QfYZ1VSd5Y+M6yPk6JZXdClKy3t+bwPAATn7iZso+F9SSlu
         Bp2fd72e287JYv5N4EIWmnUntUO7fV7oT7n5SN1TNLvQmXTrRlbDggJPS2gy42jFj/SX
         odGkU+QAeuk6Ngw0pzAKo6ulM9X6qsiwfZ21t5SY4u1GK7Ihifh8NQ1qPXbI/h37q4GB
         g2u5Y+IzlANUT9WTgg5YgedD8JEhuhkBQlqRiWoiYgQ8Xp1kwOKkClDq0nKZJZpFGiJ1
         hx1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature:dkim-signature;
        bh=/sM/RPyc7Kd7E67aKBnYNlDIEac+lgJDXcu0AB5D5GA=;
        b=Txec3upTmlaVO/n2i0vF2qxJkal7pytpfgv6hu4zI89G4IsmP/YFniDUyzWj3oxpB9
         sgsUDTdipqAhBZwkJ1yHLbmDpTN5M5aNXQY2elpAGv3SkEVKsxRROfzr66Gt4aCyOC6k
         rzjyi70i2d+39uyOmHdU622cnPtmY7XM767Ac/FlSqfRgMi/fbO65CsbsJ8lFO2FfQY9
         JjYw+N3ySo2NrRQicBe2NKs9ELqyNj2uMOJpBNhgFnXQZS89koDDNC5/tHUG0OJl0oSi
         3PXA1UWcMweb51uFpbthOHp0OrvWi1Dcud8HIVEjm4cip9C1IRH0w6XTEJ8rHj9N70yR
         eZKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=T0Lw7Kb8;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=qJfO5IdO;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com. [205.220.177.32])
        by gmr-mx.google.com with ESMTPS id h15-20020a02c4cf000000b003636f49184dsi18836jaj.7.2022.11.10.11.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2022 11:31:58 -0800 (PST)
Received-SPF: pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) client-ip=205.220.177.32;
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAJSNOj005810;
	Thu, 10 Nov 2022 19:31:53 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ks7g5g0hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 19:31:53 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAJBg9q023083;
	Thu, 10 Nov 2022 19:31:52 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kpcysaqgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 19:31:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTWqO1T0XTQ1DiTZ4DytNiqkkRwlYZw9rbw6IeQpUfuQ+6J8L3/NqUkd9CTDbfx4TnZePYh2jfmIbba+O9w9cCldlJRIFNZAcXqyleOnlqINzdelZBW/gqaMSN/rDRt5CYdH1MvsTPyvd31vu3JM6VFU6uQyViwO9/waQ+6rOJvI0tSkNCRpzBj7LNb1q4Ht3irEOJ5klqW6CrJEyfPxwwLV76b6g4GhkYlt0AotQm00CRFf3de5eN6BrdpH9V6u5OIbO6svsFISeU7IU7mDFcMsmsdYxldw25aoZAIm2O/mvTGMWmLHjhzs4ebbz9G8R7GyZzSTnEB53kb4tRXI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sM/RPyc7Kd7E67aKBnYNlDIEac+lgJDXcu0AB5D5GA=;
 b=WAN3PBHBzpFlRLkNzQZUiRyisBB/X0tf2DD80KNTJRdKSHwBI7BqKpocBOm2SEXOFJEspleVQDizLHPbv/Chv/Deo51vJOoFI8QvY4lAfMaLoiHmujIKFHb1atbcOtf1rHfVVQd5jq61zEI5h3u2pUH4ZeGqqXZXsS6bloAGWX/K4Gw+nM/9EIsT4yFw1npf3PDwQhgVdPqH6jj9maHhszQgy36M0T0wBAysONjOqD/03qWIc2EJIsIQYDkeCkYMs+w4lucfHXOiqvc3IjfLJUfRP64yScEH87RYud4yM7DJ7TIuD8wzTBdUdpg5i+oJfQWIc+JRMKFAOcgdmqZKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by PH0PR10MB4472.namprd10.prod.outlook.com (2603:10b6:510:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 19:31:50 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a%4]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 19:31:50 +0000
Message-ID: <cd5aabe0-94a6-3832-9e3e-b308b134d7e8@oracle.com>
Date: Thu, 10 Nov 2022 14:31:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] x86: Check return values from early_ioremap calls
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, dpsmith@apertussolutions.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        luto@amacapital.net, dave.hansen@linux.intel.com,
        kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
        jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com,
        xen-devel@lists.xenproject.org, jgross@suse.com,
        boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-3-ross.philipson@oracle.com>
 <Y2090DOT3q5CX9kV@hirez.programming.kicks-ass.net>
From: Ross Philipson <ross.philipson@oracle.com>
In-Reply-To: <Y2090DOT3q5CX9kV@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-ClientProxiedBy: BN9PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:408:fe::23) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3793:EE_|PH0PR10MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6d970b-9383-4304-e85e-08dac35236fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5xeQVpHd6ABx8NRdxFVoeMFSxcG7T9+az6eteS4tXQktYBZd0TwgHUsZS8tUtPoPouNHzUIdgcAbGvrIK31SFKXcEAgOuQXSvNoSU5IyDMgIfkvhVr9+dABTN6oBJLFolFHLMJZh4BHlNSptzMrDKjws3YFFREObZNEkCz6/XjTPR635vZCha5DaFmZKZGYEEVLuTQA7Z34v7AlbUho/jzJKXViUw5xKiQ/noEwfU/JqXImRr2oS7tWEQwl+/r5x0tBjZJ195a/Q5UcvyF0/IK0x3ubbUuYwSXF/IFhI7NGMqSoKpi5EjDZNzv/XTfOrcFs5Fu2OO3b9/fuGmlEyATUoOK0Z0EAQvA8VmauTCOsIWL3FOIpdh2oookV+sOb8C5iWUKgVQrZAPyhPfBKx9+uwaNss1S0G76j/s2zbxiUSO0ONsBlfVP5wM1v61D0v9fA4WFDw27hQxFpn/fr+KaU1j1d/F6P9D45TwH7dUtcrp00w7eBhrRt58Do7QnXVR7mtG6tBEH9f3YPuoE90iw83oYrKnqLs14CFO0COyvg/jMcm1nT1PnRleuot/WGiPQ3RwEecmIRUPXDTH1QdY+1O/iF23PCbuMQFIo8VpmD+wUqCbk7vH6jpZCEENMuRMkdlplgaw5YvWZlrChSttt6CdC+IJaadeJ1zJ33etAyUTdi3YBUSRwfYm/JRH9axeMnkU+PWzYv/TPbbekAOQRQ+rAf4Aqe9ZBen8e+ybFe596pirB9ovm8VrUm55en7pq5zIf/LXpAGjkrDM6LVTaL81wk0U6kJmjc1CECtIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(316002)(6916009)(2616005)(41300700001)(44832011)(4744005)(5660300002)(7416002)(186003)(2906002)(6506007)(8936002)(36756003)(53546011)(66556008)(4326008)(6512007)(66946007)(8676002)(66476007)(31696002)(86362001)(31686004)(478600001)(6666004)(6486002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlCeE5SaGZNMjRTVjIwTi9WNTR3REdnZjN3UXdTWVdMWWh5SmkrSWN6Sndv?=
 =?utf-8?B?Q1k5ajc5MWdkd0lMR1BpdDBQZUdCZ1NPOWlPVkNUSEhiaFpZbG96NnQ4MEFa?=
 =?utf-8?B?TnlxTzUvMGptbFZUaEY1YWR0amxKK2dpQ2ZHSXR1QVNBV3ZXakh3ZGsrVnZs?=
 =?utf-8?B?SzBTcTh1YmxKU0RiZFZIUE5IRkczYWIyT010SW1SV2tMb1BzWDVkcG14MW9n?=
 =?utf-8?B?cXFqNnJqd1JNbGVCM0d6Q1VOM1U5UHZkNW9La1FsNGJkd2dFeDcvTHl0WERx?=
 =?utf-8?B?V202Yk96aXh2RlIrSmNRWGdIckNvZzA2bTcrRFRmRHE1YUZ0WWxiWERiOWcx?=
 =?utf-8?B?MHQ2WHViNm5CQm9TclRyekxvRDhXcEpZa2RYY2dTUllvSlJhR0szNzNtblBV?=
 =?utf-8?B?N0dUenkxZE5vMVdoR1R4OUFJWC9iN1FNQ1dKeFphTzFic1J5bDViM1dLWTg0?=
 =?utf-8?B?TUlvRTFpMEl4ZERXeXZNSENFNWxNZHk0UGZPektUWFpqdHcyWU5INUR6WmNR?=
 =?utf-8?B?d2Z2cm5xUlpkVks0QVlwd0xibnM3TnBRMmtKUU1NZmdxZ3plUVYzV0QvcFFH?=
 =?utf-8?B?azlnTHZKZEFHT0lKZEd2M3JEU3N2emVtWWxLSkJTL3NyaVh2OGlyNFgrWWpr?=
 =?utf-8?B?ZzJKVDVxWnJCZFBxeWZ0ZWNnUHNQOE1VRXNRQVNEbitiUkVEVCtLeERUSlll?=
 =?utf-8?B?c3kxaW1YZlRYaytCZ1hFTVp6M0NQeEZCYmhXU1ZUYmpzMXZRck1OSWloWThy?=
 =?utf-8?B?UmtVeHBySldBMVBGaU5vcFhYSUpRcEhoWlJtNGNnWnA4Q0pKdWx0TGxlODVl?=
 =?utf-8?B?OThVQk1HbUtmZkxkUko5blVINUpUTWdJOUo2TngwRks0MFJZVkhBVzIraHdX?=
 =?utf-8?B?Ung5MllselJWSloyWDZoNXRIVEtMcExIN0RqeDNJT2NTREVNc0Zhbit1aDlw?=
 =?utf-8?B?Nlh2SU1RekNpcThuaUdISEQ0ZnNJS21jeHpZY3ZBbVBneGhuZDFaNjRtdzJq?=
 =?utf-8?B?T05WTTZod2FzaXpJaXQ4RUNDeCtCUXpJQTk4WklOWjNaWWlpUnM1MUVPeGFh?=
 =?utf-8?B?WHVhMmZPU2lKcVNMNE9kU0hoMWpDZUFMcHV3cUpOazF2aDZ2VWVkSkNjYmVJ?=
 =?utf-8?B?aU52VjBTV01wMDZiVFl4K1RCWmMwaXhKRkgwSDJoTFNNcFpwRGtQYm5odmVr?=
 =?utf-8?B?cEE0UFR2UnV1cExUZXB2UXEvanQwQjd4b1VYZW02czVJTmg4V3VuaUtPOVBu?=
 =?utf-8?B?NkZHN0t2ajZqeUFvRmVrcHE1SnNuSnNBUjZhMWl5UCt5eGoybVpXbzZSaURV?=
 =?utf-8?B?RjV4eWJnR1ljcGxjQkRTZlR0OUZER0ljTlY4cVdJYU5KdFJ6TStNd1duS1Av?=
 =?utf-8?B?b2lZNndCWGxXTG84YXIvQXZXUVh1dTNuaUlvTmQvVTdyRHZIMUJwUXJFMk1C?=
 =?utf-8?B?djI3c3I3Q0dOekw0QlUzMHFRdzhsZmZBUzBuSFErN1lvT1RtbTJGcExIdUVJ?=
 =?utf-8?B?WUhNSkJtZ3lFMWFLZndYWTloWHYzM2JhOVFsUzZiUGlmNWc5ZThNU2NFWGU0?=
 =?utf-8?B?OEo0aFZaN3ZMS1A3L0NZaGpyMVNiVVROYm9xNkUwRmRJRnF4WHhiT20wdHZp?=
 =?utf-8?B?RzhkbTJMU29QYVoreDBJeVR6SG4rVzVzT283RkQ0T1lEaDdJeUsxTnpzRzkx?=
 =?utf-8?B?dDZCZ1AzbUNFU1Q2UEU1Z085YW1ZdlBjeFpmakxkYkl3d1pGdXFVQUxHbGl5?=
 =?utf-8?B?T1MvanJMamxTK3BaNTJFNjBCR0Q0U2hSN1hvaHoyU1NzTnp2MnYwQlFHNS9n?=
 =?utf-8?B?eTRWMFlwZzhUUTc0VzdyTG84TnVPRnF2STdQSnZZOU0wMHNoSnVBMUJyYk40?=
 =?utf-8?B?RXI3OHgvRk5mWFVlQnJLdFRJaGhuNDJyV0hRK0pEUUwxbi8yejBRWVIrR3lR?=
 =?utf-8?B?TUcxaUJOS00rTzFCZ1R4dklkRUljSW95TWNndkc2bHQ0ZytidEVxS2dCWnlL?=
 =?utf-8?B?aDNNNHQzMmsvZnZjTFp2eW01OHRmbjNOVWE1ZlVNNkc5WWRxTncrYUFRZ3JZ?=
 =?utf-8?B?NHluMkJHRkd0b3hnYlBnWWppZkNRMlEvemYvdHVPTVg1UGw3ZzkzblF5ZkFx?=
 =?utf-8?B?Z1IrbTdEWWZuT3lrS01WZTN3M2d0alppT0QyN3FtbDBTdTQ4d25uOWNSbkJ0?=
 =?utf-8?Q?sGc8SnPV9ZLQKnsyvSCZ28c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6d970b-9383-4304-e85e-08dac35236fb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 19:31:50.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5x7oUzUPXZDE31Mh13cpEQhRs1g8s/RRpns2BgkacxnbhFb2S6X3xvgBt756NwgIOn1WIG70lGkqVL76a00Z9tJV9iiFNryA4/ruHTje9cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4472
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211100136
X-Proofpoint-ORIG-GUID: eRrxUR0XbnRdPgqB_luf7_7bo16mrCLW
X-Proofpoint-GUID: eRrxUR0XbnRdPgqB_luf7_7bo16mrCLW
X-Original-Sender: ross.philipson@oracle.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oracle.com header.s=corp-2022-7-12 header.b=T0Lw7Kb8;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com
 header.b=qJfO5IdO;       arc=pass (i=1 spf=pass spfdomain=oracle.com
 dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates
 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
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

On 11/10/22 13:07, Peter Zijlstra wrote:
> On Thu, Nov 10, 2022 at 03:45:21PM +0000, Ross Philipson wrote:
>> On allocation failures, panic() was used since this seemed
>> to be the action taken on other failures in the modules
>> touched by this patch.
> 
> How is the panic() more useful than the obvious NULL deref that also
> splats?
> 

My answer here is basically the same as the answer in the reply to Dave 
Hansen I sent a moment ago. I think one of the primary motivation was to 
make things consistent.

Thanks
Ross

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cd5aabe0-94a6-3832-9e3e-b308b134d7e8%40oracle.com.
