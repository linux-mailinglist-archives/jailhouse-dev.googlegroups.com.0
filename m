Return-Path: <jailhouse-dev+bncBD52BTEZ4YLBBTVVWWNQMGQECS2ZDZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x938.google.com (mail-ua1-x938.google.com [IPv6:2607:f8b0:4864:20::938])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FBE624B44
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 21:10:56 +0100 (CET)
Received: by mail-ua1-x938.google.com with SMTP id z44-20020a9f372f000000b00390af225beasf1099994uad.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 12:10:56 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668111055; cv=pass;
        d=google.com; s=arc-20160816;
        b=VOFbz4F1io9xgDJx1KeColSA0/sLpUZcUZah0ONjxVrL1Eu5A36jzRBsBwTaN1zWc1
         e0S4dYFRy75TmtM1+RLpDrE28AyHklZ7e28X0eHZiuANKGI2MVxZUhsoRR8wM7WGkzko
         kvnoGAhgCATeEoP8bEg2Qs6eehWv4jgRleLKDyvQO6nMV1EtDyN+RFJsBujF1x6gbCxY
         sSf9XC4w+fxc1XYHbwb1krqowThLN2v3OulpedB/K5wpvEAqQAPpS1UHhCNABS8ur+n9
         8aYUm68pzPnz6kXpuodJ9/t268/PFIFO1HnNM6RXXhAA2EuuwDD5XaEFievhcX7l33fc
         35Hw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=UG65Io+Azlw+YXq2trKj2lGiRj60vhlE0v/tMZB4E1c=;
        b=coz7u00VnEhGg/FK4VWbmsYwAd3DQm/hHFLEckT/MjE30JEX0Z0fQQTjjXxqmUaaTN
         xWu6zohLrVbaO2YFIUYM2qohiwZpACuuQzfcBQh6xZbyE7X2lM2/nN83xhFwCMxsgLXS
         ojqLoukOZOYmANwlUinspLnmEWGa28aMIE7Nzwky1aIrf6lAEFbfBr8HYBicRmQ03+Z2
         Q04DnX3ObGyH1XEr8ugC7jXr00R8dmaOPj974aOd0GSZA20PnOxGGV1/iYPka+/v5YNa
         Q4osVDn/Yj0+dCWrHRzNTW1w9PMzgmvDXbKKEA+2omEO3aCENy8zJVfKD4PiFz/qPo1h
         P9Zg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=y478Q4hX;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=AiqCmhQa;
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
        bh=UG65Io+Azlw+YXq2trKj2lGiRj60vhlE0v/tMZB4E1c=;
        b=VGVBNyfbg3A3DJwigbalZJKljuMakhVHUO3aNKoc2upu/FIWKZbx80XgmNaGCxNQ1U
         wfDtkOjfdu142COEwqGCDlHcMkyup+u/KXd9iwKLy2/fLY6BBjs0V8OdHx62r7170an/
         fAMYq6t3GD6QZKs3ksLOyjv/Jo0Xwx9LH5LW97C6E4IFLnDcO0aFR0p73MbcVS016Dwl
         UgpBDW2Os0f9PUIpyTYlecsQB21CywaeEXF+61Bmzv5bPjOatpf/lx8yFAbQEp+VIYLS
         Y10PkVbvz7tJXtKcvFterrJwkLNXjV0Av24EGqHa81EJqUBfgQJv7fnpFy8gYovNtGaJ
         i+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG65Io+Azlw+YXq2trKj2lGiRj60vhlE0v/tMZB4E1c=;
        b=bO1vVSn5xDamTIJN33ejMmGrThXK4HkklkEl0DTQEzVyCoHyCrX/YJHm3Q5mQkXU3C
         hbvnyOAS0nUadGdhbP9RPD2OnewLBkl7v7nUPakAW5KPMA38gfUUIu+IZQ4ecRuSJaSK
         ljgtMMw+f0F7bzyuweorI+QFW0VuvIAHFqGg4OOF0QlYySztGO4MkNAv25+Wl9c54gf4
         C2Ahy2txvhEbg0eQo1h2U76AN4gqdROWVJJ50/ytKyZvzNOVf2HBwLfbzRMyY48y8hLc
         kvcByzqQ+FMcwJtaCXuDhU+y3273/YreBT2ExkmXjj5uigMAFl8EvbYWD7Cxjj/9mD5D
         DiJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1QnyPW6dFfKZQwFGxOYcoKAZLeLWFefQcGCvlsRCqlgdPbM4En
	WPhNU8HNxoryV3xSnmz2ZEI=
X-Google-Smtp-Source: AMsMyM7KE4wLyDDYkr1h0T9K3oVOm+t0ZRhSt2HU7KoRumaYaEuZSzVbEmdV/OCyXZ4pqqYMt+NCeg==
X-Received: by 2002:a1f:26ca:0:b0:3b6:cf06:18e2 with SMTP id m193-20020a1f26ca000000b003b6cf0618e2mr15930473vkm.13.1668111055227;
        Thu, 10 Nov 2022 12:10:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9f:31cd:0:b0:408:eef2:4a73 with SMTP id w13-20020a9f31cd000000b00408eef24a73ls183086uad.11.-pod-prod-gmail;
 Thu, 10 Nov 2022 12:10:54 -0800 (PST)
X-Received: by 2002:ab0:67c4:0:b0:40b:643e:93d5 with SMTP id w4-20020ab067c4000000b0040b643e93d5mr22237285uar.68.1668111054312;
        Thu, 10 Nov 2022 12:10:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668111054; cv=pass;
        d=google.com; s=arc-20160816;
        b=lClgAOiBcqZcl6RtWl5LQbnuOrgh2pX+ECrFT+WyNgaqRaqiyQoTdyQEYkSNNZcpn1
         qc8EvW56FHt2PT/ltQvNzf7w9HELHymcdazbbN/dVTszfb9IYusjI3N80Q6QLSMAKBey
         JJ5jYGSjk9hiREaxAAvVoYnmoweBKlwgVZM8ptx2pcsoxSa+M4XcKyKt1XxJdepMF1YO
         t4c5GJl6u+K2rtSBuqoTUibaWPtJILFgISASqG0lTEdY2O7/0MVwBQQUyLURLgKKwAvU
         cY7L4IIyG7EgIcKA/CNsg9u28fflfer09UFzQO9LV58vyLtlzfRzDrQW4B3xcK+bL+UR
         oI5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature:dkim-signature;
        bh=O8ZQBeQ4uz997ZkYw7OOdLDUfFU9LYeBcDcBTLN/pnA=;
        b=lUAUyT71Hjex56ITaq5RZVo/wLDnbu6T1HCUq6R52MLLcVkAXxAZGOvO/FmIrH0YsV
         UqJlI8cyahp5wYeLZZp7nPEY+Zhee8WMNjZz5FOx1ss4U8tQl+jHKZEq7W+VoA7fX+bm
         pDZi0x6mCjxlacSQkA3Zeq5ec5ME03tzVuFPw1QpC63VggE56xRLB4fc7r4ATUO3z2mC
         zQ79ooS02FWeBXrpT574JlY0F9ZTrpAtwl4teumDdw2c5iyrVclcZqUdfjyvH0kZKpKx
         tYBCllKyipXerR1Cye06fJu4Yk6+pgTsMMzUjZzHhPU/hEWhGJoIjKbIokFvT0ifGk1G
         C3iA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=y478Q4hX;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=AiqCmhQa;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com. [205.220.177.32])
        by gmr-mx.google.com with ESMTPS id a13-20020ab03c8d000000b0040ac33271e7si48866uax.2.2022.11.10.12.10.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2022 12:10:54 -0800 (PST)
Received-SPF: pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) client-ip=205.220.177.32;
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAK9uWO017710;
	Thu, 10 Nov 2022 20:10:49 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ks82q805p-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 20:10:48 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAJFSGF004161;
	Thu, 10 Nov 2022 19:30:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kpctpvfex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 19:30:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcX7SPicFWGGLjP8I8YWtsQzk2UmytGdrMlunr8n/hEPkRxARoOiNxWYvZN8aH4odJGouzoUra1tMEeYuhpzLI2mBeJPQxhMNhG6HnKs4a01M0XvLkn5mpCABuww3IigLBlTN2mOAvd499hjYoV8aqFnA8vK3Cw6KNRCRz1GWo4HcUNXQxBgDbZnuSJpg31YNSz8vKkGhrkXPciIyr/iuyLhI690Lxnj6R6/ABHEEy16I9OUqG9MA/FxfohHtVSd9D41Lbb+C3BzdCeRTBl9E2Ilm8USIcMnMalzvOs2QGWz4BGlzdFzCCW/UKlzEJ6MNV0iJbj6VjU32ewOP/GklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8ZQBeQ4uz997ZkYw7OOdLDUfFU9LYeBcDcBTLN/pnA=;
 b=JXCutMoB0lgZkhtMUUZxi0/oftunNQvs4kf4qhbZJvad840JWb342zq6c18COwiUdIpOUELhz0Imxy7/+ETBp9OO1MWpKAiRhV2wLnMKut7lHhLvGDrLcraROxXJYAWU21Za7EnoZJ/okLPg/rQgSlHymtwucJkG+Q8ga5JeWyUkYYkivo2waVRFs/L77tCzEOSXevOIdKf05XWg/BzF7tJZ1qkxkfL1ctfAX2qVOCYF9L7yWvYn2H/nCOEaG2XQeF4QlEQdkZE+Ub3/VAoO21CR8UZkDjxLSaeGy6hHeU0sAT0g+Hp2tsQt1CYH77LKR9O7FzXGbzwzn/+DKVyHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by CH0PR10MB4987.namprd10.prod.outlook.com (2603:10b6:610:c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 19:30:30 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a%4]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 19:30:30 +0000
Message-ID: <267d84e3-3fbe-f010-113a-805763b7a325@oracle.com>
Date: Thu, 10 Nov 2022 14:30:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
        dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
        trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
        jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
        jgross@suse.com, boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
 <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
From: Ross Philipson <ross.philipson@oracle.com>
In-Reply-To: <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-ClientProxiedBy: BN9PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:408:fe::15) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3793:EE_|CH0PR10MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: df339611-71bd-4c8a-c31c-08dac352074d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZTjfKNRR1crSA0GaNU/deML7H2fClMYqinvliL1cLcxSZe15XF8ZsJJKscbTK+gbi5k17d3VLqhWJHVHxm9JiZ2svOIWdXkaMRSdpmutBg/FsLCci4JeQe5HkuNTsgQf+FHf/h6SUaEIDMIs7vXiLqkXjcebj7/tXEnz1nOMB2241LgPXhEd9+xUjaniF41U3E1PCiyUcnpaXL9jfQuyHCpVxQFV+zcJyTgMnwZHXLtzILHZItp2jLEoCLW768zMGrklLCAD3HChLIWWPaUJ55LS1U1To0WJAnqKqEWJJ6WWJQpeKWUv6sWhyGb09z4bhqAz0I2m3/lJv8JxnlmDZZple+xkmOTf2y+VoF+5OsfPdz818HKyyjpNIX0QO8ogOTLnYcbb41pQ0MUbQEv0RWizANoGNKpc6HrQoao6GUwuZbHJby2sP/nA8wqak2UtihEY5G4AJ32F2mAw2Y62H8BBp9R705C3Mpxm5K3NEyNrkHxaaYnD6vaU3XDI9vFHCagdyD66qQQkkl6MCUzeZrHS8vhRtzKuXppyyko5YHb2DPnRygl6AlkwmqLE7YQVMDnXJISjrJVY4lin6FEZe7+SDVwOD4KS9opKbfsTCl5pMuLTucuDYgVxjuUFHu05pkGCnSFGMsr81nTKvUdGZ/bb5txFc02l5fvCBvdmIPq/CJybnE6p9+Q1T+ZOxWE/ZNmyRdKEtfHikKkE3ZCMuBHVw1nxsXmd4+yPrqKfaJ3J0B0d5jOUFn7R5wOFQBgy4p6l5jcaETgE3n5biRwrig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(44832011)(31696002)(2616005)(316002)(6486002)(66476007)(4744005)(66556008)(6512007)(66946007)(8676002)(4326008)(2906002)(6666004)(41300700001)(36756003)(8936002)(5660300002)(7416002)(53546011)(186003)(86362001)(6506007)(478600001)(31686004)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pvZktoWFZiclkxTUgvaXd4NmhxRE1mTUlGODlCUzUydkM0VXNVbjVYT24v?=
 =?utf-8?B?dFZ4UTZMVUNSaU9TNUtPdE1abTAxWjRaVHlKNEpGaEpORVhoQk1EQmIwUXNV?=
 =?utf-8?B?UWpkTG0rbi9QcTJYUC8yZEpLcC8wWmJnT0VLZktobW1sVHU4WlhqMzZvRmJN?=
 =?utf-8?B?V25Ebnd4dFZhNjVueE1pYzRMbWlwK3lnQ3VhSzhUekh1UVpiVVl1R3BpWDVm?=
 =?utf-8?B?RVpHUVRGbmpzalkvYzhrN3JRRzlYVWRqQnluWnVQdTJsa0pYRDJ1aUVIOWFn?=
 =?utf-8?B?R1pHS1NUNmhyNzRlMEtoYjZuZUdjSmNrb0pWY29udjJmSklHaGRsMVIxTmpG?=
 =?utf-8?B?aFpmYlMwRDg3MnpNdWlXN3lKVlJrbkVxdURDVHZ1M0hKdHJxQ1lEaUd4NDRt?=
 =?utf-8?B?RkdYano3M2F3WjFVU3gvQzJnUHRDZ2hTeW44R3RQYlFZU1ZrYkU4UXBhd29Z?=
 =?utf-8?B?cFdQT0kwL1VKdlZSMzFWMDRzMXI2M25UcEtEZFNyUWF2dkE2YTNJZEJua2Z2?=
 =?utf-8?B?TWNSd3BxRFZhQVlvUjd5YlBabXIxZUZvYnBMeW9KN2RUelh5ZWxlQXRnbEhV?=
 =?utf-8?B?T204ZmtyQ2NscmQrTzgxSlMvME9YNmkwcjBiQmtONzJzRUdlYmtDYjdKNE1E?=
 =?utf-8?B?V0RuN2tWOTh1SnBVYWVrRUVZS1RDa0lRc0FkNmxMbGNwYmI4bXN1R0dVZWVn?=
 =?utf-8?B?N1Bod2dvaExqZlRaeHIxUFRPQUt0cFZsNm01YW5uQTRGbUdxaUR2MGJ1amli?=
 =?utf-8?B?NU9uYTJ4dTJBUlVvQm91UDdtUHJXMzVJV1dVZ3JUanB0bEVZQkhTN2dqNjJy?=
 =?utf-8?B?RGFvVHRZQlZMb3hPRHB3RythemNNeUFhNVczeFlSYWZVYStYS1RNNFhqa0dZ?=
 =?utf-8?B?SnR0QjJiVDNKdG44SFduaXFPVTVyYkxaakhWQjI4NGxvd3czcjMxL1E4blB1?=
 =?utf-8?B?R01rMWxZTHZ5bjVCaGVFbnhObzBUMWgwNVlOVERCRnNPK0F3cndEbjRPUXZY?=
 =?utf-8?B?K0JubC92Y3lkR3F5RG40Q0VTbmRld1BTWGl6NUJocHRQNGdnL2RTTkRpckto?=
 =?utf-8?B?bjVha3h1UDI2alRxeHJ6b1hmcEw2RzhKN3YxTndpWnpWeHBVZkMxcm5odEk4?=
 =?utf-8?B?NG42WGpOaW5NSFNpMGV5RXRISmEyR2lqRTNiMzZCNE9kSVFLaFZ6alVjUEU5?=
 =?utf-8?B?V2F3MEs3U29wck1tWVEzVmdHQ0ZML1J4dElTWnpzcm5PVE13Z1hBOXdROFNZ?=
 =?utf-8?B?bTRncDY2WC9ZSWZBMHYwWlRTTlhHYXFZQUxsVCtZNWlaY2ErWThtYlB1NW5U?=
 =?utf-8?B?QlJvS1VNU0NSb2hsQjVnTjhKODYrMG82dE9MZ1JneGR0QlBzOTUvOTV3SXRW?=
 =?utf-8?B?dTAyekZGSWJ5MDRDMUphRFpBZ3QvWE0zTVMwUE5OYmp6NHlsU2ZxOE5TL2l5?=
 =?utf-8?B?T0hnYTNrUnpSSDh0SmoyalJjendWU2RHcGd5WkdZWVFXdmljYTZmaE56RW1E?=
 =?utf-8?B?MmVJMUc3UGNQbWxZeU9lTXo1Zm9CTTR3cURlWmRlSmFqK1J4bE9Zc0NJdjV3?=
 =?utf-8?B?Rlk0OWp6dmpPZFFwRDdTYytQNmFrR3pvSHIvd3FReGxOUzFIMGtvSXBpbFFh?=
 =?utf-8?B?YmlkL2NaYlMzVExkQjdiYWw4NkdNTTZYTml0QVdwT1FXZTBsREVreTIveVZy?=
 =?utf-8?B?TU5YanpCNFc4WG0xTXRvTU1JUllxSTNlVjBIdzdaaERoM0tuWkFCTWpCeTBr?=
 =?utf-8?B?YnN2WGhzdGlKZlB3bUZTVnVWV29SVW42aHBJL21hUngyQThrVWhGcnhYb3Qz?=
 =?utf-8?B?amF6TGFPb3V0UmFTck9KRUpCVGx1NzVLdXgrSDIxSjVTcEI3OGttd3JsSVpB?=
 =?utf-8?B?VXlXdXlzYnpHazNCbUc3MXl5VXhob1d5ZHB1V3FmWWd5WlRoOEwwcTkrYTdC?=
 =?utf-8?B?QlFLalZOQkFjdEJ1cUJaTEdieFFJeWQ5NmxtUllDVTVSSnRvRVBCcEZ1Y0xT?=
 =?utf-8?B?MGhmMUkvbWRKa0g1NkVaRTBLVmE4SG5vaUFzMmcrL2R0eG1ialF4OXF3REMy?=
 =?utf-8?B?T0pXRXI2aWxIcUZJeXBMelIzdHR0cXVZVEVXV3llTXlCVVRBSEVlMUU5U3lB?=
 =?utf-8?B?MklBYlpyYTFjcVJoQTRPeEtXeDlySVdWblljN29uRWJUeTg3VzJwRjVBZFZm?=
 =?utf-8?Q?2drO1uwH/e9pdsSDxyRAXOI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df339611-71bd-4c8a-c31c-08dac352074d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 19:30:30.7055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8UjmBgIxTL5BS48FqDndM3TTnLk/2edmfQjIcGcANXp5ehiq9hBDuokEGxeVfoal2l/b5SZLENuGwe+1DT1MfYu76gNGBYwRCBTuHZIdiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4987
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211100136
X-Proofpoint-GUID: VjBUBuG55t1ISJRWg0gP5HrFJPs_aDr1
X-Proofpoint-ORIG-GUID: VjBUBuG55t1ISJRWg0gP5HrFJPs_aDr1
X-Original-Sender: ross.philipson@oracle.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oracle.com header.s=corp-2022-7-12 header.b=y478Q4hX;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com
 header.b=AiqCmhQa;       arc=pass (i=1 spf=pass spfdomain=oracle.com
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

On 11/10/22 11:07, Dave Hansen wrote:
> On 11/10/22 07:45, Ross Philipson wrote:
>>   	dt = early_memremap(initial_dtb, map_len);
>> +	if (!dt) {
>> +		pr_warn("failed to memremap initial dtb\n");
>> +		return;
>> +	}
> 
> Are all of these new pr_warn/err()'s really adding much value?  They all
> look pretty generic.  It makes me wonder if we should just spit out a
> generic message in early_memremap() and save all the callers the trouble.

These changes were prompted by some comments on an earlier patch set I 
sent. It was requested that I fix the other missing checks for NULL 
returns from these functions but I thought that was out of scope for 
that patch set. So I agreed to submit this set and add the checks making 
things consistent.

> 
> Oh, and don't we try to refer to functions() with parenthesis?

Yes I can fix that.

Thanks
Ross

> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/267d84e3-3fbe-f010-113a-805763b7a325%40oracle.com.
