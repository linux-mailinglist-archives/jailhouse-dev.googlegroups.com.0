Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKFUXOPAMGQEKQS5EUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB586785BD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Jan 2023 20:04:09 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id y21-20020a056402359500b0049e171c4ad0sf8986141edc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Jan 2023 11:04:09 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1674500649; cv=pass;
        d=google.com; s=arc-20160816;
        b=UyQoXbKkEdZzgFXp/YKDgzgrp4mIpUOM7vLdhZ4F/YUFR/2owNK1JQQOFwfjAWL+LY
         dOVTWeh47exqeJOcO0S5wGPRxMg3/4gs9KSPXp5SXmldV0wT+op5cxId/vQc4zXMhxqd
         mk7amnwt7M2FXkMzWP/IbO3R1DHFrXq2Aau+ApHqoQWsHcW3fVJ+UjNwTh0gLFBin6Zl
         CBrznycFNynXmxh9PVUt0Md9CICZJDg10kZGrcSe9u1WrZjX6eZ05eb1J7JBgKbfjXYP
         WT+kH0mTAf8+V9qByxsx773kDtpR1R+/iAx+DlfuEyMbL6LwOKkfRdgLB6LJbjtWFkEy
         UIWQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:from:to
         :content-language:user-agent:date:message-id:sender:dkim-signature;
        bh=AiabrNjggzQ9rhwF72im4hxaLLJKIl5ZopoPYM9U19w=;
        b=yUKLNT4k/4XwUp66coTqgdypspgaq3/Aeb3d2aV3ws30qVj1c1Dfll5sVvMzCN4ESR
         bunyADWSUml1h3dTbGgDqApgAOoMxisqYD3Xh51yLrLq752cquMO/fisOqaBww86jz/B
         V0TmIAKe15pSlbpMoJCnQ1V3HpEJ0ibeS43WMbUnZF2uWfw7/SX3wFaUebavnUIBERLt
         17dEABJz5fK4kwMJikTbKhl9FhCfJHTSG6nUwZyzSYhkUjsDOGgrklzU8MgpAna2Xc+y
         4cHkeQgpPPMbp2lhydrpH9T5tU1cRmkdRUifVWI/fOX+Anm5KXMMT1+m2aGYptyKJPZW
         reFQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="uR9/kk2u";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.14.82 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:subject:from:to:content-language
         :user-agent:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiabrNjggzQ9rhwF72im4hxaLLJKIl5ZopoPYM9U19w=;
        b=HnKKJvYtHGnfFHqPxx2yh8+7Tf4PNI6QMDOUrtlUi4OqRfGwjYGUMqFq9V+vXBABUX
         V9FZOuC8ojmean6QMH7sPX/OKGoI4V4uBHTqSR27xOnrELErkhxSD1oOV1Ae/eiPAW16
         4L89T3IAeZR/tCVNbGI6GHIJvvN7CR1VQaIGs+j43tu/H7mcfArugqtNxHLXGRHXy0Ix
         rvevzNWiRdqdb25coFxZowaI4VFI9fvENUc6wCgzIaBMTPfkBHt3UvvU/K+NiKPrLEQS
         +dCV4thJIqlPa7dGFJ7iuRW5jDyeLi+ffUHLArJoMMpsM3RxfKcfmUm9t3Silvu7Wz9h
         NAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :subject:from:to:content-language:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiabrNjggzQ9rhwF72im4hxaLLJKIl5ZopoPYM9U19w=;
        b=zcP4ZBqTDaJsHU/4Wb7bBarT67HBv/92QZvADxs6LnJ1zkRX2I9EZFsIYdDToQY0aR
         1kTAwwTEiSZX7UEgW3fub7nEJl12T4Kfdz5rRRprlVo4+Ba76RofWteJdq4v+Q9s+htA
         s3B9CGVV0rpqieNcTWfrDfRFh0n+DTO/P1eajqKnp4lRBQw+vq1ngpEQJD6EgaDn5gnG
         RIWQy/XmQ1wAe9unTL1eQYLlcAjbHU9KHxpsPROVlCmf+fclddW/vNapBgdfAK8loabB
         b43Yd2HSC/TUNC3bOb1TjPubaPKslWMFSGfLc+RcdWoYV1m3MknE1Nkr4Nr6s3hn56qi
         BFsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpUvKeW3zlFYb0UPVlxRYKHALV3hbn/iiws4O7BHJBOWKnPuE1b
	sZZRf+zy5oBVZSnUUMLL5Vg=
X-Google-Smtp-Source: AMrXdXvzHslcjB0Mob1g4HENPoM538RfYy9GiGFCHiuR5nkhlfZAQCgJ6r/MdbcMrqvO+oFnyWbjkQ==
X-Received: by 2002:a17:906:9417:b0:85f:f115:65d2 with SMTP id q23-20020a170906941700b0085ff11565d2mr2388611ejx.555.1674500649073;
        Mon, 23 Jan 2023 11:04:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1e8e:b0:488:1679:c417 with SMTP id
 f14-20020a0564021e8e00b004881679c417ls11368669edf.1.-pod-prod-gmail; Mon, 23
 Jan 2023 11:04:07 -0800 (PST)
X-Received: by 2002:a05:6402:3227:b0:499:b415:bb27 with SMTP id g39-20020a056402322700b00499b415bb27mr29239060eda.4.1674500647463;
        Mon, 23 Jan 2023 11:04:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674500647; cv=pass;
        d=google.com; s=arc-20160816;
        b=HIJwv7/Rfw7/q5GBllbeyF84LXqsOsWGSfT5IhZiFRIxUnnCsOKbc1tNg4nUWuuqBY
         bbezKM489gG1Qc2Q7SlpjUyOtOsy8rALzOLdbT3F37dVVhukeRpZ6i9/fVFSgV6GecXH
         Il0X7mQ2+NhS+PAKCIpRpMJ1Snmb25nlImgqW3+6AhnDHVTvyK4WVku2+1PT4ZQ1LNzi
         /xfOROB3SeB+z4KxnA/oawa807GDHh5+/VF0rUUYaIvaeUQCRLPCLiXbvkezqaYu05Tv
         o6+5lnThnmLpWKsNIGOEcPy02oPx/Rqz0MsnWC0ScBIaw/d78ADruXnPZObwDCZwkDak
         Q9bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:subject:from:to
         :content-language:user-agent:date:message-id:dkim-signature;
        bh=lDpT2ci1s2U0YegirThyjvxHT8N/etLWpvXW22b9tIw=;
        b=prOebcGyF7J9AVL/QfUw/LP+QVU3DpVlIaym1UCLsITNa6LAHRtDE+YZdsbYB63j0a
         dBX5uxxCL97rrylzH50R5Jca6GmAPdA5eka+Ts0p5jjNXgQcVRYLTcq5ngGj/cChUq+F
         7fVbWCb7EOGDDPu6T/hKY/vIYBdfCreABktbuF1fJ11qWPMV3tjuSxQMOiVrRA9rxDmS
         d9X2GI3TzEVpH8IZT7pS1HOfju7iRnFnTQnQ14iWev37RL4mJaNH/2mSjPJBk+aZPqro
         JOrRxWEeCCKWUBV8W889jOUA6Ves8blKOp3J3Yw8NxqVHMBU3PWVls5v7e9CSzWpn6DC
         X6/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="uR9/kk2u";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.14.82 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2082.outbound.protection.outlook.com. [40.107.14.82])
        by gmr-mx.google.com with ESMTPS id i9-20020a056402054900b0046c3ce626bdsi8590edx.2.2023.01.23.11.04.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jan 2023 11:04:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.14.82 as permitted sender) client-ip=40.107.14.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvBos21rrsPCpNWvs67mG8ErrRvFxxgVqglxY2KtSeo39plDpOGYFLC40U4PytIV1iqUNlWPECq0qATAJxacn9gPpEiI/TQMu2xx878e7iV4HrZxJ3VlGbHluVYi727RF1L7iRQeG880D+kIKcnpR7/jhOqhbiZU+u8y1SC5Fj+XHnH5Bae3xmEhhCQXS0WRp25bCNnjBmP1U9rPxbFSTNVkTWWmHajigC/auAvsSzJq9lOCBuMf2CZfniGdOOaD/Kl170uiJ78O425TfXCdeBsiAQMfe8ms+OA27Nl1REOi9i8eiz4GFtn4J3kmW+4TQWt4Ih4kPk7vxfXIlWeiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDpT2ci1s2U0YegirThyjvxHT8N/etLWpvXW22b9tIw=;
 b=YRbl/bacsSAEYEX4cTF3jXTkAlTY9ZChsicJ7o1O+DOuvmzIP/y5wWeFpju6TVIX55Zo8A8GPK3df6tu1NA4ym5uUNx+qH8flK5gNewcaQ93eUcxLOPboStgq+YGZ6oxD9vLZ61QK2x82ex6I0P3M0ajEl/3hvoyZYHzMKz2KpVGtj3WfUbzUCAQ/a94M8C6xipRoL/5oYukhsZUmCoNfrkr0PgSowFse/vi2tA1vx7gvessJNb44I/MK4DZ221XZUih0KbOwb5bZ3c9Fsv6XR1r6UXcdPhlnKR5eDSlYPG7SnbwyNbOt2OYKFI1HYimn3pUIB6HMOEfpLl30vjWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB8PR10MB3832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:166::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 19:04:04 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 19:04:04 +0000
Message-ID: <64c51a19-06d7-5333-c7cb-6581e547bf17@siemens.com>
Date: Mon, 23 Jan 2023 20:04:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: 10 years - and still alive!
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB8PR10MB3832:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba84f7f-85c8-4e61-6985-08dafd749894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7ZeSku6JwFm4WnqqVLtIQ7ykfuN9JCqgr2Py8dkM31Spz5GbRBgbYJ6+qwmwACGVW0ediVRblZRxEuKE1NyMz3OZKbsMiOFdJtwGLAb4tQFKYSseV85pF+OnOrk4aJXZBh+403gpbbyYXQm3MyuL5kZXtZC3KpnUSusHEmgAhC9iOVIBwNg4U1KgkKbIVAo0e3YQnYklykgW4oD4PLX0L4aBhZr+XSO6UfDk20VKtir9QBuAK4xCJkTeiiy84MrZ2F52G2vHOjQMdiJIXRxY3koCQtIjYvl4W4/534JUIni4TpdbHE3UJRPc0iV1XKUfYq94W29FFd5EyvX24kSMPs6d2F1P3hUnc2yV1g3hGN1p6Ujw37II12AQyf4gwnkGU2e2V2GDCPRPL/obaXPV2afLZxkgDohV040NyfLu3hruF3HnC9zyqk1TwQXBZf3o6LFuso6ahAjPyqcodYB9t1NW/qAA6TvFyD2NVGuIVrysoQwa1vArRKkO0bJO0WSDv31Zc8Fpxw5m/bEMtl36/ENj1nUwsJBavhhaRL0WpOUJhwez+EcWdleBYgQFKBuj1XQEkUFVnpd+cg4/KAms66mdaJ7zQBFobDBv3Zy0ids8Ky9bFuEhSHsM7qW6mMmZDmIto5LBWkGWFI8bIaqshADOlJLlh9SqGlBQT+xQaUfwWNpfeZlAWi6YcBUWG8s64RrhlyQ4IDdFVljyf7tHWNi8xJmcgaleiiHXaP/lnzSucUhRqALRTng/pBZOLUHfB0hhJLGz/0CUkQk0HpJvx6ktIb/4gqGV36Jqv7fGHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36756003)(66899015)(31686004)(86362001)(66556008)(44832011)(8676002)(66476007)(31696002)(6916009)(30864003)(5660300002)(66946007)(2906002)(8936002)(82960400001)(38100700002)(6666004)(478600001)(316002)(6486002)(966005)(41300700001)(6506007)(26005)(83380400001)(2616005)(53546011)(186003)(6512007)(2004002)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZiYU80R3h1MEYxMDRvVnlKbGtwN3AvaUs1dm1wYmE0d3dtN3NZalVod1ls?=
 =?utf-8?B?OVdwQmJvU0doU2lFb1VoWE13Y3Y4R1Vzb2dyeFVnUEg4SDk4dktmakNkdmNp?=
 =?utf-8?B?SUxrZE13dUxqRXcxMWlZaUdGSC9YdVhwV0VjSHNSd2JUWjFBaWhrelZLdFhq?=
 =?utf-8?B?SlRtNCtPUlZ5ZTlMcHJOa24zM0VSN1d0SmhPTElIYXNvTzAvcFZYS3dwYkZx?=
 =?utf-8?B?Nmp1RHNKaUFDV3JIZklOZUo0cWwveEVYUkxjbloxc1dmeDJGVElvaUVWMkRM?=
 =?utf-8?B?NVU4cElnWjlQcjlzTHVmUm9CWnRLeUZxdFFHcExkQzdjemNZemZkbU1TRjJ0?=
 =?utf-8?B?K2RIUGFhWEYxeHo1b1VGZTlCU2pSNEJtM24yM0tVS2svQXNPSTJhUlNxRGU5?=
 =?utf-8?B?MjdtM1RZeWZBcUFGRnRLZi9nY3hVZFhwMFc5R2poc2IyWmtpN1J1S1ozaGtC?=
 =?utf-8?B?V3o0WFlQMjhqeXVIZXArVjllbUdFTEM5Y3RXclRUMVVuSVBCWnNxMVh0STk1?=
 =?utf-8?B?M2tZWmFVbzhFNzFhTnhzS1VsYUgwcTFPcEVwMnJqdkEvazAyNTFLU3Nmc3VO?=
 =?utf-8?B?cUpvZXRzSFVQVUxFanF3cHYvNy85OHVqajBtdjJsMTFOa3JTazg5MTlPdGVK?=
 =?utf-8?B?UjBBWW41MFd3NmtodHlOSWt3d3prdjRYWVc0c3RCZTBwUVIxTXVpSWJtNWVV?=
 =?utf-8?B?STJKd2FUQWNXUDl0SGNwUlhleVJ5U2cwbit2L21PQ2VXblViN0gybDZuUFRP?=
 =?utf-8?B?M2FFZDNReFlFcHBSRXJuM0tYSlkwb3dSRnVSTllYbVJGYVF2WlBVekwrNzE4?=
 =?utf-8?B?aEpQbzZscFB4S1JlS292clF6ZDFBR2JRWklkZmoyS3RlN3BMNzNBVjlnSkM3?=
 =?utf-8?B?bUdUNVROb3QySzAraFlMVkdjNElMalE5U2M2SnNtUGdWYW9xZlRwQnJZaGtm?=
 =?utf-8?B?T0huUlpucHJXRDZVWjhtdGVGZnhRaDY0ejkwVEd5bUx5N3Nwa2hkVFhzUi9q?=
 =?utf-8?B?NEFueXNFRTV0Q0tYNXY1cTZ4dk9WdUcwdXloMVdMc1BNaEc0NS83RXYrdkxX?=
 =?utf-8?B?eDlvSTMwdmJzQzlKemUxNFRCaHZBbmV1VXB1MXo2OVliRVBUUVYvUzdrQS82?=
 =?utf-8?B?UTUwKysra0pyUE4xNTYveVBjS3VSTFZRa1FSbWtIcXdWWkhYenIwWjlYNEJC?=
 =?utf-8?B?OU0rMnJEVDZNT3E0MGpSQXdlU24weENORjBEc1NYdTBlS2ZxZTN6dEhrY3dx?=
 =?utf-8?B?RWRrTUErNWpSckVjV1Q0WlVRSXhuczZiNGQxSUdTODF1bnAwR2lQazlDYytt?=
 =?utf-8?B?RWNvRkxOS0VrbFVGOUo3aEtaR2RLUURaUWpxeFBpTlNwSTFpTGpvZFRwSW9w?=
 =?utf-8?B?QUxvUVNuems5bXIyek40RFlSVVhNakcvOS90WlVoNmlDeUdrMHBNVUxvd0dF?=
 =?utf-8?B?T2hzZkRFQmIzemRjVnBoTnk4MkRTTEYySUtMd1YyNTFvb3BQYTgwZkM2R0Vx?=
 =?utf-8?B?UG5naUxTQ2N5WDhrMzZHK2N3U3N5TExodVZhNzgxbXRldjRGekNmcDkvOUk4?=
 =?utf-8?B?NE1NK2Zydld1aTJYcVZpSUFBYmhYOEliZVBLUXZkcmxNTWtlNWdSQ004RHlu?=
 =?utf-8?B?dTljK2lSSWUyZ2hmNzlBenN3cXJmRXJRUXQ5UmhRWUJMQUtDWHlxd2sxVFNO?=
 =?utf-8?B?M3BVOWZvaHlsUStMaWtqZDJRRFlEdEw4OTVsSDA0VEFuNHUvcVI1NVVlM2V4?=
 =?utf-8?B?dUhZMWQzWVdGNXYzc2JDRDVhMWVPeWdlUDFJS0dHLzVqY0hsTE9BWW5uUCtX?=
 =?utf-8?B?bFlNNnR0NXF5S1NSRWlTQk9xb1kwWEdlcjZxUjNKRlBLRjBubk5WVWxsWnZn?=
 =?utf-8?B?bVVyREh5MmF5elVNZTBMSTRkbzNHZ0ZxTW1WQVBDdmczNnUrbTM5ck1zSEho?=
 =?utf-8?B?VWdzZWxFWjg5akZaL2lTeEE0bm40Z05Jb0ZNbWQrYlRVUnkwK1BiVThZS2tL?=
 =?utf-8?B?ZHo2VmRkZzBnRnlsYjR3ODFRaXdZeDAzak1GekhmbEROanZkTWZWa05QcFNa?=
 =?utf-8?B?SlpxclNxM0lVOS9XblJSQThROXNGYjNiRmtFc09zTjdhL29YUG5hTHZ2YUZj?=
 =?utf-8?B?STFad0Y5NW9yaWY1VXhxQTBWMHNkS2owZ1hqejZpWW4zS1hZWmZNWFhFQita?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba84f7f-85c8-4e61-6985-08dafd749894
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 19:04:04.5961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54sp1JKS9VH1j2/pe3TjLKuOnO+AaVAHMtzMo0sXAcd6h0u5kODXHcriK0JUbM9tLwYzeOSI23Quv+iwrHcxug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3832
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="uR9/kk2u";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.14.82 as permitted sender)
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

It's been a while and I'm also getting older, so I do not recall anymore
when exactly I wrote the first line of Jailhouse code. Maybe about a 
week earlier. However, my non-public git records start on the 23rd of
January, 2013. Therefore, let's use this date to have the party!

Jailhouse was born out of an intensive discussion with colleagues
whether creating the n-th closed-source hypervisor would be the best way
forward. Their idea was that it should be straightforward to create
mixed-critical systems once you have a simple partitioning hypervisor in
place. That little piece of software would "just" be certified according
to safety standards - done. I was already skeptical whether it is a good
idea to create yet another hypervisor ourselves, after having worked on
various corner-cases on KVM the years before. But I specifically didn't
believe it was worth to write that without having the chance to talk
about it and the hardware it needs openly with a broader expert
community. Still, I also felt like it would be worth exploring such a
safety approach (without have much clue about saftey back then).

I first thought of shrinking down KVM, benefiting from its maturity and
"only" reducing its size. But then I realized the limits of this and
thought: Why not trying something new, activating the partitioning
during runtime? This idea was spinning in my head for some months when
an unfortunate change in my personal life made me look for doing
something creative. So the first code was written during long evenings
and weekends.

I first worked against KVM as "hardware", so I once again ran into KVM
corner cases, this time around nested virtualization. Let's debug the
debugger, and have even more (hacker) fun!

Around the 10th of February, the first vmlaunch succeeded, still in KVM.
Only if you ever have tried that yourself, you know how hard it is to
make vmlaunch happy and to find out why it is still not (think of
"docker run" would only return -EINVAL, whatever you feed in). Even with
KVM, this was not easy to understand although some consistency checks
happen in software there. On the 10th of March, the first inmate
launched, the famous apic-demo. Still in KVM, still as a spare-time 
project.

Then on the 20th of March, I added support for starting KVM on my work
notebook, a Fujitsu Celsius H700. What was missing for this jump from
KVM to real silicon? Actually just a minor adjustment to CR0 handling
where KVM was more relaxed than actual CPUs turned out to be.

With this demo in hands, literally, I went to my bosses, shared my idea
and vision, made the point that this would only fly if it became open
source and asked for the OK to publish it. And to drive this further
towards that safety idea.

Long-story short(er): The informal approval came quickly, the formal
process still took a bit longer. But for the presentation of Jailhouse
at the KVM Forum 2013 [1] the baseline finally went public on github.

My real baseline did not - so far. But this little celebration story
already became so long - and I did not even talk about what we learned
about safety, software and hardware in the past 10 years -, I think 1310
lines of the real Jailhouse baseline patch do not matter. See below.

Now let's celebrate. Not just those few first months. We need to
celebrate much more you all, dear contributors! You made out of 404
lines of code over 50000, added two further architectures (part of the 
pitch to my bosses which I didn't fully believe to happen that quickly),
with another one on the horizon, enabled Jailhouse on dozens of 
different targets, and kept it alive. Thank you all!

Jan

[1] http://www.linux-kvm.org/images/b/b1/Kvm-forum-2013-Static-Partitioning.pdf

---

From 264de60d953188695eba5d634cafcaec35b9e2e6 Mon Sep 17 00:00:00 2001
From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Wed, 23 Jan 2013 21:33:10 +0100
Subject: [PATCH] Baseline

Contains build system, loader module, hypervisor skeleton and user space
tool to send enable/disable commands.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitignore                                 |   9 +
 COPYING                                    | 339 +++++++++++++++++++++
 Makefile                                   |  31 ++
 hypervisor/Makefile                        |  38 +++
 hypervisor/arch/x86/Makefile               |  15 +
 hypervisor/arch/x86/apic.c                 |  28 ++
 hypervisor/arch/x86/dbg-write.c            |  33 ++
 hypervisor/arch/x86/include/asm/bitops.h   |  49 +++
 hypervisor/arch/x86/include/asm/io.h       |  25 ++
 hypervisor/arch/x86/include/asm/spinlock.h |  31 ++
 hypervisor/arch/x86/include/asm/types.h    |  23 ++
 hypervisor/hypervisor.ld                   |  39 +++
 hypervisor/include/jailhouse/header.h      |  20 ++
 hypervisor/include/jailhouse/printk.h      |  15 +
 hypervisor/include/jailhouse/processor.h   |  13 +
 hypervisor/printk.c                        |  92 ++++++
 hypervisor/setup.c                         |  32 ++
 jailhouse.h                                |  16 +
 main.c                                     | 192 ++++++++++++
 tools/Makefile                             |  20 ++
 tools/jailhouse.c                          |  67 ++++
 21 files changed, 1127 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 COPYING
 create mode 100644 Makefile
 create mode 100644 hypervisor/Makefile
 create mode 100644 hypervisor/arch/x86/Makefile
 create mode 100644 hypervisor/arch/x86/apic.c
 create mode 100644 hypervisor/arch/x86/dbg-write.c
 create mode 100644 hypervisor/arch/x86/include/asm/bitops.h
 create mode 100644 hypervisor/arch/x86/include/asm/io.h
 create mode 100644 hypervisor/arch/x86/include/asm/spinlock.h
 create mode 100644 hypervisor/arch/x86/include/asm/types.h
 create mode 100644 hypervisor/hypervisor.ld
 create mode 100644 hypervisor/include/jailhouse/header.h
 create mode 100644 hypervisor/include/jailhouse/printk.h
 create mode 100644 hypervisor/include/jailhouse/processor.h
 create mode 100644 hypervisor/printk.c
 create mode 100644 hypervisor/setup.c
 create mode 100644 jailhouse.h
 create mode 100644 main.c
 create mode 100644 tools/Makefile
 create mode 100644 tools/jailhouse.c

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..6787fb8e
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,9 @@
+*.o
+*.mod.[co]
+*.cmd
+.tmp_versions
+Module.symvers
+modules.order
+jailhouse.ko
+hypervisor/jailhouse.bin
+tools/jailhouse
diff --git a/COPYING b/COPYING
new file mode 100644
index 00000000..d159169d
--- /dev/null
+++ b/COPYING
@@ -0,0 +1,339 @@
+                    GNU GENERAL PUBLIC LICENSE
+                       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+                            Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Lesser General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+                    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+                            NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+                     END OF TERMS AND CONDITIONS
+
+            How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License along
+    with this program; if not, write to the Free Software Foundation, Inc.,
+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Lesser General
+Public License instead of this License.
diff --git a/Makefile b/Makefile
new file mode 100644
index 00000000..2c411e63
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,31 @@
+#
+# Jailhouse, a Linux-based partioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+subdir-y := hypervisor
+
+obj-m := jailhouse.o
+
+ccflags-y := -I$(src)/hypervisor/include
+
+jailhouse-y := main.o
+
+# out-of-tree build
+
+KERNELDIR = /lib/modules/`uname -r`/build
+
+modules modules_install clean:
+	$(MAKE) -C $(KERNELDIR) SUBDIRS=`pwd` $@
+
+install: modules_install
+	depmod -aq
+
+.PHONY: modules_install install clean
diff --git a/hypervisor/Makefile b/hypervisor/Makefile
new file mode 100644
index 00000000..a808bdc7
--- /dev/null
+++ b/hypervisor/Makefile
@@ -0,0 +1,38 @@
+#
+# Jailhouse, a Linux-based partioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include -I$(src)/include
+KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes \
+		 -Wmissing-declarations -Wmissing-prototypes \
+		 -fno-strict-aliasing -fpic -fpie -fno-common
+
+subdir-y := arch/$(SRCARCH)
+
+always := jailhouse.bin
+
+hypervisor-y := setup.o printk.o \
+	arch/$(SRCARCH)/built-in.o
+targets += $(hypervisor-y)
+
+HYPERVISOR_OBJS = $(addprefix $(obj)/,$(hypervisor-y))
+
+LDFLAGS_hypervisor.o := -T
+
+targets += hypervisor.o
+$(obj)/hypervisor.o: $(src)/hypervisor.ld $(HYPERVISOR_OBJS)
+	$(call if_changed,ld)
+
+OBJCOPYFLAGS_jailhouse.bin := -O binary -R .got
+
+target += jailhouse.bin
+$(obj)/jailhouse.bin: $(obj)/hypervisor.o
+	$(call if_changed,objcopy)
diff --git a/hypervisor/arch/x86/Makefile b/hypervisor/arch/x86/Makefile
new file mode 100644
index 00000000..2db1bf69
--- /dev/null
+++ b/hypervisor/arch/x86/Makefile
@@ -0,0 +1,15 @@
+#
+# Jailhouse, a Linux-based partioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+always := built-in.o
+
+obj-y := apic.o dbg-write.o
diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
new file mode 100644
index 00000000..c79069c0
--- /dev/null
+++ b/hypervisor/arch/x86/apic.c
@@ -0,0 +1,28 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/processor.h>
+#include <asm/types.h>
+
+// #define APIC_BASE	0xfee00000
+#define APIC_BASE	0xffffffffff5f9000 /* Linux mapping */
+#define  APIC_ID	0x0020
+
+static unsigned int read_apic(unsigned int reg)
+{
+	return *(volatile u32 *)(long)(APIC_BASE + reg);
+}
+
+int processor_id(void)
+{
+	return read_apic(APIC_ID) >> 24;
+}
diff --git a/hypervisor/arch/x86/dbg-write.c b/hypervisor/arch/x86/dbg-write.c
new file mode 100644
index 00000000..fe9003a3
--- /dev/null
+++ b/hypervisor/arch/x86/dbg-write.c
@@ -0,0 +1,33 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/printk.h>
+#include <asm/io.h>
+
+#define UART_BASE		0x3f8
+#define  UART_TX		0x0
+#define  UART_LSR		0x5
+#define  UART_LSR_THRE		0x20
+
+void arch_dbg_write(const char *msg)
+{
+	char c;
+
+	while (1) {
+		c = *msg++;
+		if (!c)
+			break;
+		while (!(inb(UART_BASE + UART_LSR) & UART_LSR_THRE))
+			asm volatile("rep; nop");
+		outb(c, UART_BASE + UART_TX);
+	}
+}
diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
new file mode 100644
index 00000000..2d6b66ed
--- /dev/null
+++ b/hypervisor/arch/x86/include/asm/bitops.h
@@ -0,0 +1,49 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/types.h>
+
+#if __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 1)
+/* Technically wrong, but this avoids compilation errors on some gcc
+   versions. */
+#define BITOP_ADDR(x) "=m" (*(volatile long *) (x))
+#else
+#define BITOP_ADDR(x) "+m" (*(volatile long *) (x))
+#endif
+
+#define CONST_MASK_ADDR(nr, addr)	BITOP_ADDR((void *)(addr) + ((nr)>>3))
+#define CONST_MASK(nr)			(1 << ((nr) & 7))
+
+static inline __attribute__((always_inline)) void
+clear_bit(int nr, volatile unsigned long *addr)
+{
+	if (__builtin_constant_p(nr)) {
+		asm volatile("lock andb %1,%0"
+			: CONST_MASK_ADDR(nr, addr)
+			: "iq" ((u8)~CONST_MASK(nr)));
+	} else {
+		asm volatile("lock btr %1,%0"
+			: BITOP_ADDR(addr)
+			: "Ir" (nr));
+	}
+}
+
+static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+{
+	int oldbit;
+
+	asm volatile("lock bts %2,%1\n\t"
+		     "sbb %0,%0" : "=r" (oldbit), BITOP_ADDR(addr)
+		     : "Ir" (nr) : "memory");
+
+	return oldbit;
+}
diff --git a/hypervisor/arch/x86/include/asm/io.h b/hypervisor/arch/x86/include/asm/io.h
new file mode 100644
index 00000000..db900ac7
--- /dev/null
+++ b/hypervisor/arch/x86/include/asm/io.h
@@ -0,0 +1,25 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/types.h>
+
+static inline void outb(u8 v, u16 port)
+{
+	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
+}
+
+static inline u8 inb(u16 port)
+{
+	u8 v;
+	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
+	return v;
+}
diff --git a/hypervisor/arch/x86/include/asm/spinlock.h b/hypervisor/arch/x86/include/asm/spinlock.h
new file mode 100644
index 00000000..df632610
--- /dev/null
+++ b/hypervisor/arch/x86/include/asm/spinlock.h
@@ -0,0 +1,31 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/bitops.h>
+
+typedef struct {
+	unsigned long state;
+} spinlock_t;
+
+#define DEFINE_SPINLOCK(name)	spinlock_t (name)
+
+static inline void spin_lock(spinlock_t *lock)
+{
+	while (test_and_set_bit(0, &lock->state))
+		asm volatile("rep; nop");
+}
+
+static inline void spin_unlock(spinlock_t *lock)
+{
+	asm volatile("": : :"memory");
+	clear_bit(0, &lock->state);
+}
diff --git a/hypervisor/arch/x86/include/asm/types.h b/hypervisor/arch/x86/include/asm/types.h
new file mode 100644
index 00000000..fdb98995
--- /dev/null
+++ b/hypervisor/arch/x86/include/asm/types.h
@@ -0,0 +1,23 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+typedef signed long s64;
+typedef unsigned long u64;
diff --git a/hypervisor/hypervisor.ld b/hypervisor/hypervisor.ld
new file mode 100644
index 00000000..d9dbb107
--- /dev/null
+++ b/hypervisor/hypervisor.ld
@@ -0,0 +1,39 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+SECTIONS
+{
+	. = 0;
+	.header		: { *(.header) }
+
+	. = ALIGN(16);
+	.text		: { *(.text) }
+
+	. = ALIGN(16);
+	.rodata		: { *(.rodata) }
+
+	. = ALIGN(16);
+	.data		: { *(.data) }
+
+	. = ALIGN(16);
+	.bss		: {
+		__bss_start = .;
+		*(.bss)
+		__bss_end = .;
+	}
+
+	.got		: { *(.got*) }
+
+	/DISCARD/ : {
+		*(.eh_frame*)
+	}
+}
diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
new file mode 100644
index 00000000..f7b26a42
--- /dev/null
+++ b/hypervisor/include/jailhouse/header.h
@@ -0,0 +1,20 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define JAILHOUSE_SIGNATURE	"JAILHOUS"
+
+struct jailhouse_header {
+	char signature[8];
+	unsigned long bss_start;
+	unsigned long bss_end;
+	unsigned long entry;
+};
diff --git a/hypervisor/include/jailhouse/printk.h b/hypervisor/include/jailhouse/printk.h
new file mode 100644
index 00000000..8c0af6a3
--- /dev/null
+++ b/hypervisor/include/jailhouse/printk.h
@@ -0,0 +1,15 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+void printk(const char *fmt, ...);
+
+void arch_dbg_write(const char *msg);
diff --git a/hypervisor/include/jailhouse/processor.h b/hypervisor/include/jailhouse/processor.h
new file mode 100644
index 00000000..a6907c14
--- /dev/null
+++ b/hypervisor/include/jailhouse/processor.h
@@ -0,0 +1,13 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+int processor_id(void);
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
new file mode 100644
index 00000000..9169b0bd
--- /dev/null
+++ b/hypervisor/printk.c
@@ -0,0 +1,92 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <stdarg.h>
+#include <jailhouse/printk.h>
+#include <asm/spinlock.h>
+
+static DEFINE_SPINLOCK(printk_lock);
+
+static char *int2str(long long value, char *buf)
+{
+	long long digit, divider = 1000000000000000000LL;
+	int first_digit = 1;
+
+	if (value < 0) {
+		*buf++ = '-';
+		value = -value;
+	}
+
+	while (divider > 0) {
+		digit = value / divider;
+		value %= divider;
+		if (!first_digit || digit > 0 || divider == 1) {
+			*buf++ = '0' + digit;
+			first_digit = 0;
+		}
+		divider /= 10;
+	}
+
+	return buf;
+}
+
+void printk(const char *fmt, ...)
+{
+	char buf[128];
+	va_list ap;
+	char *p;
+	char c;
+	int v;
+
+	va_start(ap, fmt);
+
+	p = buf;
+
+	spin_lock(&printk_lock);
+
+	while (1) {
+		c = *fmt++;
+		if (c == 0)
+			break;
+		else if (c == '%') {
+			*p = 0;
+			arch_dbg_write(buf);
+			p = buf;
+
+			c = *fmt++;
+			switch (c) {
+			case 'd':
+				v = va_arg(ap, int);
+				p = int2str(v, p);
+				break;
+			default:
+				*p++ = '%';
+				*p++ = c;
+				break;
+			}
+		} else
+			*p++ = c;
+
+		if (p >= &buf[sizeof(buf) - 1]) {
+			*p = 0;
+			arch_dbg_write(buf);
+			p = buf;
+		}
+	}
+
+	*p = 0;
+	arch_dbg_write(buf);
+
+	spin_unlock(&printk_lock);
+
+	va_end(ap);
+}
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
new file mode 100644
index 00000000..37521b60
--- /dev/null
+++ b/hypervisor/setup.c
@@ -0,0 +1,32 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/header.h>
+#include <jailhouse/processor.h>
+#include <jailhouse/printk.h>
+
+extern void *__bss_start, *__bss_end;
+
+static int entry(void)
+{
+	printk("Running hypervisor on CPU %d\n", processor_id());
+
+	return 0;
+}
+
+struct jailhouse_header __attribute__((section(".header")))
+hypervisor_header = {
+	.signature = JAILHOUSE_SIGNATURE,
+	.bss_start = (unsigned long)&__bss_start,
+	.bss_end = (unsigned long)&__bss_end,
+	.entry = (unsigned long)entry,
+};
diff --git a/jailhouse.h b/jailhouse.h
new file mode 100644
index 00000000..fd94a1e1
--- /dev/null
+++ b/jailhouse.h
@@ -0,0 +1,16 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <linux/ioctl.h>
+
+#define JAILHOUSE_ENABLE		_IO(0, 0)
+#define JAILHOUSE_DISABLE		_IO(0, 1)
diff --git a/main.c b/main.c
new file mode 100644
index 00000000..0e10aa5a
--- /dev/null
+++ b/main.c
@@ -0,0 +1,192 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/firmware.h>
+#include <linux/mm.h>
+#include <linux/smp.h>
+
+#include <jailhouse.h>
+#include <jailhouse/header.h>
+
+#define JAILHOUSE_FW_NAME	"jailhouse.bin"
+
+#define GFP_JAILHOUSE		(GFP_KERNEL | __GFP_NO_KSWAPD | __GFP_NOTRACK)
+
+MODULE_DESCRIPTION("Loader for Jailhouse partitioning hypervisor");
+MODULE_LICENSE("GPL");
+MODULE_FIRMWARE(JAILHOUSE_FW_NAME);
+
+static struct device *jailhouse_dev;
+static DEFINE_MUTEX(lock);
+static bool enabled;
+static char *hypervisor_mem;
+static atomic_t entry_done;
+static int entry_error;
+
+static void enter_hypervisor(void *info)
+{
+	struct jailhouse_header *header = info;
+	int err;
+
+	/* either returns 0 or the same error code across all CPUs */
+	err = ((int (*)(void))(hypervisor_mem + header->entry))();
+	if (err)
+		entry_error = err;
+
+	atomic_inc(&entry_done);
+}
+
+static int jailhouse_enable(void)
+{
+	const struct firmware *hypervisor;
+	struct jailhouse_header *header;
+	size_t hypervisor_size;
+	int err;
+
+	if (mutex_lock_interruptible(&lock) != 0)
+		return -EINTR;
+
+	err = -EBUSY;
+	if (enabled || !try_module_get(THIS_MODULE))
+		goto error_unlock;
+
+	err = request_firmware(&hypervisor, JAILHOUSE_FW_NAME, jailhouse_dev);
+	if (err)
+		goto error_put_module;
+
+	header = (struct jailhouse_header *)hypervisor->data;
+
+	err = -EINVAL;
+	if (memcmp(header->signature, JAILHOUSE_SIGNATURE,
+		   sizeof(header->signature)) != 0)
+		goto error_release_fw;
+
+	err = -ENOMEM;
+	hypervisor_size = PAGE_ALIGN(hypervisor->size) +
+		PAGE_ALIGN(header->bss_end - header->bss_start);
+	hypervisor_mem = __vmalloc(hypervisor_size,
+				   GFP_JAILHOUSE, PAGE_KERNEL_EXEC);
+	if (!hypervisor_mem)
+		goto error_release_fw;
+
+	memcpy(hypervisor_mem, hypervisor->data, hypervisor->size);
+
+	preempt_disable();
+
+	atomic_set(&entry_done, 0);
+	on_each_cpu(enter_hypervisor, header, 0);
+	while (atomic_read(&entry_done) != num_online_cpus())
+		cpu_relax();
+
+	preempt_enable();
+
+	if (entry_error) {
+		err = entry_error;
+		goto error_release_fw;
+	}
+
+	release_firmware(hypervisor);
+
+	enabled = true;
+
+	mutex_unlock(&lock);
+
+	printk("The Jailhouse is opening.\n");
+
+	return 0;
+
+error_release_fw:
+	release_firmware(hypervisor);
+
+error_put_module:
+	module_put(THIS_MODULE);
+
+error_unlock:
+	mutex_unlock(&lock);
+	return err;
+}
+
+static int jailhouse_disable(void)
+{
+	if (mutex_lock_interruptible(&lock) != 0)
+		return -EINTR;
+
+	if (!enabled) {
+		mutex_unlock(&lock);
+		return -EINVAL;
+	}
+
+	vfree(hypervisor_mem);
+
+	enabled = false;
+	module_put(THIS_MODULE);
+
+	mutex_unlock(&lock);
+
+	printk("The Jailhouse was closed.\n");
+
+	return 0;
+}
+
+static long jailhouse_ioctl(struct file *file, unsigned int ioctl,
+			    unsigned long arg)
+{
+	long err;
+
+	switch (ioctl) {
+	case JAILHOUSE_ENABLE:
+		err = jailhouse_enable();
+		break;
+	case JAILHOUSE_DISABLE:
+		err = jailhouse_disable();
+		break;
+	default:
+		err = -EINVAL;
+		break;
+	}
+
+	return err;
+}
+
+static struct file_operations jailhouse_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = jailhouse_ioctl,
+	.llseek = noop_llseek,
+};
+
+static struct miscdevice jailhouse_misc_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "jailhouse",
+	.fops = &jailhouse_fops,
+};
+
+static int __init jailhouse_init(void)
+{
+	jailhouse_dev = root_device_register("jailhouse");
+	if (IS_ERR(jailhouse_dev))
+		return PTR_ERR(jailhouse_dev);
+	return misc_register(&jailhouse_misc_dev);
+}
+
+static void __exit jailhouse_exit(void)
+{
+	misc_deregister(&jailhouse_misc_dev);
+	root_device_unregister(jailhouse_dev);
+}
+
+module_init(jailhouse_init);
+module_exit(jailhouse_exit);
diff --git a/tools/Makefile b/tools/Makefile
new file mode 100644
index 00000000..8d065557
--- /dev/null
+++ b/tools/Makefile
@@ -0,0 +1,20 @@
+#
+# Jailhouse, a Linux-based partioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+CC = $(CROSS_COMPILE)gcc
+
+CFLAGS = -g -O3 -I.. -Wall -Wmissing-declarations -Wmissing-prototypes
+
+jailhouse: jailhouse.c ../jailhouse.h
+
+clean:
+	rm -f jailhouse
diff --git a/tools/jailhouse.c b/tools/jailhouse.c
new file mode 100644
index 00000000..11d66e16
--- /dev/null
+++ b/tools/jailhouse.c
@@ -0,0 +1,67 @@
+/*
+ * Jailhouse, a Linux-based partioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+
+#include <jailhouse.h>
+
+static void help(const char *progname)
+{
+	printf("%s enable|disable\n", progname);
+}
+
+static int open_dev()
+{
+	int fd;
+
+	fd = open("/dev/jailhouse", O_RDWR);
+	if (fd < 0) {
+		perror("opening /dev/jailhouse");
+		exit(1);
+	}
+	return fd;
+}
+
+int main(int argc, char *argv[])
+{
+	int fd;
+	int err;
+
+	if (argc < 2) {
+		help(argv[0]);
+		exit(1);
+	}
+
+	if (strcmp(argv[1], "enable") == 0) {
+		fd = open_dev();
+		err = ioctl(fd, JAILHOUSE_ENABLE);
+		if (err)
+			perror("JAILHOUSE_ENABLE");
+	} else if (strcmp(argv[1], "disable") == 0) {
+		fd = open_dev();
+		err = ioctl(fd, JAILHOUSE_DISABLE);
+		if (err)
+			perror("JAILHOUSE_DISABLE");
+	} else {
+		help(argv[0]);
+		exit(1);
+	}
+
+	close(fd);
+
+	return 0;
+}

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/64c51a19-06d7-5333-c7cb-6581e547bf17%40siemens.com.
