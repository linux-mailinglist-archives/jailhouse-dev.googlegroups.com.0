Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26YTCKAMGQEONZIT3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1552D19E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 13:39:34 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id m26-20020a7bcb9a000000b0039455e871b6sf1728320wmi.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 04:39:34 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652960364; cv=pass;
        d=google.com; s=arc-20160816;
        b=l+l9ja7Zciu4ghonvMKGmiLtcm6FiiP4r7Zt8EWXb7kWmUo26w0NCyJkpHq/Nxet8O
         RI4kvcXVWDPq59K9ReVMPkYY9Rxi3oMja11Bv2wV8UWI5pHE5wogtWKM8ePKvMmWNhNu
         uvgz25DDFnKb+9rU5r8fuJ7eF6zosLO9vpjnvk1No5z7DpmKhtZiBRzJlj3yG2Lql6nz
         DMtW0SToHfx/B84lZ/jZzjriEvdTrv4x8WBUnIUmpWnBxmDdNTa0hizoNIk2Wh8HKAb0
         esILwVR7D2DBWePmfz0WjsvryJySZJLPpiKFI1qC3tcVHdPA3F7sYSSAd3OyG8wjtg6W
         ukGA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=AjV+cdMzTmPvKdHtBZu8hoOVkWan9lY1ePkUEvyxFB4=;
        b=jjooQsjAQgI6cIwvkFdup+QPjP1+fXH7E08JDWoRWLnTs1MXZT1xMRuJHkQ/SHQSc6
         OfqnEE+YMYbILJgEIzhk4uikPK4fzXR412WMBQvxlDAHpEcsUvpJ9ZIc7IuZyMHScoti
         VyVHkqzC5oNrBBCNiJ/Vuiyl+nKdtovJrVkfcRDo1EEXsjJnVkqjGhHQmOK/jU8CHhvH
         EeqjJZ8ODno3ff445k1FkYh2VnNNE1NTaSx7OReGo+fbem37HIfkqL3WNsqVVcbvtBeo
         WNxbwZcxcGjzGmwt6oprzY5MRf5fBVa1TDbE9jjTlbRKLUq49QvmxCdbyfNhM3wpdXIs
         Jd/A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lYsvU9ND;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe02::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AjV+cdMzTmPvKdHtBZu8hoOVkWan9lY1ePkUEvyxFB4=;
        b=UjxKYXgzwmtY9NDaJ7A2rGPOkhhnDOE9is8t12ijhdh/2sqVdILSCsncoX1xAnDzUN
         +EMoauiLHqcBCWNDgMrj4NZcAJzNpDwfKT0H9yQtrXD4c4mF2nD6UW/d7rg9tzFdUlSw
         uA+0LN/+OJFPEJSSDRQGaLH7leQ6t4EC01KpGwYOP2iYz+iNCnECgk510KyOTu6iETkH
         RX5Lk4uBdAamPdiqFMW2++alPr0MMJebzTnGBhFgU8JkEoSaUGCl3I+R9fv+009spFov
         CGs9iW22zf5pvg167HEL24nCHCowN7hHQWxRNFfspOuxAkrIHivnd6/vacXdFSlk4fNn
         ohrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AjV+cdMzTmPvKdHtBZu8hoOVkWan9lY1ePkUEvyxFB4=;
        b=BSf84cawHDi3M40rcfwp63DnpUZsbzSuO0dKGBA/BemOvvrLgmx7+LeutqloXphFxR
         PbmB/tFVy3aIzT1N1wTaSMPoEXy6N5UhpfWtvqtbxCgCnuBL2M/IT3TKQGw/s/ecenmC
         SlRp3cualZdpHFeIJxbBfUUdz2AZOREyZCEmsoyLTKaPxwAik/Ck48JJrtGGCIpNfQqn
         Rhu+zIPi2paNS8gD6h/hExZuUNOF+t+z6WFV69b8mfouxRcLYqvfgUehheK7VvPucjz4
         c7L1RP2o3Ng4GhxxS1XcAROJD3HDDe6xsEe2CSgptcR0oVYrCvGl36kDgXRDGZSCc4Hv
         oILw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531aOpdP7sAkK16aL3Cmwkm9jLZg8TzWeIfVpRNz1/V/9H7bvTwg
	JZM/UuMBpjp2OZBNMShhZSw=
X-Google-Smtp-Source: ABdhPJwGUJHLi8wzebdXncku0IWxIkWaXCG5lH+m+mKIXmc6U8eNv4lEUV6UL8gROlMWhrwLQo7X7w==
X-Received: by 2002:a05:600c:48b:b0:394:2ee9:5847 with SMTP id d11-20020a05600c048b00b003942ee95847mr4125593wme.117.1652960364201;
        Thu, 19 May 2022 04:39:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f9d1:0:b0:20e:6336:e09d with SMTP id w17-20020adff9d1000000b0020e6336e09dls4009585wrr.1.gmail;
 Thu, 19 May 2022 04:39:22 -0700 (PDT)
X-Received: by 2002:a5d:4811:0:b0:20e:7222:eb25 with SMTP id l17-20020a5d4811000000b0020e7222eb25mr786856wrq.146.1652960362615;
        Thu, 19 May 2022 04:39:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652960362; cv=pass;
        d=google.com; s=arc-20160816;
        b=KXFBhlRIFFC3BK7HhLFiRJxDqj4o4O7PhMFAzCYM8lCROsc1BKnWzqtTEoMwaxtv7h
         z7Sn1dxas2X9P8foyZjJ+U5USDdA4/jj71rarSc7bGHG5qL/Dh4mlza+8nRK1F8OHK+s
         v8D3vnXOzeghpfcgvYowVqbav7K8zM+F00w8+1sHhc2Dqsgq+f+iWgDKvPkRVPApph6Q
         TrS5l66vC56XP3xTJg7mMZDcfjp+ikUEwhuj2GmN27WKG2Hn0Ynj7Y3AojOUFDvDMMlZ
         XsD06c7YHSOgrGheKjv11uJDneKqET2nTyTkuJaHOmt951eWKYKG+cO/g2rA9c6+3SaG
         m8xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4soDoC0iXRQPbpd1pf6Q0cLM/zajeL/XlJNYaGJKZTI=;
        b=pYpIGWs60c2T24YL7A5MY7+PXumc2IJF8y0pcgvrE0uYrARnLbAL7GsV5zV2I23h2T
         VCQHeqnOq7eojTwqpCHWAdytWJDZRoI19iy4i9EpDh4+pj+9OZp3/Pem2t11QWohC9ID
         k3H1yhs1gyWC63ycBCPGyFR2Km9rSC/TtZYs9Kgu+7Le9576GuRthrqcqvSjoPXoa2E2
         wkkwhxd8Qrlb2OhHZwjZee29JNga5rf+nqd8gtKoeGn+o5FtjekNeoFGYzkPKI02vN75
         HWXUhXxgYIvVNnFlh2ns3W1Y9uwYjTDvaN/irXVYv3wui1Xd5YmlL8qDEXDHqmFCL6SD
         Q3dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lYsvU9ND;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe02::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0618.outbound.protection.outlook.com. [2a01:111:f400:fe02::618])
        by gmr-mx.google.com with ESMTPS id bg8-20020a05600c3c8800b00393e98f67a1si178115wmb.1.2022.05.19.04.39.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 May 2022 04:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe02::618 as permitted sender) client-ip=2a01:111:f400:fe02::618;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0jT04jyDApE3PDFWYbfVde+dTtYSo6XtPwI/8VAX7ONyhgff8GgWYvPRDZkOby7mj7NUsr6j36hFMk1YtkpD/+q6ZxoCbSXALVn8/BU+r5US8MlmbqstU+h87RznTESkmsvSJ1ubdosD7B/8XD7etEJfnOUHbfKWTe4W6Wh7cr74fmtj4lbcg90FFhO73dLolN/540kaBVQERqvAySh6XzbIvutprgUkptESmy//whNln5lnH+rln+iHFvIwgdvn7aWza+XwPqk8Ulci+AEGEfUP4rYMHqVkusOv8qRFEwdl2madh5+7OrbMu/igGHJM411BkN7GLx2M26dWkmwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4soDoC0iXRQPbpd1pf6Q0cLM/zajeL/XlJNYaGJKZTI=;
 b=m2h2XHavyss5khcz8ealM+2HdSBupkWs1SE6PKUCr9yvaEU+/GZMvGixHlyD+B4EOKwKVHnikedgpQqlHivcEhJPYU+Qesc7tfx5QCpuaPDa92ZyYqbN2vI4LkSjfrV+/tPg4qIfEsWyRzXWTqtS6hJdlep4+NNHIcUfkURC+Th01oDDG1Pjj6VZu4XeeH6A4a79H0Noi1K4RtN4/pwKhRve3mRj/MEnHjfNLCHc9bEKgLqyPFutAaf3U6hLMxbWxbQH1ZrCxOfhe1/FAgg6PjGS6wL88ASYY9mTtsIFLUdxGFmBFryzfv2wQDN9iYnCQimnbqddUcplOq6opKkQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM5PR1001CA0010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::23)
 by DB6PR1001MB1078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 11:39:21 +0000
Received: from VE1EUR01FT104.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::f) by AM5PR1001CA0010.outlook.office365.com
 (2603:10a6:206:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Thu, 19 May 2022 11:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT104.mail.protection.outlook.com (10.152.3.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 11:39:20 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Thu, 19 May 2022 13:39:20 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Thu, 19 May
 2022 13:39:20 +0200
Message-ID: <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
Date: Thu, 19 May 2022 13:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
 <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
 <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com>
 <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com>
 <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
 <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--24.338100-8.000000
X-TMASE-MatchedRID: grK+ChACArw5QaOxwNGfvo9bHfxDWoibUlQrLabIzZN08zy97KsgJsRJ
	LE/FNr2DY4zJvUjGrxXioAGxQy4eNYLPV37BrMJjp1g3Gnmqog5mC5UkZj+/T/go8BKl9ae5AQ8
	mtiWx//qZHfpKN1YMZfVPDFRnPwE4ULd14sEtBkF6/Ws1m/D19VVecXIb1FSr0MohG+IQ2sfx6P
	TcDxSp5QWqvFWg3Xg6gm7WCykPm9R55ynAVG2b6A092JK4Ug5YcFR5Op/4/wRT2G3xw+NXjthQO
	8CvZj/XCXjDiV/HPZztOa5rI8bsUFm9RBQ+WJcuNQCs8d6D0K369udj0zppv5GzIhDiMWXrjlRp
	8uau9oaXbcZfsC7t1LMeapFjC2iRg+KYTANwVp0wflweu99/zHrSP9RtGZYomS4eyDF9QUdoqrV
	iHDnSO6Rea8wUAdQ6Hb9zBU4IqPHSe7fNpJWzjU+oHek5MFSPeKZAID3hHVYRBjzsfzCd+ZpHQF
	N7rLyrzVgwP7ZMYf8jw4ms98ZEXWT5A0MPjaOM8+9mrsbK9Dp6D40PEbZO2tbgzPjrV+wcS1zwN
	uiBtISU8ftiyKjZrU/mRGqrA8qmyV4cclS+BIyKz8Uhs7fHIYVoRXOdcwkq/sUSFaCjTLyLVqTY
	7yBqeMOtrkhuZC9WHPlmpfo5s0fDSWVV5dgfGs1wZBR3VQRdxxNWXWqfwaLzXLbkJWzoJKVjgXy
	vS9c/e1OjQ/WyxP7l04IeyD35VnoVjVWuz0sKW4UrsZ2Lh+t2biRssqT/bkWj1375/pHqzqAF0w
	FSjjUumZeX1WIQ8GBt9mS7pKVT5nbu5kRbHvaRk6XtYogiau9c69BWUTGwVnRXm1iHN1bEQdG7H
	66TyOk/y0w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--24.338100-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 81C8D367F7F249833403B3327924680A3FAEDB7FF78DE11247D5C38EA876D06A2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da009c04-705c-4186-d632-08da398c372d
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1078:EE_
X-Microsoft-Antispam-PRVS: <DB6PR1001MB107876ECD384EE2138EED53D95D09@DB6PR1001MB1078.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxMxyHD7ocsK0leML5mZN/LeCv368IRN8in4ZngFUKpxpSK4ujPidiu6pjNHMc1hBaqilKxFnwiRFYKniFuW+Z4jJ5Jy23eqCAwoKG8P8GWkedLRbbjs6VgaGHpj7CQf/CeZg92GlExoP+/08XKvPrLSjVtpu3yCpzsuv7GShI9iRew91BnfrJsENRzH1B7tE34LGXZF+1usB8wW0M2LF+nih/aABjCC8m5MlJGo0CKZxXep7y91XWWJwTlNAH8F8b0xbDCNFfEuTv6e0dfBZxkKDXWQXJ3dD7fTtjkDV+zGqtmktyD/3WINluJee523gGg4fCdpRHL2jJjYfca+nW1fCMtoBlFzG0exXrjq04AdaHASykutV6k6/C5Mz4xrPfAwr5fNesLgUSlx6jXFqJqlQOj+SWL8hgMg+kY2M2UBuu8EBSoGdxKmxG8xoCEkHE8cF9AfgnAZpu2xpUFTaK3iYJz/EsewDRrcotulBTSYK+wb1yHOfAwhAsPfthkYkL1XpB4hnne9XLZ4utGAgRDZeGKCIKPxkCB9Vt1umA7UEoqD0yOhipyUFziqvib3B9O6bLyrq6D/YMmCddtnVglh1PQ9zWl3Q2TLOyi8+g3rFl8Q0x6KBBCba0bO8ECqgOTefMA6tLH1OOlkxmx8KtNsVzE++/e8qlPA3k8uGPSahI+C8hguCAHcJweSLskXUJ+K706y4mCJBc5cvYpnHYlWomVMTE0zZJL9aAzWsZG7ynxxod08uwQY+KuW+/zWHzK/QUQWI9ASzw4Cn3XfHw==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(36756003)(82310400005)(6706004)(6916009)(2616005)(956004)(83380400001)(16576012)(31696002)(16526019)(186003)(44832011)(70586007)(70206006)(316002)(5660300002)(8676002)(4326008)(53546011)(31686004)(81166007)(40460700003)(508600001)(336012)(2906002)(8936002)(26005)(356005)(82960400001)(36860700001)(47076005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 11:39:20.9520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da009c04-705c-4186-d632-08da398c372d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT104.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1078
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=lYsvU9ND;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe02::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 19.05.22 11:44, Lad, Prabhakar wrote:
> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 17.05.22 18:19, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Tue, May 17, 2022 at 12:44 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 16.05.22 20:01, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Mon, May 16, 2022 at 6:57 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 13.05.22 18:28, Lad, Prabhakar wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On Fri, May 13, 2022 at 4:33 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>
>>>>>>>> On 13.05.22 17:20, Lad, Prabhakar wrote:
>>>>>>>>> On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On 13.05.22 13:32, Lad, Prabhakar wrote:
>>>>>>>>>>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
>>>>>>>>>>>> actually crashing on hvc in arch_entry, and that because of Linux not
>>>>>>>>>>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
>>>>>>>>>>>>
>>>>>>>>>>>> Could you share the boot log of the kernel?
>>>>>>>>>>>>
>>>>>>>>>>> Attached is the complete log.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> "CPU: All CPU(s) started at EL1"
>>>>>>>>>>
>>>>>>>>>> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
>>>>>>>>>>
>>>>>>>>> Argh my bad, I've now enabled it to start in EL2 mode (attached are
>>>>>>>>> the complete logs). Now I see the below panic,
>>>>>>>>>
>>>>>>>>> [   33.920507] jailhouse: loading out-of-tree module taints kernel.
>>>>>>>>> Reading configuration set:
>>>>>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>>>>>> Overlapping memory regions inside cell: None
>>>>>>>>> Overlapping memory regions with hypervisor: None
>>>>>>>>> Missing resource interceptions for architecture arm64: None
>>>>>>>>> [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
>>>>>>>>> code 0x5a000000 -- HVC (AArch64)
>>>>>>
>>>>>> "HVC instruction execution in AArch64 state, when HVC is not disabled",
>>>>>> origin: EL2 (hypervisor mode).
>>>>>>
>>>>>> Is KVM off again when you start Jailhouse here? Does the CPU support VHE
>>>>>> (Virtualization Host Extension)? Is CONFIG_ARM64_VHE enabled? Try to
>>>>>> turn that off.
>>>>>>
>>>>> KVM was OFF, I have enabled both CONFIG_VIRTUALIZATION and CONFIG_KVM
>>>>> (I have attached the complete kernel config). Yes the CPU does have
>>>>> VHE support. I did it by disabling CONFIG_ARM64_VHE which did not make
>>>>> any difference.
>>>>>
>>>>> With the VHE disable now I get the below output:
>>>>> root@smarc-rzg2l:~# dmesg | grep -i kvm
>>>>> [    0.095927] kvm [1]: IPA Size Limit: 40 bits
>>>>> [    0.096895] kvm [1]: GICv3: no GICV resource entry
>>>>> [    0.096916] kvm [1]: disabling GICv2 emulation
>>>>> [    0.096949] kvm [1]: GIC system register CPU interface enabled
>>>>> [    0.097045] kvm [1]: vgic interrupt IRQ9
>>>>> [    0.097156] kvm [1]: Hyp mode initialized successfully
>>>>> root@smarc-rzg2l:~#
>>>>>
>>>>> Now with the above configs I don't get any output on the console when
>>>>> the root cell is enabled:
>>>>>
>>>>> root@smarc-rzg2l:~# sh -x ./hyp.sh
>>>>> + insmod jailhouse.ko
>>>>> [   35.379219] jailhouse: loading out-of-tree module taints kernel.
>>>>> + jailhouse config check -a arm64 renesas-r9a07g054l2.cell
>>>>> Reading configuration set:
>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>> Overlapping memory regions inside cell: None
>>>>> Overlapping memory regions with hypervisor: None
>>>>> Missing resource interceptions for architecture arm64: None
>>>>> + jailhouse enable renesas-r9a07g054l2.cell
>>>>> [   36.217465] obcode @arm_dcaches_flush: d53b0024
>>>>> [   36.217469] obcode @arm_dcaches_flush: d53b0024
>>>>>
>>>>> Any pointers on debugging this further, has anyone tried jailhouse on
>>>>> Cortex-A55 before?
>>>>
>>>> Hmm, at least not I so far. Might be the point that we are missing some
>>>> subtle difference here around the way the setup works then.
>>>>
>>> Right.
>>>
>>>> In any case, the fact that at least the previous crash is gone indicates
>>>> that something changed. You could check if you reach now the second hvc
>>>> by adding a ret in front of it. If you, you may end up in hyp mode,
>>>> maybe just not have a working UART yet (is the model you have on the
>>>> board in principle already supported by Jailhouse?), run into a
>>>> different issue, but just don't see Jailhouse report of it.
>>>>
>>> It's not going pass the arm_dcaches_flush statement.
>>>
>>> With the below diff, I don't see any logs on console
>>> option #1
>>> diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
>>> index 39dad4af..ce29b8e8 100644
>>> --- a/hypervisor/arch/arm64/caches.S
>>> +++ b/hypervisor/arch/arm64/caches.S
>>> @@ -40,6 +40,7 @@
>>>   */
>>>         .global arm_dcaches_flush
>>>  arm_dcaches_flush:
>>> +       ret
>>>         dcache_line_size x3, x4
>>>         add     x1, x0, x1
>>>         sub     x4, x3, #1
>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
>>> index a9cabf7f..c8ebf695 100644
>>> --- a/hypervisor/arch/arm64/entry.S
>>> +++ b/hypervisor/arch/arm64/entry.S
>>> @@ -97,6 +97,7 @@ arch_entry:
>>>         ldr     x1, [x0, #HEADER_CORE_SIZE]
>>>         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
>>>         bl      arm_dcaches_flush
>>> +       ret
>>>
>>>         /* install bootstrap_vectors */
>>>         ldr     x1, =bootstrap_vectors
>>>
>>>
>>
>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
>> lr, thus the second ret will only return to where the first ret jumped
>> to - endless loop. You would have to restore lr (x30) from x17 in
>> arch_entry first:
>>
>> mov x30, x17
>> ret
>>
> That did the trick thanks!
> 
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index a9cabf7f..7b340bd1 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -109,6 +109,8 @@ arch_entry:
>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
>  1:
>         hvc     #0
> +       mov x30, x17
> +       ret
> 
>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
>         b       .       /* we don't expect to return here */
> 
> 
> With the above diff I do get the below:
> 
> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
> Reading configuration set:
>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing resource interceptions for architecture arm64: None
> [   46.582588] obcode @arm_dcaches_flush: d53b0024
> [   46.582616] obcode @arm_dcaches_flush: d53b0024
> [   46.611311] The Jailhouse is opening.
> 
> So it looks like something to do with the debug console. This has to
> be poked in the dark or any easy way to debug?

Well, we do not yet know what goes wrong. We do know that we can call
into the hyp take-over stub and register Jailhouse with it. We do not
know if we will then end up in Jailhouse in hyp mode and just lack
console output or if we crash on entry already.

To move the uart console out of the picture: Did you already check if
the driver you select in the Jailhouse config is actually one that
should support the UART on your board? Next is to double check if poking
registers in the way the Jailhouse driver will do at the addresses you
configured will work: Pull the code into the kernel module or even into
a userspace application with /dev/mem raw register access and try out if
that works in a "safe" environment (without hypervisor mode).

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a87eb794-7dc1-f447-c13a-de600a48d59e%40siemens.com.
