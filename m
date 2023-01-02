Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVH5ZGOQMGQEDZQ5LQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FFE65AD8A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 07:51:03 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id y26-20020a0565123f1a00b004b4b8aabd0csf9780973lfa.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 22:51:03 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672642262; cv=pass;
        d=google.com; s=arc-20160816;
        b=O8SucbBVVL/PMj0XGgx029gek4FxHqK/prMR4/J4QbSKCKgjXWeEgSFWnHo+Mf+vnl
         cOguUxJWLXAjcbJD1QiiSzfBE3mMf4xJhkrHvrAYRXFG35D1XGOd3st+Ap51ch96aIoJ
         6gHLNtI4hTuhIdOOCBKiedx1vn1i1IgPgr6g4pYkigUdP4jjdbAVwhH2lMWmT1UYD8vl
         oWsT3Wr05mxDcmyJzmvIV1c5vrMqcallpbBVbkPZq5eNrojY9/tzgNKUdPRaonMY11ze
         UrRNbdYeoHcrMQ3jaRiggX7qMh/YB1yD58NWV/mImwVZfHf+0VGxYtgfpjeR/z4FDSi9
         KbEg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=qGFCKCljR4eVRs0TTjNn0Q0m1P7sVElKjQmGUbiicCA=;
        b=pCxMoUe2PkInUEkbdzJv1vb0/m057zNWq2WGOxvun/aDoRV4V2G4i8WwB0dWlwzfkN
         mtYIAk4VHHvKl0CdzLw/AHXPTPoN3xSYCbxPaMUhTGDOdTtWMG4y4cNwGR4W6ZsWQ4BE
         A5dTSKP42C0os+lFayPdi6MRHdyEKNs64yj1isBgZMmZi7cei8bUD3pO2f7Ebuq2TJEM
         mjwtE96k/5PQd4CDTVGAPBlv+rnG1iO6dh16+rz8aD2DMx/Yv0jso4usEC9jr0CZbc7V
         JcxyqMaes9EKWDA3qNC0dCm/tdL5y5cJSLgtmmDl+dpAfEdBtSrtnDTzEil8W2rDeXOX
         ngsQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=tiQIRZvG;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.52 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qGFCKCljR4eVRs0TTjNn0Q0m1P7sVElKjQmGUbiicCA=;
        b=J8PGxWcutCA8dOXfvOlcEnHrLK+JIWBINGfnAbpBruwYHb2H4vr19RA1WvGGKBSO8v
         N4trkeil/0wbvEJc5hOhVF3blGMIdwO75m3ZReOrb0BetFJUUSlWSPFe6+roK/u6yj7M
         CKifb46M0taL4v4Pvn4tw0qJjC6AwovYy/z9H25PXPeS7nO507k2jAM8SA1vC28dRpft
         qSOSf43PQLJxRUGLLcj3TIuVi+o302WOTYzO84VPzFD9/KAPC5OKzyCrH9PjChsmmobl
         IwN411CYRXBSQ79l1d3Py8ggG75BefBpG6JhvVICqIDVCIxbr9JOVUnwMDshy1emghog
         b+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGFCKCljR4eVRs0TTjNn0Q0m1P7sVElKjQmGUbiicCA=;
        b=aKW4d1jZ1A0argXZaoNkEMWuzrZYR9fiw3lawEKEoS78j5uWAnxDRXFqlpB4Gw2UFU
         P+0/BjsfXQtPTxxlQeEEXlWb7H4a60nYXmeHB/0ueU6lcZbaRzLe0mO5XxR3bjCNDMvB
         WkoHyaN7AOzINivT5lXALg+ZYcb7dqrGEzqqXUkL20+e0f6JEg6TfHQg70fVtus6Pdhh
         lOxfvJp96u6vOrY3AkPq2nLBollYTDQ2cLdqcg9I0nD0sEwUbt6U/nttvZ259fyGYsET
         7QihBslhRUOpOM4HQhRNAgKfVqf+LNx8EdWwSuSihoApfxFzLs/9RsQHH+d3zqA7+B4l
         2Prg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqvjioomf+RAR5tfxBkYhx+6zH+r8u9C1Au/PJQPs6unttyzN7H
	vq8gUAAFrhMreT5W2DPZ4YU=
X-Google-Smtp-Source: AMrXdXvC9cwX0t53PM0BLmn54DUO6VnQsiL4te+0m2dLil3/pcvnsGU6InoSfsd3aiqxh2IvDrvA6Q==
X-Received: by 2002:a05:651c:1a0a:b0:279:fef6:2284 with SMTP id by10-20020a05651c1a0a00b00279fef62284mr3692378ljb.88.1672642261731;
        Sun, 01 Jan 2023 22:51:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1182:b0:4b5:3cdf:5a65 with SMTP id
 g2-20020a056512118200b004b53cdf5a65ls8643839lfr.2.-pod-prod-gmail; Sun, 01
 Jan 2023 22:50:59 -0800 (PST)
X-Received: by 2002:a05:6512:4015:b0:4b7:31c:7779 with SMTP id br21-20020a056512401500b004b7031c7779mr12591339lfb.4.1672642259667;
        Sun, 01 Jan 2023 22:50:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672642259; cv=pass;
        d=google.com; s=arc-20160816;
        b=YsZRt4Hcv6AZF9gjcTNpG6pdPrjI8S1afracLMOgogtZLenDQ/iPDXbP5VjoaacF8z
         ZugE3rlWqg6iWVmS464GnZn++KuYU2RKMkJ4S/Ysx+JVj+mBVkRovUPVAfByNy0fZoJ2
         i8sViKKo2YWnMGnHonK+8rVAiBSSZDKFjnewbtBdG1tBion+Xcyjg5At6sdlsOpTHsjH
         dKj1tZQtg0CSaoRE53ZE3fOcx5JpnnQpeYAbMJbeSz3j6Iy2E+Yk5Fa09i9aVApYW4Sy
         cS2YmFuVenCSzSBwjAj760UsS2cnPbjM0zK39uzwjTW+0p25v1oUUuFhC93Xi591zPGD
         97uQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:date
         :message-id:dkim-signature;
        bh=kZn/9yJKPg6rwZLFGxBWSayXf+UkTkXMAjZl35yz49Q=;
        b=b7qcSy4d5yMWCA1R5plxDC57xyXyI4tyEG4E/PEAE41bIEy+ok3To1FzOWqItIWn4X
         Pu7lFFMQDq6hF/698rI5kQzqgSAIxCBesqSWyJfEZih1ILffj0ENWEquRZYa2UYJDUec
         G4XNO0qWnXWWGALakpI+cRB9UcequrkTVq0jAMqlqrKPnDmtunBFkW3y1iigG74M9bHt
         R0vnsET2co1CWPbnMQZcZl8Czaf3uTLjXXQPsV2Boxrijw7572rJBFyaOYCUXMGQ9LbL
         1GDmvbTmXaUwR6GT6l5fkd1GcIQfDeytgpT1Rg1+KXMgrjnKn/91gPpO9C75Bz1YGX20
         ocrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=tiQIRZvG;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.52 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2052.outbound.protection.outlook.com. [40.107.7.52])
        by gmr-mx.google.com with ESMTPS id p24-20020a2ea4d8000000b0027fe115019esi271880ljm.6.2023.01.01.22.50.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 22:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.52 as permitted sender) client-ip=40.107.7.52;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyoAQVeCVeiKAk7Bw8Ctru+VQc6u2OaolDA/zZkjCA6bgkU7J2edxaStkba4NsgNdXwK8NI6VKPN+pclG0ZbeV4mxjKTQjGapWpDEGXldjXkK27114+xccHmvzdzwHgvLhNQucns9IRw15B6fLNOKZcGxCtuacChxhozsnSzUV2+ZqF+CWeLADIwZYdCbHF/eqaVIoYO4iAg6pRgeqVuZxk/WiagSfuQhIWy4/Z5XL8BSALsmEdw5M98yGFXasZmOPhiuO2jLhW6FbnI8ktnZej8JGHAxCK6MHRmoN90fc8RArztQj1AFOvMNTgVd/lQ/7ZXXYgUlLNYlqah81dryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZn/9yJKPg6rwZLFGxBWSayXf+UkTkXMAjZl35yz49Q=;
 b=PijsfWgQ9WzVJ1K7kfI5OjVEn4Ghib9dVXgR0DzOB3GmDu9zal3TKLoBpel9bbosYFqZdyznFVluYEofvAIVBHgHXq8dpkGLJH8UWgsh9+z4hGv1qGB7gWlJZdijfBXZH/VlgbUaMwzBrv7DGiTEjuXYtw3QoRv1JPaQqRaqdNnnrINbM16u4hEx6E/xrAB0Gq9ulxoBnr9rPZme4GqDy4X+CgTxufgZm0QYYMGq2QcB/DuvJpcJjdVovKjt6V3g3S0T6q5hNb54c8EVI71zRWvblSxHBSDAVWVmOOepNWLLVCdASd1TWK9G+ZWgAV2qAnKQ97czgVVUKIj9NDmx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB8PR10MB3499.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 06:50:58 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 06:50:57 +0000
Message-ID: <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com>
Date: Mon, 2 Jan 2023 07:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: jailhouse-dev@googlegroups.com,
 Chris Paterson <chris.paterson2@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB8PR10MB3499:EE_
X-MS-Office365-Filtering-Correlation-Id: 17eb2289-83a5-4791-54b0-08daec8db3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqK1bj2yiPmrsnOPxJBzfMWTn6FiVb5tBOS3mNh+sds2GNpggmzKKvHgpH516FDcUd7pt7PRMll53H6vpzDxyO0K96ICu6obGSGGi4pbpeQUYb33uvznPt2kpv2eGU/KTwhgM8RgxshkDoTEiAYrm/X9AF/Usn72caWw95pi3RJFICp27L4pIMyRKszWoL1W8Ujj2MBFcO7lhrQ2wy5U3CHkK951wK61SLT/s/TAIQVENSu4ypttwl+fHwdMst6gubYHYjk36KMbOrwfoOeH00AJZ0BxE34mfHLUB4ZKyopIfQmdR6g6f933QSxOph+A7gWGJJc/Z7TM7CE4Kz676R1i+pUKRG5YI7NORZ+V2d5pM4Lix0G4GHTjlLYavV8nHKyOSjq8OnElun7f0scrcVnKbRieFE1xcn9BLkSklq71JEI/pgbft1+S78CdQ73TFczrJkHNA8GkPEjkJ8QKGpM2aGRkW2RNMySnc8N3YlVJPg/L9+xsx8HQNOWWCPlmLQ6KON/xBe8JD9UFkw++buGrGAx63TNqRk/um+gCmCXIfJwC9+7oRiPNQ3q/FGBL1Zzq5tVZW+KMXtuP/Xt9NLq6yWi+UnaR57Oth1WQu9zc4mtjJy5RW9Gg0u7wXHiPnXJ/kq/cNNUpCAFIfl7vQZQ1sN8LXCdXnWyL16ZjHVM8PZveqUQgB8PqA1bi4jkUy3qooFK//WLNeZyJHA4F6H/XQXrZijOcu1XcfBohi8q8HXQpCWMKki8W3R2flI1QfGjEaMZk7VWmh+ld5Tc2ro/PsIxHvU+/vQjMoWmWafmq8TCw8ERFyfIliOSAQpuBmmfeybrJnw8qUyUG3tsTJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(36756003)(82960400001)(2906002)(38100700002)(5660300002)(8936002)(41300700001)(44832011)(31696002)(86362001)(83380400001)(966005)(6486002)(66946007)(66556008)(6916009)(54906003)(31686004)(6506007)(478600001)(6512007)(316002)(4326008)(8676002)(66476007)(53546011)(186003)(26005)(2616005)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2Vra1EweUxxTDJYUUIzQ3crQUtMVXF0M2xmNnFOTWg3bUNmWDdEd3hiZWhr?=
 =?utf-8?B?bHFZWmFpeUZoWHpuNUUwUWtkbjBrYzY3MU5oSVVFMko4UzRidkhxU2JIeVVB?=
 =?utf-8?B?VTVXWG9pSnJOMklyZGl6TGN5OUZZUWtZU2ZLdThYM01MQ010Q3FiM2V4L3Bl?=
 =?utf-8?B?NTFYdm4vYVBtcUUwWlB0d3g2VDRuTXJxaWp1VUdwSWd1ekJEV0dFcVFhTTFD?=
 =?utf-8?B?WVN5cHhPZW9hd1ZaSVJYOUlTR0FHWG9HeENoclF1bDl6MmdyY3dXamV6TWpD?=
 =?utf-8?B?dDhtWjNBc1RNQVI5SmpUaVpPb2FCK2ZPcDJ4MEUzVnd6bldhMGFUMUJ2SzJJ?=
 =?utf-8?B?MHh6bjlDWVhndUZqamJ1b3JwbFlSNjdYK3haR2JHYzg3MG1KTXNtR2xoRmtV?=
 =?utf-8?B?dlIybGxpOXU4NDNpa084T2VONzBQWDdkWmFFdmthUHVxN2hKS25Kd3FXRkNj?=
 =?utf-8?B?dGVWclY1WDRzVjA3ZWdqM1dMakZBckl1Wk82Zzc0ZktaY1AvRHV2QmNheEJM?=
 =?utf-8?B?S050TlFFVkhTZGN0REloeG01Q3pxUzd1NGFMSENxZzlVZ1NCNjRSUzU1RTg4?=
 =?utf-8?B?eVprZjdHemlHb1JXTkJ5eHZZR3NtanRiazUwVzBkT0Y1dklWYzBaY1RGQTdE?=
 =?utf-8?B?ZTB6Tm5ZZ21jWElpT3lMUGc4ZXBRbUhxeWQ0SXh5eHVZdUs3dmlFN3ZiK3ds?=
 =?utf-8?B?dlY0RFB2M2l0WnEvRk9TRUdIaU9vWHlDcUFJYXFMUk9rSk0xekJjdE5OcnZE?=
 =?utf-8?B?aldzMzJJVWNkMURydjRHMUdpQVVYaU9wQ05RUUViaG5NYXVRd3JXcmxSaTBJ?=
 =?utf-8?B?RkdnT1ZpSnU0Y2t6MkFhUlJ4YjFKUVhuSTVCbDNvWWwwU0c1bmxZZGF2K0JR?=
 =?utf-8?B?elpBRmpXdkxSZFpNSUsvYU93QXU2RmJsMTBPOVkvUERsWDNiaDVuNjZwcnU0?=
 =?utf-8?B?TGQ0RjRWMUFjSDRrMmJTblBuNWkrSlQ0eUQxTG42TGYrbTZUQ3A0dW1PeC95?=
 =?utf-8?B?RkRSSjhrYkdYaDRLVEUzbDM5Rms3Q2swYUc1QlNpdzBNYy9UM2VTZlAydjEy?=
 =?utf-8?B?VkdKNHNFTEVPVjhxcWJJUUt1OC8xOUtvUlZnSEtscmFJYjM3dUpGZWhVLys4?=
 =?utf-8?B?VDh2M0Q4VUswREtBbGFucXU4RVI0dmxjNGlndzFETWhFY1k1MUNKVlcrSDFM?=
 =?utf-8?B?SmgzMldWY1BDNDJSSE5ibkp4d1JBMG9xUW83dk5jWHlXTU1NbVNJa1dGT1ZM?=
 =?utf-8?B?T0NaaDluQWdnMVJ3MUNNenpjRVZKYU5rVjFVTEh6UlpDT2xVWE5xWDRrVmZi?=
 =?utf-8?B?RExJZExMZmRzdXhxQ2ZvWWxzYmhKWHE5cTZsby9ncUpFMWFEZElrWDNQaXA4?=
 =?utf-8?B?bzVEQldnbUtCV0czcUpUbXMyNkFZY2tCRGRXa0hQbHl6T01NNTZZK2JYaFVE?=
 =?utf-8?B?cmNKQ2lBZWo0dXZDdk1NYnRlVmY1WW40d2ozMUFiMWJIc3NWRWp0WTdoM2d1?=
 =?utf-8?B?VXpYQ1VlVTNrYW9TeGJyZXRNd3lNN2lzOTdDN3BPWXUxWkQ0S3JwSXRxa0d5?=
 =?utf-8?B?VW03L3ArQlNWcEVtTXEzMTh5QnprVWtwZ0VXeGNxOTY0d0ZveDM2eXBzQmtw?=
 =?utf-8?B?LzZXSWZ1OWQrK1Z1RmhUOUZ6TVpFdW9leHQvaGEzZXQydm9HT3J6alNudVZt?=
 =?utf-8?B?dUVFTGVNckpDREs1WWIvTWt0R3h6cDI0R1JzV2NKYlRjakZ4c2pQaDM3SGIz?=
 =?utf-8?B?ZGJuM3pOQU1sbGw0NlFwNTV0OFdDQzMyZ1BVYlg2cnhYcjA2WWl3dE9zc1Ru?=
 =?utf-8?B?OEtXaUx4OG9aTURTMjJpaUNFQVlMRkFIbHllOTllTjN6WHlVWjZGRzAwY2NR?=
 =?utf-8?B?Z1RuYkhMNGFqeE03bG9PaHgvbkFwQS9DWE9BckMyMVAwTUdpN0tSakFITi96?=
 =?utf-8?B?am8vZVpWczN5UHFkV0E4Zk1UeEs2UkRReU9vbDFRcnlBOHIrZUR5emFTK2Ry?=
 =?utf-8?B?NXZ2RDl4akkzZHRDQ1NDS1VGRTZTMGZwWkYxeXlVZHdwc1pMN2lXa1FwV0hh?=
 =?utf-8?B?aVN4eG9TajMxeWhnN2Q3MnZvbVZvSTdRSzY5cmNRbmVoMWo1OGdhbnAwQ0hl?=
 =?utf-8?B?eTluakdSL2NnaFoyTEFkSUJ4cy9VWUlWNWJxRlJmeWNEdUFqYjJpNWFCclE5?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17eb2289-83a5-4791-54b0-08daec8db3cb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 06:50:57.9212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApwOxKO9NXd5i4Mkc0p60HAJ4HsjbhferolYNtMMVKZ9IY3sVVUlV3rWSwTau3D0+NrHvSmhJrFyQ+TT+RCJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3499
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=tiQIRZvG;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.7.52 as permitted sender)
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

Hi Prabhakar,

On 29.11.22 15:29, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Sun, Nov 6, 2022 at 11:05 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>
>> Hi All,
>>
>> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
>> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
>>
>> Changes apply on top of next branch [2] and the kernel used for testing is
>> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
>>
>> No changes from previous version sent to ML, just rebased on the next branch.
>>
>> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
>> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
>> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
>> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
>>
>> Cheers,
>> Prabhakar
>>
>> Lad Prabhakar (3):
>>   renesas: Add SCIF support
>>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
>>   configs: arm64: Add demo cell config for Renesas RZ/G2M
>>
>>  Documentation/debug-output.md                 |    1 +
>>  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
>>  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
>>  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
>>  hypervisor/arch/arm-common/Kbuild             |    2 +-
>>  hypervisor/arch/arm-common/dbg-write.c        |    2 +
>>  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
>>  hypervisor/arch/arm-common/uart-scif.c        |   44 +
>>  include/jailhouse/console.h                   |    1 +
>>  inmates/lib/arm-common/Makefile.lib           |    2 +-
>>  inmates/lib/arm-common/uart-scif.c            |   65 +
>>  inmates/lib/arm-common/uart.c                 |    2 +
>>  12 files changed, 1594 insertions(+), 3 deletions(-)
>>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
>>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
>>  create mode 100644 configs/arm64/renesas-r8a774a1.c
>>  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
>>  create mode 100644 inmates/lib/arm-common/uart-scif.c
>>
> Gentle ping.
> 

Sorry for letting you wait /that/ long:

Patches look good except that they are missing ivshmem support and an
inmate-demo cell. You should have a demo and a networking ivshmem device
in the root and the linux cell, the inmate demo needs just the demo
device. Check out other boards for the required pattern, e.g. the rpi4.

I'm merging patch 1 already as this is independent.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a9e1e756-978a-f2de-c4cd-838f1417a8fc%40siemens.com.
