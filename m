Return-Path: <jailhouse-dev+bncBC44VTVY2UERBROPY2DAMGQE7IDNYDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6D3AFFD6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 11:05:10 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id v142-20020acaac940000b02901f80189ca30sf12290581oie.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 02:05:10 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1624352709; cv=pass;
        d=google.com; s=arc-20160816;
        b=0QsDZdDWBYfeqlX9LC3r8AwUwGxwqBzhpgGz7bD4m1g+tKpNBNfea4nDRYqRbSd7wJ
         69wLLUiR6uqSDqP9rupbvfXaKbYes4c1HTAub8opwSTSMtJ0WQYUO1hQNjvmxKhTGM6A
         EQTcF/ntWA1qFleCDXKLCtrsyqC8V1nkT8YgwXVm5I0E1MMLn1eucumRQY/mpcYD0C0N
         5B5RYmXISrwrkfhn99ZdpExZv7XGaWsl9Qz8N8u36etQLG6dKzYZY3KO16KzEUkxo6rh
         yOJCTYMlIlORTGVUK/Ctgi/hhjCF+ii41MySQpRXx95XbAatgx0kuGnrjsty2/KE2r5U
         4IWw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=6VQQObDQ+xHyLlVr0KQvwbNd2josDok9pOtsiQOE1S8=;
        b=iHsobzU6kCky14TZVtUqfan4sGxol3+fPRHtuMMJIWOv7g5wItUWrAwoqbmZk78S2n
         qPyAtrXh9h732Y+iVahDa9RvNcTa6qDU2LoODtUoEbsvnzMMjaJtHRVzOBQ4hq/6YDfi
         NSQFSy0k9nBZHCy/JaY07EmP3f24JIrs5bGHFWn7UgC/piRF1XuKtAuTu0+hpW/EOSgY
         LmRs8UWDNDetgbi4w3ADH32ujHGtbquiu4jeL4H/rACDsVg0Plxalf3vfUh3l9ldTl0X
         0k6J/VUpQEC0ns6NRp5YpxwM8tO7KdodHaTeZRKHko9/AenprBJfIw5rJmyEgIA/AGZa
         484A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=et8OulfF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6VQQObDQ+xHyLlVr0KQvwbNd2josDok9pOtsiQOE1S8=;
        b=LzW1XHnCdr2d1Qb6rlqEoS6w5Mt2BnI+A29+ck3G85ZmMBD5GGryu8gYzT8/S3A1kY
         gEP+8cIeKv9rQwY9jr5i7Mke43YEkOzITefLiS24d9N2IqYcfPJjBR5cW2doWcELOlvW
         H/IoAP2ylqPzGj/3aIxr7rFfUOsHSEbTVkwuiU82M/Fo0lqYqff+xEWKgqRL3jifbCUn
         cIpl+a2VexfFUtFSV0fQP16fVuyoyeCov2IeFE+Pj1qSJCIBQIuNlqxeXTfcYOku8b3+
         OrT0BEFARqt7/YczQQAx3UWcunS/useVuFrWjoJ0GF4FN1bLUSiH+ZvyLeQ65EbHb5no
         p0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6VQQObDQ+xHyLlVr0KQvwbNd2josDok9pOtsiQOE1S8=;
        b=hTNxvyAqnVlm4rnI0++afTHWb6x9sNpFNZMI0bjEY9hpxNGHZCyqpYAL1wCn3YdAii
         snWgxvxr/NGRYmCCFX3gL6YajbxQolryr4BiJQBoqnCJ5EGLFAtRNq3FkcKiFccZopVg
         7f7BApKiG4OQeQG1Vh+i15P+otbhH7OgdWX9CopdgZidUbV4eqiYZenjQS0/wCZFTmu/
         6qd7oc8JUDcUoTGvMml0+qHQPW8WaIBVpuwiLEyF2MHjgQraoej4ZFKWUCUgOE0Sii8X
         nYhA/1698QxXtYSqm8d4YE6siXUOsP3a+bA6+X7UeDR0fHheMZBnDwBfXkPMY3P9J7DX
         /T9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533c5AGQyvPKMWzHJDxv0yAU5HdBDYSLqKUy5s3bV7rz90zPNqNm
	ocVadybVR8xjWtrJc5GYg8I=
X-Google-Smtp-Source: ABdhPJxzHCGCKzqU9aEBOc19FpTtcARNzLTgOZtZTNEtSmfjrwZNt3srTANg1Q+ioj+YAz98mRcm7g==
X-Received: by 2002:aca:b145:: with SMTP id a66mr2298934oif.177.1624352709661;
        Tue, 22 Jun 2021 02:05:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:b443:: with SMTP id h3ls1982704ooo.4.gmail; Tue, 22 Jun
 2021 02:05:09 -0700 (PDT)
X-Received: by 2002:a4a:b443:: with SMTP id h3mr2409751ooo.24.1624352709287;
        Tue, 22 Jun 2021 02:05:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624352709; cv=pass;
        d=google.com; s=arc-20160816;
        b=by+i7nnQ0cTCm57eDvYie90wwqsO1Dsl0bRDJvrwda166LcWUo5jx1lMm3qpvJteQi
         9yP7khP5t9W3NvrfDR4duo77KR+MI62vIMFGwrxGLlIn9iRqQ5inGIvQQEXlNmgzLS4I
         cVjDz06EZZfiT4EzFqsDKc90G0vVeinXF/cHXbZ5oxBFFSZsuFg+N9nuMkvwvI1HaHBj
         kYbEjQunJfClm02tzLS9QpEgybf76N51nKIu8NRHl1jJfLKSeqv2eGXOkoQftssUXmwi
         zoinL9eCDxRzgeB7H9YAv/3/y2yS7ih0oKErB569GZLDOxq6e3vGHSNby9JWQyc4HEQi
         S22g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
        b=KwDNTTJv10RjDRZr1cSRlHctMpu6idoSJNMlxk249JKwJWI9hCnw+p+xlVGaq+Qz5c
         bG1sxQuYZXmIQA4+kr4eVjkk92diPziwnpL0ybBXH86AJoKwtjfNhUke4a+VP29QTR1h
         RrYHtpZkLQpCx00rOsdLLy/siOhV20uw/4bEebK61J0l964mpSU6P8mom+oSDT2gHy1n
         5ptMB+j6x113xRhz3HZe/9r9V+sfCeZ7FtyRL2aHowhQnPd/ie8ji5wkDFAp03/t8THk
         r7YtKUtHsXWWg31LEhk0W4b2Oriz2W2Rx0NM48TN548S1a3SVXhpMNgABBWPsD9160jW
         +xQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=et8OulfF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com. [40.107.22.50])
        by gmr-mx.google.com with ESMTPS id m16si194987oih.4.2021.06.22.02.05.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) client-ip=40.107.22.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiG30cn3JI/6KQEEiqFX832H+e6M9VeP6VUCLmfpc7a38Y3gWFT/0YZcDwi8Sb6kXLChcwH1uSOPbWfn0JTwz9IeCKWbpKywN+lffrqsymn6UHpyKuCdUHR9X6MrTN/jzxgsznkrCXoUQWSVQIIJ3x910Fy1J1uyOvZrk/BAwvimYfzMgISCxujbr6N+uchC+vfXB2kler4jErH89PX2T55eU8qyyrjwKV04wAQ5JA8iCIKKF2uYKYidATBIZjJpVDBRTkslDiBRAmq3FW0JoMEo7DzXjuxX25PmN2AoHeVk34MZgXvXnCBRUXC9iAArMFaChgnYIIwrkmZ0Gije3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
 b=HQjsr71LgAxPpCHHK0eK6h3k1mdpTm9/v+sO8cS2FbIaPAZJcpuyfrF4j5L16wDgeZ72yqIMmzMFb22q6BWSn5rCksAJsINUe2IOT9Qc1xF/bnWE2S1hzR/mqG2Tg/dmNbzL4JZmwLk4QPKFuPoA0/d6jQIqKVXVonw0/pfZL+aph0uiX44MXAL6IKLKhiW3MlwVBqTJyC2CXm+wWZ5e67YN+t3wdUIMjd3esxBCngcWH6rqOFBXNEJ3J5EM5W9syqiRxvBit4+dMu906Qy7tU5QaD5nt7LndbpO+LOYyVwACtndEu6dQ0eyhB3kq9+s0J0jwMSogr4rF8LtjhpYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM4PR1001MB1427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:05:07 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:05:07 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v4 1/4] Makefile: Update build dependency from python to python3
Date: Tue, 22 Jun 2021 11:04:59 +0200
Message-Id: <20210622090502.231179-2-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622090502.231179-1-florian.bezdeka@siemens.com>
References: <20210622090502.231179-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR07CA0176.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::24) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR07CA0176.eurprd07.prod.outlook.com (2603:10a6:802:3e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 09:05:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a9b6b6-d83a-4add-8781-08d9355cd481
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1427:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB14278C89E6595B4D40FB57D4F6099@AM4PR1001MB1427.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: usgifEybcsu4lALgW35RGlbi77z87kOMsOVIofs8vASjvLsYkLy9AnmndLFJi8ZoN5j5S+t86ADMlc5fZ5Ce2rDq5dF32gW8kbHeHgHKa1fM3Q33NBvrKHRK872ZeM9hqgEI0L8zwnVDqBYiE2AOTyoOHTHeHCFSCBoIAL4r73tUzrVyyGobtlf1FhBi5pbFwnBxht63dLLpBMn4UwqWtyELrgBTIqPeLz7ev5mQuuXHs3RdRxLDJwlvdZV5tIU6DNgYKlef5DoJS3B5BgHZIhBV/U8Q5MO00VcUjRExtCPt1t/xkdMubr2Hein1FzeE98zqVSgWNVm0YxWQ2Ctc+uQJ8rmxTVdrVGr/gLalrE1VuXPqdzdjCO+858GHFbrjYL4RHT/uSXoVwhJW6Je+036Jx/uNc6KWC409vCAOvhx8+oKvbK/i1dCBeiN3D8+N50Apy3/Z2ItjiPPwdrKETi6T6ZFqKlhsFQJSpWU+wJK9j+OHGOcHLvO8MyipSjWouKAPqWM5UhTLZ0PvWQLG37+A4M80+OwIZWPjyUH+mdTDM+nXXSWYiMXADRDzLRmM1oyhnWb9JhTqcdOTAkM/RTULt2e4eQUOXYLXQcgDpc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(4326008)(2906002)(6486002)(956004)(16526019)(86362001)(2616005)(54906003)(8936002)(44832011)(66476007)(107886003)(66946007)(66556008)(6496006)(186003)(26005)(8676002)(478600001)(38100700002)(6666004)(1076003)(316002)(6916009)(36756003)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IS8U7Jrfq1irHDjxW2DA/QQ6E3x4Tuzy7vWsJ+dPyCF2Z+4Kuf9MVrD7wvIE?=
 =?us-ascii?Q?dLP3vEJReB7E2nC88yBp4I2ACzx3ro0j1qIts+4b0e28koi8BZWCuE6JpeuP?=
 =?us-ascii?Q?E17TBIgFK1dFYiJlpIrOHLrmaHgtr25uNAcLjJ1eutm8q8bxfpQ2PeiF052Y?=
 =?us-ascii?Q?zeWlqqor7yRR6jqmxkpSk7HEmomu/t1Injz9KuY52NB/H3a+w8o8VDL50Viu?=
 =?us-ascii?Q?pIF9GfTCv9mv8WhjTYWdNuPEQYC9HK13AXYewZRfVvmC4Sac7HDRySQM5XU5?=
 =?us-ascii?Q?Gj5MXKET/hpAZtobfo1djqydjWIerqz3ewgX67DtxddPZkD9n5I2krpzmUKq?=
 =?us-ascii?Q?J9PXLQUJwqjKzMr2oUG4qlbeJu/tTtMBpHJ4enH6i6tZWzV2Mu2U7FNDPzIf?=
 =?us-ascii?Q?lY0knnEv4AYXGaCrkeesUK3qdj7fmkg2mAbafdSx6U2SGxDbt1zHMq50wjFn?=
 =?us-ascii?Q?fvpxMQz97/sMtQKQTtxWlSnUEhrHo0W9BL4hpCA5BkS9hDy+0XkJjtVlLPa0?=
 =?us-ascii?Q?4+ErAYQ7LYFKp9DHNKJfyua0Rq2ewsAVstjdz4MIJ8BtvvrwRJEqrIhGQ0OD?=
 =?us-ascii?Q?sChmgpLlwhw0/INiMRT0wU6ISLezcwisTUF1ivaGTSnfVq7DKme8oJYor8gB?=
 =?us-ascii?Q?qyO7hukh9OZuSri3yEXLm3Yy21S0TT7ktehCRn7YIXBcaGOHlx/GkDPJ4AuL?=
 =?us-ascii?Q?Td04/0BDE63Ax5r8Opl05RSPR9HjblAQg9xZqFWJSVYRMRfs8XTzwzOVigTX?=
 =?us-ascii?Q?IA4Z+eJiQn6zaYzQ6YzHilrJr1TGvdZLIEgWwGDrxpMgFvghBGK2IAWVYiAP?=
 =?us-ascii?Q?6OEEKR6ECULHeMuRKmARodh9usD8t/xvq6ty0fFw+QNH/DxfHi/zof7MkP7A?=
 =?us-ascii?Q?pKqQx4n8DfonmPs41E2oUDTe65s8i5MRZvZicOtGb/fRZVVIA24MFLOpgi4L?=
 =?us-ascii?Q?pHdwmcYc5c5B+qF6sqhsj393IxZBwTkHtbnwD6+ta+4myqggI823KZAzRyw+?=
 =?us-ascii?Q?RqTQrG42SWz5lRi09qx3yv5ARp5qnMl6BVSZlqTNH/CakbzthBD33LicpuTh?=
 =?us-ascii?Q?hQ3YRj9nLeBI0e+MOmPummEjgKGIFXy9hDxxXrj/+YmBivvwEqewaYLT/rtC?=
 =?us-ascii?Q?HH/jwhmlZa7OcUHNp5ZkQL1eRqm134nUvN/vQUeibNOybK2bjAw+sK9zOyv0?=
 =?us-ascii?Q?thQsSxk7LHE3gk+KB1IoWdzvyn66EXSztCF9Pu/g9d2OVjuNKcATv7OfycuF?=
 =?us-ascii?Q?srWTu5xXlntd9etvNoKsYxT1o+992NreA35rpTDx0puonrcLVvfNwkQ7PqLW?=
 =?us-ascii?Q?cY2wRtt+ZXTYpa5gJVuPMhF0?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a9b6b6-d83a-4add-8781-08d9355cd481
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:05:06.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paHa45AgMdvnhO/2PBmMlOFT8UMMedLPQzF4yY95HXicgVrpyQloYVanXOMbY7CZgmWxNQP9jGVuKQb753x4p918C6nFrAx3kkJvCcRsPzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1427
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=et8OulfF;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

Some distributions are about to switch to Python 3 support only.
This means that /usr/bin/python, which is Python 2, is not available
anymore. Hence, switch scripts to use Python 3 explicitly.

Not that the PYTHON3 variable might be defined by the Makefile in
KDIR already, so depending on which make target is being called it
might be defined already.

Upstream kernel has the PYTHON3 variable for some time and is now
going to move away from pyhton2 as well.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/include.mk | 4 ++--
 tools/Makefile     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/include.mk b/scripts/include.mk
index 028f0ab0..d0139d8e 100644
--- a/scripts/include.mk
+++ b/scripts/include.mk
@@ -42,8 +42,8 @@ INSTALL_PROGRAM ?= $(INSTALL)
 INSTALL_DATA    ?= $(INSTALL) -m 644
 INSTALL_DIR     ?= $(INSTALL) -d -m 755
 
-PYTHON ?= python
-PIP := $(PYTHON) -m pip
+PYTHON3 ?= python3
+PIP := $(PYTHON3) -m pip
 
 ifeq ($(strip $(shell $(PIP) > /dev/null 2> /dev/null && echo "y")), y)
 PYTHON_PIP_USABLE := yes
diff --git a/tools/Makefile b/tools/Makefile
index 62585369..4faf9430 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -45,7 +45,7 @@ endif # $(ARCH),x86
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
-	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
+	$(shell $(PYTHON3) -c "from mako.template import Template" 2>/dev/null \
 	&& echo yes)
 
 ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210622090502.231179-2-florian.bezdeka%40siemens.com.
