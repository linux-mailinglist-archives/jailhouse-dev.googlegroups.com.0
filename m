Return-Path: <jailhouse-dev+bncBC44VTVY2UERBTGPY2DAMGQE2NEWYBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3a.google.com (mail-vs1-xe3a.google.com [IPv6:2607:f8b0:4864:20::e3a])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C73AFFD9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 11:05:17 +0200 (CEST)
Received: by mail-vs1-xe3a.google.com with SMTP id a13-20020a67eb0d0000b029025a1d69d58asf1800461vso.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 02:05:17 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1624352716; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ts2YwmIYlojp4pp5sKyTPoRcDId7EVv3AM4fF/u1FFK0cc+1KihqipTbv7MCzjUSxw
         SmcifCfr8be1xcOibAxGk1O4gfbjDlckBL0/AcqwwnbqwrKuLfjQJ4NwjQ3eWPw58UZy
         z19bpZBtfPvM+R7SMizo7a8EnPcotYe6yGy0og0h+HKdc6sTLvy4lSfKluD7+7zcolEj
         rvwkhZ1byXt/TYwf1jB0jbRETgjUIaOKron408zz7MosaKCbgkDDdBNuLikY6rwX8v9P
         iwb85c8ZWPppxQrllczQgOy2mpMIvfSL7jdkEo8ghzTfhaQMiZVgX0eQorx8vsOsp6tQ
         ZUTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HC/7o3DS33/QBVXnU0JdhlBXRxCQiEegTSqv717jkUI=;
        b=wnK0ciwpk/KDBrw7ECySwvJWz93yjcrKDNdS332V25l1h10bfth1DuNIEqOGNSPy8p
         jRXNH64dSFKLVQRqzS8ogMqYcWFiaTY/I6xZO7tpoeWmTQIrvw36NR9odKLaRm5BzFkk
         fZkaG9gX59p1JV2n+3ilyHMQyFAK/VoR2HdC2mXSB330X2PkT1ZItmCYLV/YkiMUpABv
         syWD1S/vJwk50s/nOuEP108BdDrtUl23j//8V86q98/34F9SvqVLPv8K7iqlch35pxNJ
         E9M8MTZwpKFOlK9BNnJJlA4t1YZOgJMfYX3CMfz3WbPDjMB/btdLdcV39EKmSOSsvOmH
         utbg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Ntz7Uywp;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HC/7o3DS33/QBVXnU0JdhlBXRxCQiEegTSqv717jkUI=;
        b=DNqta7Ev3F84M9NSpc7eH/aEuNN5WD+eYiR19pYHWI5KbC5xWl8nJoA5T4rGtcaUM3
         4qF1Abu4xtAen2fOOUOgMFz+tH4McuENpyMlVwXhIbgzw2i23Bu3DUkz0p9aBvL1RS/3
         7HuirQi5RGBL3JxK5ZgGyxpaf7JXByuwUjqn2fnFAmk1OZjZlJ8f9pJMMnM8Kr+0bdEp
         wOqpWAGO3fXzT2q4/RZeot3S0eIcURRrc9cyowSUvAhV0sIjQn1dXskZHnVcme1Qmz5x
         xRmg4xFCEYAZrLcJ25+zKW/5eg/PfYaQ7VGDAEcEyF0mHDKZwQwoiGU34/FKTLpBdDNi
         vTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HC/7o3DS33/QBVXnU0JdhlBXRxCQiEegTSqv717jkUI=;
        b=iFce66pJ9dJVIY9sxt19QmdBKUSbUS3B7wIn/Dqm3hCXGktCAzjJqnPycWnOSlw0ro
         lpTGrz6sqo4dDN/cH7/szhyvOAtf2MGQAX4lqZ4FFgqQLbzjznIxXLRDXS5dMAhNDDP9
         Y26L0fwkoXMMAOobvHYZm74zXqgOxBCvblzrvFl2IJx0dDCLAYJk29KUAHVQreFmXp0j
         pk+BN7A3pF9LMFbOAOQvQKOivfmcO1AOXYFP9kkElkTEpA24bEu4y+KgA5D4IziHV+ND
         fBUjQT45A6mKPLg620ctLRTqa8mv43PyGNkioSS39slT9ZYFbqFRYdIufl+8WPgRADW5
         trHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KLRl6epouIod0t1Z8PKvWfkN0YXAO8sIRPYEjV0SOgPrhdPDj
	aL0MkSf1aKucIQIYHKeSeCE=
X-Google-Smtp-Source: ABdhPJx0b5k3gpWSKyZP7k+/IczL9Cx4AOMWREK0HvOmRhZcynSSwbu8CA3wVyOcEJgrJKd6GKqiWA==
X-Received: by 2002:a05:6122:130c:: with SMTP id e12mr17779400vkp.12.1624352716734;
        Tue, 22 Jun 2021 02:05:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:2104:: with SMTP id h4ls421345vkh.2.gmail; Tue, 22 Jun
 2021 02:05:16 -0700 (PDT)
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr18006065vke.2.1624352716197;
        Tue, 22 Jun 2021 02:05:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624352716; cv=pass;
        d=google.com; s=arc-20160816;
        b=eqVQaV0mKOtGzw34VKaNuKQ+cKbwng0375CQWTtYtUn2oy0ucsuDlZfXeMFEQBGaEI
         CWqb00SvpeUfAHtMWE1OpgQVb5hcq4af0aT0H6TsIGSGYq2AbZnvc74cCQrkDXWGbXM6
         ang0GYGmvJyhZwin8f7UNxNQxkxeJQnw35oOI+fCgpRfLz47g5idL+eLRgsMj9TPdqKW
         53lnYWxhdz3Tjf2EQGgomyBUsh89/eLw6dHxsdlXhdw4U/3TwFl6D3OjoyDK5WuH214X
         ToTdo6SQbc1Uhu3xYNxiAg+4ZfUbelkJcw79RrMonHT92PZbOdySTDK20GMxd6cR6uZd
         LXpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uVt4wCK8qHK5lZM8nY1yF8Mvm54LS6Z/qMmClRIw7Wk=;
        b=FlBG4/cZdZzXk8UPpVz5OuRZWIJM8v8foO4rWsAbOPSXPj096LCZz/MupAJklNylZb
         AjQrzM5JZXxmwcUVupIDGrMepHUcirTjE8Hw779z7xIc7v7w+lhvXHiHn6nUiS2gW0v9
         RwA0uzPNCKLptNP064tnZvWAM29wwS54oQ2iSMzaocRG3/ZfjnixOVZUtOkR/T8NjJhx
         da6lrmwQNcP1xjuIeF2VdU9RqF6FlhOmvpNUpPndC4oPcScSRvlbB/RgZANdoKbODSqw
         UnBKtJ005F/VKC/eeagUoas+AE/vH2iYp6xplTRSP8rHmouNyVgsy9WGkUg1Z/HAGcAp
         ME6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Ntz7Uywp;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com. [40.107.22.50])
        by gmr-mx.google.com with ESMTPS id y2si205135uaa.1.2021.06.22.02.05.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.22.50 as permitted sender) client-ip=40.107.22.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW47h8wFsXYwQ5mBNsAhifatCpGyjaws87iEI9aSzX7HdPTeFKPdAMzukdI98AHW3tC6YzMLlHoP9s/wDKzQf6KtkQwtstMzpKdvP0+mT4JI7j+X4t3XjcqXPu5YExrnRRIPq2GhvVQPv60K2vTgwq/uHhcyRHfp1iZRJ+WyLNFclQQIlME4LJFgMgPfglB8QcpC4X340Hmiln0HzA5PcUqQsINlIvh2QoJJ7eDXnm78SJ65rZ3LlzynyA6kXdFkK5+m0JjTp0+lQ9d5xvFRKYk8NtngDN2O0sMklTlM0AsJp/1tlyRtjZ0nWg8Ho3Sy8aJX0LRW/Td4CFiLDi9hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVt4wCK8qHK5lZM8nY1yF8Mvm54LS6Z/qMmClRIw7Wk=;
 b=fqs3lUqtQY8eRk+gCNRf5CzRNELN6abk7gTeFD9a7GMykwfMN7KkOaA+yLlXQTMOsOuH2s6IRiLeoe7BqCuZFQD+DjEPs8Tjj5acrNv9xp6U2jfCmX+SNsZIwEpQy0KgY+9mHpMUt1xw3ux71UGUknZ1jH3z+iRP8JWE7GQzpCQMx15peRTO4wa84tQPUfPcBGbaE4cM9jQ7AWxWPIqGnD1z7PvdXywq4aFMRaPuogh9vAguelPGOMhN7VGT12/2cK/CECpG1aGDuAe8RYQJKpwfbcAwwVaefqQX7/tdycjgE1wfIAQwfrJoH8indss/XwBfBs+L6zty9mwqJh1O0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM4PR1001MB1427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:05:14 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:05:13 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v4 4/4] doc: Migrate docs from python 2 to python 3
Date: Tue, 22 Jun 2021 11:05:02 +0200
Message-Id: <20210622090502.231179-5-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622090502.231179-1-florian.bezdeka@siemens.com>
References: <20210622090502.231179-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
X-ClientProxiedBy: VE1PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::25) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5) by VE1PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:802:a0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 09:05:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 276a9482-62f7-4f94-9f73-08d9355cd850
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1427:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1427C18F116834E3D9FD65F7F6099@AM4PR1001MB1427.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cZYUCpQ4168NWtPLD/MaxNyJlgauvdN5SI31GMjxa+fYUUHn6B3I+MuFCGFIeNDBDt9nHaBk/AnHa+aGFcJQmWy82LZQctZ8zVmsfE9kBNfF93DXm/lMARD+TebTojVhMaezuz0WJQwamEAk2FpO3PzDzCfqjqxNv+KLiRHkbzXQfnC4xfpz2VR+E0EQJzne3VRdpVbdukb2P+40Mm93cHyUwaZ/kDWW3RCU9jUPKeZrqItI5TtPJe/7DSziYGK8jqTMjeNSQvWwKmbO63AYpXYeNCK+1QUyi3fxZNO5+NYYT0hv8w2MHo7F3cOS/JPtYQQi1R+eKKXAHEGdhvPKP9Cp6BaEHptyuBHpDx83fQqlzDhoCCbdlxUpH+Uh6cO1vLCcuOEfvpz2mCwdbO/COf4Bt+cQp1TXd/6FKVh6bDG4maw/4DaTwvHyTOfz/Oi6f5entjwRdaFBlSLNq1CEocKSRw4kapZ4Dy+agP0GjXyRrmSZDPhJYivdYMDH542tM/6xo11JuVhBU8yz+r9TAsfNI1bpcu5Paw7FY/Gec8B/NG4SbYkYTlqLZ5HKUHDq7YaIm81xCpE+9KXlZYoosXr7ixaB3L/JX84PgRquMtEaZOhyZMsBwnl7suEVF3/mruOpqSiHWMGSuDbdR+Ailg4KKiumvNSV3A4qmvFAwBR3SapiKs+bXmSMxdRf7a5d3LvdrPw7iTESBcMaISIbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(4326008)(2906002)(6486002)(16526019)(86362001)(2616005)(54906003)(8936002)(44832011)(66476007)(107886003)(66946007)(66556008)(6496006)(186003)(8676002)(478600001)(38100700002)(6666004)(1076003)(316002)(6916009)(36756003)(83380400001)(966005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tPQVnq1y+brk7TKjzZFrzhUkLv8K571HIFadVmzDiM4c4nTstOhPZ2pu+uR6?=
 =?us-ascii?Q?NelODhkP7UpG+wZS6XMabe3Kmbz1nFITOQzi4cmEQar/uhEl2aYeVxsbpTgM?=
 =?us-ascii?Q?O/cPmJSuJTDLyvaql2bxVVoF07bDf5kxVQ/Cgi1cRU5MOSr6jT/H1Egqj3ty?=
 =?us-ascii?Q?hns9H6sZAaFdB4cD9UYSDJ3nolF+B4EsAszZIrhZiWhUIoiZaavV37aRAQfj?=
 =?us-ascii?Q?Cs7DFesDlSy4WW/m1bRFQcdkM6GpGCKW9SZypuF6+67btbrw3nskhQyJlPQN?=
 =?us-ascii?Q?YzUD6KgCY4ejpmKucXtjir9ZxeCAK5SRtpNKGdKHoMILcQg3j0qm8qzT8+/A?=
 =?us-ascii?Q?IMDAJqe2RE3JGkZ5utPiyT5z2TIUvqXHfhJEN4AbUGy26B17ifO0C5G1YBHM?=
 =?us-ascii?Q?m9d1kmHN9OPJPQc9aPLh0pPC/OJWyAJVxF3OSOx06kzjhjqy/EuBMFK+EuSm?=
 =?us-ascii?Q?wZbTt55pT0UCorleE+w/0gAXNuOTuVohI/dGbyEQpTNUrPZqyiXYSYuWIySq?=
 =?us-ascii?Q?GysK+cM9ne3q9np74ormlwhljbDKMm04no2LEJ6kx5bdtUE8ujIzmIXN5MKr?=
 =?us-ascii?Q?9X0LFFqZ2p4Otxto3MFvPg9DrrGdx8nJ26GQszaxlopwbnmhjKy+5wCVBKZA?=
 =?us-ascii?Q?G7PMpgOgMI6OPeY649dFkclbwzp5YvmhUKF/hS/w38cz2FGTUtKNMpHvacUG?=
 =?us-ascii?Q?GFq3noIk3EQRZLwhvwjU9OVkmwFEHTVIk+8hpSFXxre+F7l9h4yw3pxJ25Qv?=
 =?us-ascii?Q?4jRonVELWriw4j9SXjh2Io6RCACKNZqvWTm5CHxGO12pvIbRWGK1cSxLAFkv?=
 =?us-ascii?Q?s4hxRexFyL8KHJoHqy7R0fq5TZrfPpw0qc+62GK6TI0wgS+mKPZp6A6shGw4?=
 =?us-ascii?Q?avADImSrewBnvkvxXAPkcCDd0AqXpGCnHIc99vBlqbk22w4kvBHTRNN8X0//?=
 =?us-ascii?Q?iYFFZpPQvxJEo1jBarcw5eNUJucae0SmPePBwCzfJlW5FRrEd733K55y4P6o?=
 =?us-ascii?Q?fMPvdSZq/OY1UjeNbwaOOJ3Zt61vhdrfbVga4ijy0tfwbHq/Nn2bJZPghWlp?=
 =?us-ascii?Q?74jlpd1TIgg022/Uv1bPYArjlufeGmrIaWsKE3Ek8DULxZQxXWC0d5BIbttb?=
 =?us-ascii?Q?fpZfJmP6U/w/nLY0MvLmBbR3y5elYM9tTlHPk++D0HdXWn4PSvotibZcKtac?=
 =?us-ascii?Q?ccki7vSDk/GxVyHKWLKV6ZTs2KWQQnoxMmIqUlGGnWw/tjkWGlnPC8Px4igm?=
 =?us-ascii?Q?nPhAvwebcx1Ky8mf/d/5j5uNOgLr3ahbYDeJX7cTqLiZ0HjSXsYtm+2UUkAs?=
 =?us-ascii?Q?tr0cVdjXtmKX3c5XlERgpeFk6lQnWdoSnplDrZ9pBX1TLqTwGOqMbZEvbayN?=
 =?us-ascii?Q?MuNPT52XkWEnKbjvx/NOVjYjpDrr?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276a9482-62f7-4f94-9f73-08d9355cd850
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:05:13.2781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9rzvyZLU01u8A26DiCkDl4f+dI3C5DaenevCydMQSrNtdDQ4QklRwHeWEO8HwMC0wa62LTuh4goH+EDv/pm2AipwX1gbbpcGANgofJ0oko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1427
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=Ntz7Uywp;       arc=pass (i=1 spf=pass spfdomain=siemens.com
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

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 CONTRIBUTING.md                               | 2 +-
 Documentation/setup-on-banana-pi-arm-board.md | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 249618df..dc4d9785 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -34,7 +34,7 @@ Contribution Checklist
     - seemingly unaffected architectures still build (use Travis CI e.g.)
     - static code analyzer finds no new defects (register a github fork with
       Travis CI and Coverity for free scanning) [*recommended*]
-    - python code shall be tested with python 2 and 3 [**required**]
+    - python code shall be tested with python 3 [**required**]
     - the world is still spinning
 
 - add signed-off to all patches [**required**]
diff --git a/Documentation/setup-on-banana-pi-arm-board.md b/Documentation/setup-on-banana-pi-arm-board.md
index 115ff66d..32f6c949 100644
--- a/Documentation/setup-on-banana-pi-arm-board.md
+++ b/Documentation/setup-on-banana-pi-arm-board.md
@@ -228,7 +228,7 @@ $ sudo checkinstall make install
 * Building Jailhouse (mainly for FreeRTOR as a cell)
 ```bash
 #On Compiling Machine,
-$ sudo apt-get update && sudo apt-get install -y python-mako device-tree-compiler
+$ sudo apt-get update && sudo apt-get install -y python3-mako device-tree-compiler
 $ cd ~
 $ git clone https://github.com/siemens/freertos-cell
 $ cp -av ~/freertos-cell/jailhouse-configs/bananapi.c ~/jailhouse/configs/arm/bananapi.c
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210622090502.231179-5-florian.bezdeka%40siemens.com.
