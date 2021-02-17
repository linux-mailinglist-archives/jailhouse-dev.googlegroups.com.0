Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBXEEWOAQMGQEC6Y3IQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7140A31D5A4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Feb 2021 08:14:37 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id g5sf5073737eds.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Feb 2021 23:14:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1613546077; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q9luVJrRIsvqQx3mgMfsNUqNWLVYyu1Vm0iYVOmVVqCshIlV5ZXL7JgoTdVEpn6nY9
         jI8+Vq09TDuauEi4oD/xG7g3DEmawZiTFHD4TBB55JHI2f7PT7ciVNXEf7L0iK/xMvaI
         JNdPcySjy7vUPGonxFu6CW3TEUOasOR9UQmdlR+d+lVFPZJyeThnbbStjdzwBTgKPi1m
         5CC7gOzhjtfrDQwBwu0qbBfb9iTghDU/bCwZY0laswS1odzx4LhCR3J6ZCUDftZ1G+EJ
         AeSFtQn7qr0uQU5yaNy+wig/+rWQL3dXCBMCU3evvddAbSye/Cf6uzNR3v5TKIQk/W7E
         bKyA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=fJk5P8oKaid58Jzda+6Z4kEtnwssfrapRVTXIGqSlFA=;
        b=tsgHo+q7ozXLI1z+9hmoRjsfELHVdbWxntLEtLTJEheMVGPa2EyPVz/aQEWdPK8/w4
         BuLAC9BATvLTcvTVI9IAYPO9D0uqoGCNK69VJH0fpxlMcC/lR6q8Wsge74qPkzoQbnkj
         7K4rJblbTYccYsy5cB5QXborgJsZFK168fcYf+6jwPbxZxLisJkjub7o0FRj74UN9n0R
         k+zIBvG93m5vbIEY/FQDyxTUD+yrzt7Au6rPeJKP/fVpfux7zxBNstmIWFdPUAEWJ78N
         U4CUyzLUS3HtRgvi778NstYSo+rUfKnU1yDjagz8Q3iGsOeXbhQMCAeSMm1eb8EUsir4
         CYRw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=hJTOZNsO;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.21.95 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fJk5P8oKaid58Jzda+6Z4kEtnwssfrapRVTXIGqSlFA=;
        b=DJW6dGvDTJoTHthLGTaoYrpWIhGKkR3elBh+07Hx8A37GHRAOdKbHCZzsplSjcEUCN
         7ZjONf9GB95Jz+jF7EmQB66mfieTdbLuWxm5ZFFwLbuine3shlsMmTArhLEhietBrb7x
         tP+kq3CgIbdUm9bXvUvGzndiVYrDDI9M+MUt1q0JZeY8tKWO96LyP4gagqWmGwkCFayx
         ifuw2C762VyCAUTX9Ep3Oh1rWlsbtBImVunvcKfJ55snv82YwHHvUnwk9kAf7YYcwaof
         WO8PWMMcZBXFxWghIl0m7Dj0gaume0g/W8mBFbJ+qpwJMgkdcbyNYYpftDNZhwn+8NXo
         OhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fJk5P8oKaid58Jzda+6Z4kEtnwssfrapRVTXIGqSlFA=;
        b=Eyh/IC2FclQ0JeX+X2vqct3Gv6vxHnmu8w6jNw5jgxQjvUCS4Jn+e4LOJJPCr/8Grw
         0X5WMvj2ERqApSXxxIKqsAVgGeFlBvK6Sp9gcqTs+0y0/pA1N7aFo5WDGqOQIwYLhuCo
         jngMGqkdrgKIRWIo36OSEfi3dcjxPg9KTOXMbaOVevoY4mCR4P9p/veBM2cByEEY1ptI
         X3IXg5643MTTaobNtBRs2JB6c/27JGjwHZUDlGt86+ijsEmPFZRaX59T3iuYitmWDiUm
         mn0ViLAt9sGwkPiNRUVroWPEEuLOth52yPnKOTmvDcrBYZMmddtLj922tINwPZI1Jsem
         Gndw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532kud25eqNGDRyzSuc4mTJd6+N0ZPCDMTRoNyWERUWadFuQwVHn
	n1TivPEthI5X6fL2Rf8Z1o4=
X-Google-Smtp-Source: ABdhPJxaSurHg0abRgAZ665s6GygTmoj7n/StA9xmBlCP/aNqbbi6Cj59rTYPOWoKvvkSFv5jsE/dQ==
X-Received: by 2002:aa7:da87:: with SMTP id q7mr372659eds.335.1613546077155;
        Tue, 16 Feb 2021 23:14:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:72c6:: with SMTP id m6ls592049ejl.2.gmail; Tue, 16
 Feb 2021 23:14:36 -0800 (PST)
X-Received: by 2002:a17:906:40cc:: with SMTP id a12mr5724849ejk.327.1613546076197;
        Tue, 16 Feb 2021 23:14:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613546076; cv=pass;
        d=google.com; s=arc-20160816;
        b=hBrnnFXP6iRn0qxFXxbmA4GR8DDbfFub9ytI+srlL7aZ7A5RWSVzIQH9gV2lFfryNH
         ChXrnyBt0jeZTrDSDEEMlU5H1hRAH+OgwPqBcMXMuWdp90MfC1E+7r+nhPUW9DbMbT3o
         dm9BeIaj0LWXQkkWVT5aYHD50kDBYy5wwWxDk7cu4eN5tcm5tAMXCoOJYATpYjVFst5o
         pdhJU5pG3InC7cqF4WMmfQ4qFD6XVg8XCNKwlTUwH5jtWdI+p4Hva6kPkS9DGxiel3RD
         JKuOB5XCLrSP9+Vvi74cmD8nd5EAVHUpscSCQn5s4lnnsutwgYl4A2DD3CxynVU26pZc
         lUxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=TjAD7BsepVTpuoBe8aaTwm9sxbsLAMN9Ztto4xfrlX8=;
        b=iWjHgyED0WEG4SnmpnXQf/YNXCBOaduDUKdqAgkHqNgiXxb0MJGx+t1MUqRjed7o9c
         GrZc6rheB2iSJ9yE8kSVA27Lgij/09/WUyRS3y7epzCpfWimwDTS4jJlc3DlnFmeCg4e
         UPlALqC2vqT/WyZRd3btCH7gwDdOE54bP1VtkvXWbTJD9R9kjTQpF05WtKcfvH3ZWjBK
         CXGtmUdyWhEC2Pi8HZjCC1Yr7lL2q5whIwyyVIMkz43rh//i6KpvJLXMeXJ/fAEAkwSs
         Ny52fwcRlFQUpPEwg1b57cHKGAS+aKeo6hmJAP2fWumZu3Tr76eg33SnGj8ZjpsiVRnP
         AeOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=hJTOZNsO;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.21.95 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2095.outbound.protection.outlook.com. [40.107.21.95])
        by gmr-mx.google.com with ESMTPS id c12si46559edw.3.2021.02.16.23.14.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 23:14:36 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.21.95 as permitted sender) client-ip=40.107.21.95;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+a5fYPzOHj1l0h+U94nUtDtHDyU0NIMRhYjmK/XH0ZEGRnxN5Gs9jLlg19764QHnzGWf7KtH01We/d3rGWP07kPW1GMWeQ4+DwuiSAty9JMsq07l5oxZzWzzf8Ro9/lSJnanWH3MRyP1oeP7B9TwnsHORZ7VPb8+m3tcw0Q6rAIIcEFPMvPAFqKvuv+3jz+7uwcTonBm8ldc16L7VMvIIA8pSVEmTxnKPebPkXvkeRFonA8VizKfjJcPILP1OgsBiPEbWZPJWg2UFIni8dpRYS4Uaf9HimJfNQ4Q+TNVnu5MaLXuBY0p2y8Y8NGR3uA8jMljs2AcrYjyvuYBiXKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjAD7BsepVTpuoBe8aaTwm9sxbsLAMN9Ztto4xfrlX8=;
 b=h9t+rDPeRT3/Fgm6nBHNIqeuhvIdeWC2eQTlejnF+O4N8APOxbK+wN/lMALpQkbqy4lCVMx6zTY4+DykkM69GQPfg46H0zKY9+cb0mWpJYm96ysjeJoTOhP4SoYDPjC650D4JXitr5rZTDuu6/yD+RkAKU6mtP6qqDlosa1KYH3QkuhzV6V3i9DDX224J98IdchQ01FGn94xmfrEHfsnyFv4p5zu5CWn7L/lh+JbLdIJZeL4pktoPgYu54calV7/E5rmPu3CTN2IpQWaTHK8KQof9Q4eVQyA5hA0O4q0Gm7GYr+fp3AIgPvr1iDZkw6h9Q+qJJNPyio7/qNJn+Blaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com (2603:10a6:208:ca::33)
 by AM0PR03MB3569.eurprd03.prod.outlook.com (2603:10a6:208:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 17 Feb
 2021 07:14:31 +0000
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1]) by AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::b874:4798:756b:9da1%4]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 07:14:30 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Overflow in MMIO registration
Thread-Topic: Overflow in MMIO registration
Thread-Index: Adb9/f7M/lP2EmDISBKFTcmUvnX2LwADtf2AAGQZjFAABO8mAAAAEnsAAFsdrpAAAviOAAD0fWvg
Date: Wed, 17 Feb 2021 07:14:30 +0000
Message-ID: <AM0PR03MB4450BC428F28AF03F2616F33B6869@AM0PR03MB4450.eurprd03.prod.outlook.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
 <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
 <c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c@siemens.com>
 <AM0PR03MB4450F982DDD1872D12FA09FBB68B9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <e4e5f179-ae06-6589-95e5-8f0785c8d09e@siemens.com>
In-Reply-To: <e4e5f179-ae06-6589-95e5-8f0785c8d09e@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13243b04-dfcc-4ff5-e28f-08d8d313ab37
x-ms-traffictypediagnostic: AM0PR03MB3569:
x-microsoft-antispam-prvs: <AM0PR03MB35695A095FB2AD317153C4D1B6869@AM0PR03MB3569.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9HcG7ZGMwUSL2OCDXIsaSjS344DMVUhBd0T5jmsBb5WPNMwraPWPtZFl395LtVGZDNbYQ5d4XpNkPfG/yCbb/rmfIZkk6h82GEFdHJH21SMnPIeAnT50FnX/XTXc8bJK2P4ObgwVh9NY6zzmqUoNEqNCTAr1ebi543K1zoVVlaTyfbIcTw//ud7p6QW7gU0XVoIK+7qZN35GlbaqHhmXu3ifpgSTj69t/HT7yRdeTeH9ilEirYlfmmI3illtajnpbPAxFcjp1hZQ/jsgePvWQEzQDqYXW1x9p4doH/x73JIfDmr/vYT5u+/zY14ORu7KN9SyzH7D534gOjuGhv07RD23qHrtFa3BBS/2AsM7tO/0VyAlhTAPyonNsHY7T3giMH5SiJymPKBSSSPVpIxygFCK3jeCa8EoGErqhaVR5qQYgojgzAhnqzGJd+xfSW0BR4GToyRE4FNRmQueY+VzrGFgTJMLqDgy9aTVB6eZ08W1H71CxVQIEZ2BLwdJRYGUZR3QbtF6ks0pqs9Lj08NjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4450.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(346002)(136003)(376002)(396003)(76116006)(9686003)(64756008)(71200400001)(2906002)(66446008)(33656002)(83380400001)(66946007)(186003)(66556008)(26005)(3480700007)(66576008)(5660300002)(8936002)(52536014)(99936003)(66574015)(86362001)(53546011)(478600001)(6506007)(7696005)(55016002)(110136005)(316002)(8676002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RFVLYm12WFRDWHY2emR0a0N0R2QyVTBuUDRZckdHUTRLaE56WlNkZ0VpWUpS?=
 =?utf-8?B?aUt0YUhmdUFkSk90Z0lwbmMzV3dDTzZQMEtpODFvS2xySkU1QWVscE11eFND?=
 =?utf-8?B?QmFiZzhYRzAzUURSdDdrRkRRR3QxVC9UQUg5M1BTbUpjS0RKdWtkQlY2RzFP?=
 =?utf-8?B?VmxFTEZueXF0czBIeEhmUm5rMUlHcDhlN1lvd2F2eENoQW9MVWNpUEs1YVNn?=
 =?utf-8?B?Nk9hWkJINEYyTk93WnhaOE53VXFDTEdmUlBneU1laHVveDhpRlBpODhNOE5Z?=
 =?utf-8?B?SXhkNzdDN2diakVKL2p4a3JTZWord2tON0lER0Q0SnVDOGYzaTdaSE93VU0y?=
 =?utf-8?B?Nmp4V3I1N0pzaEFJK0lxTkRJb3k3UUNVZlA2bU9ITDZ6Y01NYllDRUhrNkRS?=
 =?utf-8?B?OG1yMnZBeXN5VXQxTnR0WWdCOHNjZDNIQndqeVZmOURTWlFSTWxuQ1JNemJN?=
 =?utf-8?B?V3VxeWxCNlhkVFpjbXkvajhHZEdWc3JUWDFFOWFEVm9iNTc0Tkx4YldiL1Nv?=
 =?utf-8?B?ckpqSGVvNnpRRFkvWi9scVhTdjQwWE9HYzNOaEZhZkNQbXVUY080a2Z6Vklr?=
 =?utf-8?B?eWdhNkJpT2pQUE5FTDE2QzBXQWwvMXBmKzJtemFaZ0pDL0N4Y3Z3K0pvbXdI?=
 =?utf-8?B?ZHNaYld0QXhyT0p1OThpK3JqOE90c1Z5UUZtMVZhTXJ2MTR4OEdSbkhUSDBR?=
 =?utf-8?B?VHNrNm5QQWV4Ry80N3VJalJHSlA4V3BwR25nV0xyR3JPOS9CSE9OeDR4U3Rh?=
 =?utf-8?B?Zngrc0pJM2J5b0hzV3lZQUF6WG02NnY2RjVoN1kvbGJDOFZjUlZlNVhSQUVy?=
 =?utf-8?B?VFJ4ZFFWbU1kL3l5NmNHVHh5amlwNU1TNWFsNGVoblVyTHpEdWw3WFV6eWFl?=
 =?utf-8?B?bzlpQzVOVXFJRUFnQ0dYcHYvMlF2Mm9hNE5mMFVQYjlYTW51Qi9mTkVWcmVw?=
 =?utf-8?B?SVNXSkwrdjRkZXJNY09DenovM0RteFkrNGVCR2V0VVdScDVrcEYyckZQMU1u?=
 =?utf-8?B?RmhtMEhGUEVVRlhtR2pxYUx3cTltSnk0K1RqZHorKzFkNis4RmpoNHUxYmpw?=
 =?utf-8?B?Wi94Tm5Iemk4Qnh3UkxwYUNqY2gxdG9oZjZTRFI1amV4TC9Xcm45MWIxNkNm?=
 =?utf-8?B?T1ZrU3ZWWUVjV2QzZ1h4RXJkTE14WDJrOHdKOTJiV21nVVBWM255MmU1TDkr?=
 =?utf-8?B?czJQNVFSV1BYS3lEUXRqOWZJbUwzTjBtK01ZUDVXaUd3V3oyQmx0WmtmVXNp?=
 =?utf-8?B?RXlNQUtNVkxzY3daVndiVkFCVnFrK25MWGd6ZXlva2FQT1M2VzZiMjJmam90?=
 =?utf-8?B?cVBUTXNqZC9tM0YrTVQwMkNxaEllNWpyRmhUVjNabS9heDhjUEdkZFVObzlR?=
 =?utf-8?B?WmFGSGtieW8yTFlXdlg2T0xjSUFuOXBCWmwvYXNHNEZXVkVoejJUbWRlMXVM?=
 =?utf-8?B?TXdocHlZMFplMGR5VVJxVU0xcUVuYklpa01qSDF6aWlkc2xRTmN3OVRRcDRP?=
 =?utf-8?B?Ukw3eFFmNkhPSU4zWEIvcW9JSFRrVVdRdEJ3TElPRUhoZkhJcnFVZ3oyZElR?=
 =?utf-8?B?QTJsbEw1eGRRWmtIV3o4aDU1ZkRwVlZTSDRra3ptVTB0NWJuMVg2bm8yTlV0?=
 =?utf-8?B?WFhNVkdTWVhyempvUWZWT0Z1ZGswWmJIOWJhMkVRUjdjQ3krMUoyY1dJTzBq?=
 =?utf-8?B?YmhxOGZadnlRaFFja3hVdTdqT1BNZlZZcTNwZTRhSXVvdmd4RzhJdExWd2NU?=
 =?utf-8?Q?UZQ5nYK5O0hyxo7/lDPXZNpwbYd42VAq2icotne?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
	boundary="_003_AM0PR03MB4450BC428F28AF03F2616F33B6869AM0PR03MB4450eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4450.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13243b04-dfcc-4ff5-e28f-08d8d313ab37
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 07:14:30.1182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ODVYYATnQBTPG1DzN4ZJLa+ZToAhhoV/hcvp50Mhkrg6VEe+/b0pfunwKwEbRFp7xd11XsGETLpBjSFXP6vHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3569
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=hJTOZNsO;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.21.95 as permitted sender)
 smtp.mailfrom=Msainz@ikerlan.es;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
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

--_003_AM0PR03MB4450BC428F28AF03F2616F33B6869AM0PR03MB4450eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 12.02.21 10:05, Sainz Markel wrote:
>>
>> -----Mensaje original-----
>> De: Jan Kiszka <jan.kiszka@siemens.com> Enviado el: mi=C3=A9rcoles, 10 d=
e=20
>> febrero de 2021 14:33
>> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
>> Asunto: Re: Overflow in MMIO registration
>>
>> CAUTION: This email originated from outside of the organization. Do not =
click links or open attachments unless you recognize the sender and know th=
e content is safe.
>>
>>
>> On 10.02.21 14:31, Jan Kiszka wrote:
>>> On 10.02.21 12:15, Sainz Markel wrote:
>>>> On 08.02.21 12:24, Kizska Jan wrote:
>>>>
>>>>> Something may have caused a subpage MMIO region to be created (page-u=
naligned memory region). If that region split-up didn't exist in the root c=
ell already, things will fail. But I suspect that subpage is rather a sympt=
om, not the >cause.
>>>>
>>>>> Where there any compiler warnings when building the config? I would a=
lso recommend checking our configs via "jailhouse config check root.cell ce=
ll1.cell cell2.cell ...". Or share what you created.
>>>>
>>>>> Jan
>>>>
>>>>> --
>>>>> Siemens AG, T RDA IOT
>>>>> Corporate Competence Center Embedded Linux
>>>>
>>>> There are no warning during compilation and jailhouse config check com=
mand says it is everything correct.
>>>>
>>>> #jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cell=
 core3-cell.cell core4-cell.cell core5-cell.cell
>>>>   Reading configuration set:
>>>>   Root cell:     RootCell (sysconfig.cell)
>>>>   Non-root cell: core1-cell (core1-cell.cell)
>>>>  Non-root cell: core2-cell (core2-cell.cell)
>>>>   Non-root cell: core3-cell (core3-cell.cell)
>>>>  Non-root cell: core4-cell (core4-cell.cell)
>>>>  Non-root cell: core5-cell (core5-cell.cell) Overlapping memory=20
>>>> regions inside cell: None Overlapping memory regions with hypervisor:
>>>> None Missing PCI MMCONFIG interceptions: None Missing IOMMU
>>>> interceptions: None Missing resource interceptions for architecture
>>>> x86: None
>>>>
>>> >Attached to the mail the cell files I'm using. The .bin file is the sa=
me as for apic-demo.
>>>>
>>>
>> >Just looking at core1-cell.c reveals that you are neither aligning on=
=20
>> >physical page boundaries for the base nor using page-aligned sizes.=20
>> >So it is like I predicted. And it is NOT a simple copy of apic-demo.c.
>>>
>>
>>> ...and we should likely enhance jailhouse-config-check to catch also th=
is case.
>>
>>God, don't know what was thinking at... That's working now, cell starts c=
orrectly. I can't see any output in the console, what did you mean in a pre=
vious main with " Hope you do not let all cells use the same UART console i=
n this duplication (PIO 0x3f8 etc.)." I'm now just creating a single cell a=
nd no output is being shown...
>>

>I meant that you cannot hand out the single UART to multiple cells at the =
same time. There is no virtualization of this resource. You can >use it, ob=
viously, to bring up one instance of a cell and then disable it for that ce=
ll again.

>Connection to the cell should go via ivshmem: ivshmem-net or virtio-over-i=
vshmem or something custom.

After having modified the .c files to align sizes and boundaries, apparentl=
y cell starts with no issues. I understood what you said about using the sa=
me UART interface among all cell files and that it won't work. ATM I'm just=
 starting a single cell and no console output is being displayed. What am I=
 doing wrong? Attached the updates .c files.=20


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR03MB4450BC428F28AF03F2616F33B6869%40AM0PR03MB4450.eurprd=
03.prod.outlook.com.

--_003_AM0PR03MB4450BC428F28AF03F2616F33B6869AM0PR03MB4450eurp_
Content-Type: text/plain; name="core1-cell.c"
Content-Description: core1-cell.c
Content-Disposition: attachment; filename="core1-cell.c"; size=1489;
	creation-date="Wed, 17 Feb 2021 07:13:28 GMT";
	modification-date="Thu, 11 Feb 2021 11:52:18 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPgojaW5jbHVkZSA8amFpbGhvdXNlL2NlbGwtY29u
ZmlnLmg+CgpzdHJ1Y3QgewoJc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDsKCV9fdTY0
IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1syXTsKCXN0cnVj
dCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfcGlv
IHBpb19yZWdpb25zWzNdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsKCS5j
ZWxsID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwKCQku
cmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLAoJCS5uYW1lID0gImNvcmUxLWNl
bGwiLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1ZJUlRVQUxfQ09OU09MRV9QRVJNSVRURUQs
CgoJCS5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMpLAoJCS5udW1fbWVtb3J5X3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJLm51bV9jYWNoZV9yZWdp
b25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVnaW9ucyksCgkJLm51bV9pcnFjaGlwcyA9
IDAsCgkJLm51bV9waW9fcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLnBpb19yZWdpb25zKSwK
CQkubnVtX3BjaV9kZXZpY2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS50eXBlID0gSkFJTEhP
VVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX1BJTywK
CQkJLmFkZHJlc3MgPSAweDNmOCwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDIsCgl9LAoKCS5t
ZW1fcmVnaW9ucyA9IHsKCQkvKiBSQU0gKi8gewoJCQkucGh5c19zdGFydCA9IDB4M2YyMDAwMDAs
CgkJCS52aXJ0X3N0YXJ0ID0gMCwKCQkJLnNpemUgPSAweDAxMDAwMDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0
aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0gMHgwMTAwMDAwMCwKCQkJLnNpemUgPSAw
eDAwMDAxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fQ09NTV9SRUdJT04sCgkJfSwKCX0sCgoJLmNhY2hl
X3JlZ2lvbnMgPSB7CgkJewoJCQkuc3RhcnQgPSAwLAoJCQkuc2l6ZSA9IDIsCgkJCS50eXBlID0g
SkFJTEhPVVNFX0NBQ0hFX0wzLAoJCX0sCgl9LAoKCS5waW9fcmVnaW9ucyA9IHsKCQlQSU9fUkFO
R0UoMHgyZjgsIDgpLCAvKiBzZXJpYWwgMiAqLwoJCVBJT19SQU5HRSgweDNmOCwgOCksIC8qIHNl
cmlhbCAxICovCgkJUElPX1JBTkdFKDB4ZTAxMCwgOCksIC8qIE9YUENJZTk1MiBzZXJpYWwgKi8K
CX0sCn07Cg==

--_003_AM0PR03MB4450BC428F28AF03F2616F33B6869AM0PR03MB4450eurp_
Content-Type: text/plain; name="core1-app.c"
Content-Description: core1-app.c
Content-Disposition: attachment; filename="core1-app.c"; size=4110;
	creation-date="Wed, 17 Feb 2021 07:13:54 GMT";
	modification-date="Fri, 22 Jan 2021 10:47:08 GMT"
Content-Transfer-Encoding: base64

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAxMy0yMDE2CiAqCiAqIEF1dGhvcnM6CiAq
ICBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29tPgogKgogKiBUaGlzIHdvcmsgaXMg
bGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIuICBTZWUK
ICogdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KICovCgojaW5j
bHVkZSA8aW5tYXRlLmg+CgojZGVmaW5lIE1TUl9TTUlfQ09VTlQJCTB4MzQKCiNkZWZpbmUgUE9M
TFVURV9DQUNIRV9TSVpFCSg1MTIgKiAxMDI0KQoKI2RlZmluZSBBUElDX1RJTUVSX1ZFQ1RPUgkz
MgoKLyoKICogRW5hYmxlcyBibGlua2luZyBMRUQKICogU0lNQVRJQyBJUEMxMjdFOiAgICAgcmVn
aXN0ZXIgMHhkMGM1MDZhOCwgcGluIDAKICovCnN0YXRpYyB2b2lkICpsZWRfcmVnOwpzdGF0aWMg
dW5zaWduZWQgaW50IGxlZF9waW47CgpzdGF0aWMgdW5zaWduZWQgbG9uZyBleHBlY3RlZF90aW1l
OwpzdGF0aWMgdW5zaWduZWQgbG9uZyBtaW4gPSAtMSwgbWF4OwpzdGF0aWMgYm9vbCBoYXNfc21p
X2NvdW50OwpzdGF0aWMgdTMyIGluaXRpYWxfc21pczsKCnN0YXRpYyBjb25zdCB1bnNpZ25lZCBp
bnQgc21pX2NvdW50X21vZGVsc1tdID0gewoJMHgzNywgMHg0YSwgMHg0ZCwgMHg1YSwgMHg1ZCwg
MHg1YywgMHg3YSwJLyogU2lsdmVybW9udCAqLwoJMHgxYSwgMHgxZSwgMHgxZiwgMHgyZSwJCQkJ
LyogTmVoYWxlbSAqLwoJMHgyYSwgMHgyZCwJCQkJCS8qIFNhbmR5IEJyaWRnZSAqLwoJMHg1Nywg
MHg4NSwJCQkJCS8qIFhlb24gUGhpICovCgkwCn07CgpzdGF0aWMgYm9vbCBjcHVfaGFzX3NtaV9j
b3VudCh2b2lkKQp7Cgl1bnNpZ25lZCBpbnQgZmFtaWx5LCBtb2RlbCwgc21pX2NvdW50X21vZGVs
LCBuID0gMDsKCXVuc2lnbmVkIGxvbmcgZWF4OwoKCWFzbSB2b2xhdGlsZSgiY3B1aWQiIDogIj1h
IiAoZWF4KSA6ICJhIiAoMSkKCQk6ICJyYngiLCAicmN4IiwgInJkeCIsICJtZW1vcnkiKTsKCWZh
bWlseSA9ICgoZWF4ICYgMHhmMDApID4+IDgpIHwgKChlYXggJiAweGZmMDAwMDApID4+IDE2KTsK
CW1vZGVsID0gKChlYXggJiAweGYwKSA+PiA0KSB8ICgoZWF4ICYgMHhmMDAwMCkgPj4gMTIpOwoJ
aWYgKGZhbWlseSA9PSAweDYpIHsKCQlkbyB7CgkJCXNtaV9jb3VudF9tb2RlbCA9IHNtaV9jb3Vu
dF9tb2RlbHNbbisrXTsKCQkJaWYgKG1vZGVsID09IHNtaV9jb3VudF9tb2RlbCkKCQkJCXJldHVy
biB0cnVlOwoJCX0gd2hpbGUgKHNtaV9jb3VudF9tb2RlbCAhPSAwKTsKCX0KCXJldHVybiBmYWxz
ZTsKfQoKc3RhdGljIHZvaWQgaXJxX2hhbmRsZXIodW5zaWduZWQgaW50IGlycSkKewoJdW5zaWdu
ZWQgbG9uZyBkZWx0YTsKCXUzMiBzbWlzOwoKCWlmIChpcnEgIT0gQVBJQ19USU1FUl9WRUNUT1Ip
CgkJcmV0dXJuOwoKCWRlbHRhID0gdHNjX3JlYWRfbnMoKSAtIGV4cGVjdGVkX3RpbWU7CglpZiAo
ZGVsdGEgPCBtaW4pCgkJbWluID0gZGVsdGE7CglpZiAoZGVsdGEgPiBtYXgpCgkJbWF4ID0gZGVs
dGE7CglwcmludGsoIlRpbWVyIGZpcmVkLCBqaXR0ZXI6ICU2bGQgbnMsIG1pbjogJTZsZCBucywg
bWF4OiAlNmxkIG5zIiwKCSAgICAgICBkZWx0YSwgbWluLCBtYXgpOwoJaWYgKGhhc19zbWlfY291
bnQpIHsKCQlzbWlzID0gKHUzMilyZWFkX21zcihNU1JfU01JX0NPVU5UKTsKCQlpZiAoc21pcyAh
PSBpbml0aWFsX3NtaXMpCgkJCXByaW50aygiLCBTTUlzOiAlZCIsIHNtaXMgLSBpbml0aWFsX3Nt
aXMpOwoJfQoJcHJpbnRrKCJcbiIpOwoKCWlmIChsZWRfcmVnKQoJCW1taW9fd3JpdGUzMihsZWRf
cmVnLCBtbWlvX3JlYWQzMihsZWRfcmVnKSBeICgxIDw8IGxlZF9waW4pKTsKCglleHBlY3RlZF90
aW1lICs9IDEwMCAqIE5TX1BFUl9NU0VDOwoJYXBpY190aW1lcl9zZXQoZXhwZWN0ZWRfdGltZSAt
IHRzY19yZWFkX25zKCkpOwp9CgpzdGF0aWMgdm9pZCBpbml0X2FwaWModm9pZCkKewoJdW5zaWdu
ZWQgbG9uZyBhcGljX2ZyZXFfa2h6OwoKCWlycV9pbml0KGlycV9oYW5kbGVyKTsKCglhcGljX2Zy
ZXFfa2h6ID0gYXBpY190aW1lcl9pbml0KEFQSUNfVElNRVJfVkVDVE9SKTsKCXByaW50aygiQ2Fs
aWJyYXRlZCBBUElDIGZyZXF1ZW5jeTogJWx1IGtIelxuIiwgYXBpY19mcmVxX2toeik7CgoJZXhw
ZWN0ZWRfdGltZSA9IHRzY19yZWFkX25zKCkgKyBOU19QRVJfTVNFQzsKCWFwaWNfdGltZXJfc2V0
KE5TX1BFUl9NU0VDKTsKCglhc20gdm9sYXRpbGUoInN0aSIpOwp9CgpzdGF0aWMgdm9pZCBwb2xs
dXRlX2NhY2hlKGNoYXIgKm1lbSkKewoJdW5zaWduZWQgbG9uZyBjcHVfY2FjaGVfbGluZV9zaXpl
LCBlYng7Cgl1bnNpZ25lZCBsb25nIG47CgoJYXNtIHZvbGF0aWxlKCJjcHVpZCIgOiAiPWIiIChl
YngpIDogImEiICgxKQoJCTogInJjeCIsICJyZHgiLCAibWVtb3J5Iik7CgljcHVfY2FjaGVfbGlu
ZV9zaXplID0gKGVieCAmIDB4ZmYwMCkgPj4gNTsKCglmb3IgKG4gPSAwOyBuIDwgUE9MTFVURV9D
QUNIRV9TSVpFOyBuICs9IGNwdV9jYWNoZV9saW5lX3NpemUpCgkJbWVtW25dIF49IDB4QUE7Cn0K
CnZvaWQgaW5tYXRlX21haW4odm9pZCkKewoJYm9vbCBhbGxvd190ZXJtaW5hdGUgPSBmYWxzZTsK
CWJvb2wgdGVybWluYXRlID0gZmFsc2U7Cgl1bnNpZ25lZCBsb25nIHRzY19mcmVxOwoJYm9vbCBj
YWNoZV9wb2xsdXRpb247CgljaGFyICptZW07CgoJY29tbV9yZWdpb24tPmNlbGxfc3RhdGUgPSBK
QUlMSE9VU0VfQ0VMTF9SVU5OSU5HX0xPQ0tFRDsKCgljYWNoZV9wb2xsdXRpb24gPSBjbWRsaW5l
X3BhcnNlX2Jvb2woInBvbGx1dGUtY2FjaGUiLCBmYWxzZSk7CglpZiAoY2FjaGVfcG9sbHV0aW9u
KSB7CgkJbWVtID0gYWxsb2MoUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwoJCXByaW50aygiQ2FjaGUg
cG9sbHV0aW9uIGVuYWJsZWRcbiIpOwoJfQoKCWhhc19zbWlfY291bnQgPSBjcHVfaGFzX3NtaV9j
b3VudCgpOwoJaWYgKGhhc19zbWlfY291bnQpIHsKCQlpbml0aWFsX3NtaXMgPSAodTMyKXJlYWRf
bXNyKE1TUl9TTUlfQ09VTlQpOwoJCXByaW50aygiSW5pdGlhbCBudW1iZXIgb2YgU01JczogJWRc
biIsIGluaXRpYWxfc21pcyk7Cgl9CgoJdHNjX2ZyZXEgPSB0c2NfaW5pdCgpOwoJcHJpbnRrKCJD
YWxpYnJhdGVkIFRTQyBmcmVxdWVuY3k6ICVsdS4lMDNsdSBrSHpcbiIsIHRzY19mcmVxIC8gMTAw
MCwKCSAgICAgICB0c2NfZnJlcSAlIDEwMDApOwoKCWluaXRfYXBpYygpOwoKCWxlZF9yZWcgPSAo
dm9pZCAqKSh1bnNpZ25lZCBsb25nKWNtZGxpbmVfcGFyc2VfaW50KCJsZWQtcmVnIiwgMCk7Cgls
ZWRfcGluID0gY21kbGluZV9wYXJzZV9pbnQoImxlZC1waW4iLCAwKTsKCglpZiAobGVkX3JlZykK
CQltYXBfcmFuZ2UobGVkX3JlZywgNCwgTUFQX1VOQ0FDSEVEKTsKCgl3aGlsZSAoIXRlcm1pbmF0
ZSkgewoJCWNwdV9yZWxheCgpOwoKCQlpZiAoY2FjaGVfcG9sbHV0aW9uKQoJCQlwb2xsdXRlX2Nh
Y2hlKG1lbSk7CgoJCXN3aXRjaCAoY29tbV9yZWdpb24tPm1zZ190b19jZWxsKSB7CgkJY2FzZSBK
QUlMSE9VU0VfTVNHX1NIVVRET1dOX1JFUVVFU1Q6CgkJCWlmICghYWxsb3dfdGVybWluYXRlKSB7
CgkJCQlwcmludGsoIlJlamVjdGluZyBmaXJzdCBzaHV0ZG93biByZXF1ZXN0IC0gIgoJCQkJICAg
ICAgICJ0cnkgYWdhaW4hXG4iKTsKCQkJCWphaWxob3VzZV9zZW5kX3JlcGx5X2Zyb21fY2VsbChj
b21tX3JlZ2lvbiwKCQkJCQkJSkFJTEhPVVNFX01TR19SRVFVRVNUX0RFTklFRCk7CgkJCQlhbGxv
d190ZXJtaW5hdGUgPSB0cnVlOwoJCQl9IGVsc2UKCQkJCXRlcm1pbmF0ZSA9IHRydWU7CgkJCWJy
ZWFrOwoJCWNhc2UgSkFJTEhPVVNFX01TR19OT05FOgoJCQlicmVhazsKCQlkZWZhdWx0OgoJCQlq
YWlsaG91c2Vfc2VuZF9yZXBseV9mcm9tX2NlbGwoY29tbV9yZWdpb24sCgkJCQkJSkFJTEhPVVNF
X01TR19VTktOT1dOKTsKCQkJYnJlYWs7CgkJfQoJfQoKCXByaW50aygiU3RvcHBlZCBBUElDIGRl
bW9cbiIpOwoJY29tbV9yZWdpb24tPmNlbGxfc3RhdGUgPSBKQUlMSE9VU0VfQ0VMTF9TSFVUX0RP
V047Cn0K

--_003_AM0PR03MB4450BC428F28AF03F2616F33B6869AM0PR03MB4450eurp_--
