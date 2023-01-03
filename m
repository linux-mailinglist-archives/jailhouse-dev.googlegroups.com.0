Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFG52GOQMGQEBBNQZLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606365C5AA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Jan 2023 19:06:14 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id w13-20020a05651c102d00b0027ff6c66a5esf1136969ljm.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Jan 2023 10:06:14 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672769173; cv=pass;
        d=google.com; s=arc-20160816;
        b=N2/5mEqE928pb3bFXDMu9jJzg405PFYIF67/HnV76CyGR6sZilv/rK4xwYDdIztKv5
         szuJqXq+5eCcs3ZqzcjpOSVQH+xeuShRbW8YuWDe54lm244cBcIflSDkYHY7fqu43nt4
         KaR+4lKBxnAn+OKkCbowFwZo2Lx+qYq+QI46E+PSjwwq3tIjTz+tWkuDpx0uFCH7oEQB
         8NL42XgrtM3uqMLOzPjwHOAqhl/0k4hRM3Dnulo7XCRVj691gBS9NEmOlYAtPjHoMds8
         7X1+kmElmukdYO/IfBh2dzLs1Oy0s79l/WkxJaZ7rP33Ikt3nK72m+eI6T6sAw+bvyUo
         6bWg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:to:content-language
         :subject:from:user-agent:date:message-id:sender:dkim-signature;
        bh=3t9prIp0P4wpAFGDQcYbTYg2b9muBV+e5KWBM60/tWY=;
        b=XriRXZ+i1PM7sJzuUWKFkhN0GVKgRejL2lLCfcPCYV72dsmScVy3CTFmUi5vOeFq7l
         napOPDi6Nv7zljyLKW9SaeWPw6gw3naKm2jCjzI6pDEkap52DUWZg7hTXQNxtKhEB8Ch
         f4WSnho5dwwT5HrAW3xjRgig8ZKz2c4GqafuV/m5BVAz72DbDH6UMBGL9mDHEYmMf4e5
         N7CqUwlNuPwElBTsJKXrpgJ78mPs0RWsFI6BzZu7I/lW6Pl0MD/v7PLUiIG3wjPfeLex
         qJDkClhzGLA+vFGEqPIDJdOLPgmOTZKASUQuVpVVPSZbQS5b45oK/9Phk1JsF1j+MeSM
         9bbw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=cer9a6sg;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.84 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:to:content-language:subject:from
         :user-agent:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t9prIp0P4wpAFGDQcYbTYg2b9muBV+e5KWBM60/tWY=;
        b=dHWY/eJp/5XJ4oSJMXuHvfr+BOW31B7npga1arusZYuR9x5pL2toP2bdsgRQp/UOIl
         tT0sfHJ3F9X94DcFRS5QAeltkyfI79NfcV/3ch7eJ+L//cs2ejdX8ZFcbaLcVUnJz87k
         itVEpqGu9njHsda5r3zj+O4ins8I5fOW6jV4tb3JbowsQrBtsT7Rq/akcINpzkPQQ644
         r5ik2sVul81JZabF/sB4Ysd+4wl9ZLSi5uCPllaPzvLd50zcgIjKvqBxNaojjEMfM1dn
         Z7OGZfcQEcSOQoR8oQfNpF9f7g4Ty8iZhdnJk9HUkW8QLZjVx+OQkXg7/1g7aTAVidhj
         MRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version:to
         :content-language:subject:from:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3t9prIp0P4wpAFGDQcYbTYg2b9muBV+e5KWBM60/tWY=;
        b=k/ZPNEzx33U+TFE2fMncB6WtH5Y7eV12Q755mk+XNjdMZTJcY/3II/Tjxyx0wLsjLS
         ab2h7kG6XNptrllr/eCqhqTniL9CUXp85JQBRZ5xyHvvchEWKSHeFHvmA4/98KTfevOR
         ZP2eoh+dUXWA/iDTOJLLBFTj38SJp1GOziaYvFZgxb9KHgOQui2FXOeE90MwpoIWup6W
         muRX22Q8Pr3DEL4jppC66rb4HmDeVGUrEGne6P6Ywlg/d8Z4Lx1AfoqB5L18CteA/ucn
         FRScaRukohR+pRIw90CAdgf3PMglPCTsQNq2RQoPnPb7FjA6a3scs4uVmVHmX4H6uq/h
         /QIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koSGfTewxoDRBgLG+C18npwbsa1BxIlf7I+TuBZa0Ngih2mazho
	4JMMradbzschvXE1ZC7hCw4=
X-Google-Smtp-Source: AMrXdXtlQ4P6JUGqW1Fa9zXIqio3fIsom/HnLB+1b5XuEPL4KFa1GAVYrsh3IDU6fkWMOrHNHKjtDw==
X-Received: by 2002:a05:6512:280e:b0:4cb:3b24:8395 with SMTP id cf14-20020a056512280e00b004cb3b248395mr467883lfb.399.1672769173691;
        Tue, 03 Jan 2023 10:06:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9002:0:b0:280:210:b2fc with SMTP id h2-20020a2e9002000000b002800210b2fcls162761ljg.4.-pod-prod-gmail;
 Tue, 03 Jan 2023 10:06:11 -0800 (PST)
X-Received: by 2002:a05:651c:3c9:b0:27f:c4d7:7ea7 with SMTP id f9-20020a05651c03c900b0027fc4d77ea7mr6994937ljp.51.1672769171698;
        Tue, 03 Jan 2023 10:06:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672769171; cv=pass;
        d=google.com; s=arc-20160816;
        b=OYjXugHJWRb328FPCS8VNWNdXm2qPs024yI9ozWw0YRY7TULl2h7o3Fh4SorL/Nxw4
         StJy/ZStqXIEawj24CeOHXfp9zLGYkdWIfvpS1iz7USP6dVFRXzQUn4oeeZfqqvn/oPb
         tzD7HmO4qBY+tEU548MQSSP1CD8gRR5CfEhMfHQf6lcNxSM16WKyC6SKlw5PEser807H
         Ght4i2aLEiLX7xSeQBxls2yHhcXhJo91UU2x9+w7wnCwAcdXIsBhYut8PaTCfUIxyiDJ
         oESGagJdBmGFhBHF27MgR8q/Ze7AaeBmcCmJUG+xKClUib/R0LYhx/vR3bKTfzqW/DWP
         BbWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:to:content-language:subject
         :from:user-agent:date:message-id:dkim-signature;
        bh=YXOTD1Nwwwjw2vpsxNva9YtqIyKhCozWnzH4/ijZXEQ=;
        b=JeHknmobCUwSU2mMhUnzbkBLEEuSPB+kRVxuNh5mOiCVP1tYuy2wgW1sL35lqyPFl1
         oMKysJAX+Bj/jMB8I0gbylv1E1Gi/Rfx6a/kClvFaLZFupcGjIc24e5VaTiuVEanycub
         u76vZoaJEIp97FpTiKqCDrZ5wlmRuUDo8t6Rs9gP2khNBnoSAIqBfxktjasN8n8763Qx
         RINXuQqtik/6S5I1u+LjWotrafLYO4oBvZww+QVSojjTZzqJ/TWiujP4XNucVfDJiDXw
         9Be4itzRyhswPHIK1IWXy5g2aoKZYibWCOwJM7AHotzekywm+mMjCuYpbyXtF9F1Mova
         OmbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=cer9a6sg;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.84 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2084.outbound.protection.outlook.com. [40.107.8.84])
        by gmr-mx.google.com with ESMTPS id q26-20020a2eb4ba000000b00279a2f014e6si1279234ljm.0.2023.01.03.10.06.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Jan 2023 10:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.84 as permitted sender) client-ip=40.107.8.84;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQCx23PEmtWoC6Uw+51nrDcqL3wcWafYj2IPbyXtfAXBMj5G7Oaxqk+KbTXNKr3+jEyCAiEjioBHEvpC2Ztylw2YBhDqQvQwmrVTwjA1kYWOafPUcLuKokvn3wZqpt8vvLbY2bzH+55LxgHqUx9UpVP5MEdQUSfCIXrfQnyHKoYC4H8dK8eVXuJJJIFHVYTe0VnA2aRmB+mxfWLDVVEPNzHYp+Mw69//RdCjzlatF/VnYIwg+bAAoWTDn/8p0AcMA9UAg5+Bdzj5EFOIjjB2Mw1r/4iSJcL13o0l67eTKDe8z43J2JANzeWJJuM9aDfYh1F730vrbLewjZGYzdzGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXOTD1Nwwwjw2vpsxNva9YtqIyKhCozWnzH4/ijZXEQ=;
 b=SbFDVTUldIiz/IQeeLBTzxE696bNrYmwpGEZjqebsSJsZ8kHYMH5uPS+KovZQU81kbbA4tVuDKnf7aMCmfyTNKCvgx9SL2apRiy1QXsVw/wUaUswzkRmFSN8qTTsdULkkkwPV50ub1YLswb9+d3t7HDQ+lMAn7wSXg4CQebpEHTEB9ZdEjq76L2qCIGkXTrG8r1IxDqkAH5G9sJkZ0riHrsKpXD4/HFRJvcQW954+wumuHaOtR5O/tSoB7rPXfRpWrhmrAwPUHMNnfDRVBo3/ezCkYKInCMNTnrxqtSFX8zfqp9ynD+GI/e3lJqkJBy5Io/d+TqVCM5mQE/zdrW8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DU2PR10MB7767.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 18:06:10 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:06:10 +0000
Message-ID: <778388b9-9ac4-e5b2-0077-78d78501d587@siemens.com>
Date: Tue, 3 Jan 2023 19:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] x86: vmx: Avoid double-accounting of MSR read exits
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DU2PR10MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 089513a8-e260-4ec6-87c6-08daedb53144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpuAepK0ARj2yWVJ4tjNqoMlEDyO0YgXAf9cnPYdcvdXzg0PaKpXp9N4u12kiF30/R1Uz87jbii1IutwZmYjiCceOyP9RvC+g80hNbR2e3du0qehptHPx8LoPLrRYj2HJfe6bwMLQKl8cmuCjs0zhz+Bw2AwGWVvTXa6d4Z+S6jWX55KxEsCaXIBWvPAlNcK0vkChBwo3mUSqtFmaPUZF8iFkbJRg7TUdFqU7UezCkyN7BjuDbiyY9D1/HHw6FiocsrSNGINc1rzySp9mTyWjKUy5FSmoKSXZONhsSahiNTtdQGXjqRQgBDM82UiQU+VYWqDvE1v5ZtZBpRnjMnWHow2bs43riUJ/HrN6cDj36NiLgb+RdvY5LS6fCLJsOls24MSCqHJgAezQ7JzRr0h4AEUGY4QOXNnaPlUGkDeb32zdmuuFNv2SGyjn0rg4SIQ1M9lw+4Aey1oeFfSLiuDgrqWe20LVl/0c47jQPs77MGFGbtDF0t0UkOD+y2RzciM59xqSVHpRiWio665zQj7wyeeeaHnZw+MQUTSrE2WO7FDs+CoR4zJH2hpOMX4/vLy6VDKUC/LVpL6UBdpvmSuE4+BuPYbWUMBW67DhIYdZqzRef14bqHIPbwHUYtL/UK/o53wJiCijm4dmeDNqsRgpAWpqhShJGcD+Wq7uKg54xYlaw4ZN8r6TpwcA1LKgXlcRXx5ceeYRuoKwVbxigcZu0xRakGrdJ3d1ESX4zczJUOumrNIqq5e053RFyDHU3BSPy1RFjwZDhCJ44KfLF7Lyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199015)(6506007)(15650500001)(44832011)(316002)(83380400001)(2616005)(26005)(31696002)(478600001)(6512007)(6666004)(36756003)(186003)(6916009)(2906002)(6486002)(5660300002)(31686004)(82960400001)(38100700002)(41300700001)(66476007)(66556008)(86362001)(4744005)(66946007)(8676002)(8936002)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjluYmJiZVI5V2RzL2tYS0hpZWZLVTUxeC9wTU5tQ2NUVWRwWVEweDhtRTRL?=
 =?utf-8?B?RlltNmJrMnFhOHl3NlZJMWw0eFdqNW8rYWJzdEFxYVA0a21RanI0RVliU095?=
 =?utf-8?B?YVBqT1ZmNHN2VnNGaXdTTFg3ak9yMUp0dmF2ck4yMjI4UWNvY20vTnN3bmFN?=
 =?utf-8?B?NCtXcGV1blVxNnVWTXMvNktROHpJQkRxYWxSVkRDanpSNlpEOXd1MEsyZzJG?=
 =?utf-8?B?RU9UUFlBRnNmUWNlRlpoVE10ajJDZkttU1dPU3UrcmQyNVY5Vi9tdStndUJt?=
 =?utf-8?B?MmcyZEhUQkxDNlgwMmhkNm5hMnBVT2ZUcFlkMGp6TjZoQjBNUC9DbDV0Mjk1?=
 =?utf-8?B?NVdrOUVLRVVwcXdJSWtFRnlkWFdEMG1WWnRkSGNvQ3B2eS9EcHV5LzZCQlhK?=
 =?utf-8?B?NDhQSGpXNXkrc3NoQVdBQkFZenlQWFVXZkE1VTUxS2J5aTNPUGRSQjRIOEUy?=
 =?utf-8?B?cTRHcHl6cjU4UVA0cTV4dGtXMUVaUGRzS2RoL25xdTNzaWpFb0lGTHZ5VU5N?=
 =?utf-8?B?ekdxNXhuSEJUZFZockd5MWQwTEw4a0NPNjF2eFpCN3Vsekg4UnZrZFQyRmpX?=
 =?utf-8?B?a0dsMHNnUFdMeVRONHJiaUdGUGpETGFtNWZTMGZmYkd4a1pKcXgyRThIdDYv?=
 =?utf-8?B?S3ErNGpBbEtJTUpHMTJiNXB6UDdaN2lQSmFqVTlLcS9MT3U3bVZiVlh4Q0N2?=
 =?utf-8?B?a2hGZzRZMFBZNmpndVNQRFc1TjhybVBaQTFKZk1lUjIwRDBLbnFLSWJPbWtk?=
 =?utf-8?B?YjNsRE5ua0F2cHFWTkFqdVVBSG05Q0p5cjIzZ2Z4TXgwU2J5WHg1eEVoOU14?=
 =?utf-8?B?SWN0b1hUN0JPUVNxVmxuY0R5VHNERWxFN1FGTUZYQ3JxNzFIOVhpSnF0TUdQ?=
 =?utf-8?B?VTdxaG1WSm40SnZXSGdQN1R6aGxGTHczeUFBTXhYck16ZzUxQzVKVms1S1Zh?=
 =?utf-8?B?azEvS2tlZXRsVEhDNGlQRjhiV3IxYUs4bE91c2V5V0tPTk8vcnE2TklXYm9l?=
 =?utf-8?B?a25jTGRENE15c0ZKaFJTSWI1Z0pyM2NmbGZ3VjY1c3ZOMkF3WEIxUVlXNnhj?=
 =?utf-8?B?TnM1Smg4TFJMQkdrWWdydmN0MDFVdmxrQ3dvTEorTlhnL0g4YldudWZiNHgr?=
 =?utf-8?B?L3VmY1JwZ2d4d3o2Tk1nVEdtSnpyTVdrRUEzanJFbDBrT1BhUk1xcmJHdUMy?=
 =?utf-8?B?NlRkZW5teTF4NWRHYVZXeFQxOTNSRjQyQWdSblhOL3Vqd1hRWE1RVEVnZmVT?=
 =?utf-8?B?WlpJQ0RzZlUvNWd4cnhuN0xNNEFxNldEdk1kc0QxaTNqWnhmVnhJdWIvaHEy?=
 =?utf-8?B?dUlEb0dCa3h1NytSd085QzljRTdWeWJQVTlNdTRCZE9mUWJ1Tm1jcW1GSS83?=
 =?utf-8?B?WjFjbmNxRUlKallCNFp5M0ZwRzVvNm9GTlNHdDcwVjhGSklLMjRhN3gxaG1z?=
 =?utf-8?B?bWFzQkpPYmlqZGhhOGdPejU4SWVhV080WGlDSVZlZnBUL3p4M1ZzZnUyaUxL?=
 =?utf-8?B?TVlvQkltTy9ZZThSRVhhQk0zdHV0WG9GZ3dZQjBreGhzOWlzYTlSL2hPci84?=
 =?utf-8?B?dndrakJFV2NaOUZMRWduU2Y1YUV5ZldZM2QySnVQd2E1eU9xaXdvS2J1Q1hP?=
 =?utf-8?B?SFpaM2owQWNJR3JtTzFVTU1tTUdWTXMwMm9QR0s0M1RKZ2ROWDdOaGF3Mng3?=
 =?utf-8?B?TTBCTVd6Zms0SC8yY3Qvd0FBdU9IWllhVSsyUldaeTkyeGJyTnpSeGphWlRE?=
 =?utf-8?B?T1c1K0VRRkVnN1RDVWxoWEtMbS9qWlZEa1M5V0VXOGU1dFJxaGZPWXZGdzlz?=
 =?utf-8?B?aDZOUlJrblJFb1Rra3h4cEVlN1VIUHlzMDNuUnZGQVNmNGxVeVV1OXlMN0o0?=
 =?utf-8?B?czRqVC9EZ09vZzJ6SDhIcWNCSTJ0aVpSeDZ6Y1dDQVBHWEw1dmttN3RqQXpR?=
 =?utf-8?B?TVBhaUJuemljSytsbXpwaXl2VFMyOVI1REp6M1hKL0doQ0ZHbDFlTk14cTMw?=
 =?utf-8?B?RDlkRnhoQUh0a2VFNnZTaHdrRVQ3UUxKNFY5N2thL3RNdEpkUURGbkRqWkFV?=
 =?utf-8?B?N05RV0c5SnNhTFFxVHY4VVByclMrRXBXekVIZ2pSUHRPY2srR3FSMFU3YzZ5?=
 =?utf-8?B?SnZ3ZUlYa1FDNjFlUENoNDhkZE1XM0pQK1g5TG5CV05hbGE4KzMzbTZhSmlP?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089513a8-e260-4ec6-87c6-08daedb53144
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 18:06:09.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lotArO402MWchCns3XXkcjRs7V64XC+32dJciR6J+3YZZWyBxunf4kqM6F9GWaDVO18nK81WRwc2T8dUBf4/JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7767
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=cer9a6sg;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.8.84 as permitted sender)
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

From: Jan Kiszka <jan.kiszka@siemens.com>

vcpu_handle_msr_read already takes care of accounting.

Fixes: 3e9c91302ee5 ("x86: Push MSR statistic down to the dispatching points")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vmx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index 5a69710d..f610e507 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -1173,7 +1173,6 @@ void vcpu_handle_exit(struct per_cpu *cpu_data)
 			return;
 		break;
 	case EXIT_REASON_MSR_READ:
-		stats[JAILHOUSE_CPU_STAT_VMEXITS_MSR_OTHER]++;
 		if (vcpu_handle_msr_read())
 			return;
 		break;
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/778388b9-9ac4-e5b2-0077-78d78501d587%40siemens.com.
