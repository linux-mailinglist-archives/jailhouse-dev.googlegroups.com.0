Return-Path: <jailhouse-dev+bncBDQJNJ52ZYBBBUX7UP2QKGQEVGMDNOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B51BD37A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 06:17:25 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id y14sf1009442oto.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Apr 2020 21:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:in-reply-to:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p1fR3cu3QLg6MGUgK1F7tn91BAoVrs/Ywn6VZ3GVaSs=;
        b=GyO25wGjeL6HZ2OoH9Gzo3Ci/8kJWsgPm4rtQi/Zn+2MJkNSSfSB1AZi2EiqqQkBBp
         8E7XR9PIYklm0SEMV9VdKH09eM4zlorC26Efy2On/qpM9J1E2Z176dQbdoni7zWP4Opj
         taSnNeSm1mzAfisg7Os38wz09i1IEIwUsTWyBYt4eArpc9N2oNpe9UvOX7vPhwk8eBTy
         fgEvWbQ89krABg9HtkI7S3tidUb/g4MZLS7VCU2yrcJqh1yOAD+iVwwzCgLacZg+lTfc
         i9MG8h8c2xILDZBkmSEui91kxpmcQfVHYV1sGVczgKjQeQ/FaBmkQVNVzjYUFNBsetme
         AScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:in-reply-to:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=p1fR3cu3QLg6MGUgK1F7tn91BAoVrs/Ywn6VZ3GVaSs=;
        b=JcvSCje2t2a7Msfi/P9/9HDfWMsJWLg0kyHJbb/MFg9b11j0UO3wDEUOVV1eXB6JbI
         IeGlrduKjoTEIi/NyTwgapnwcj87I/bz61IbiDv/E6rTk0kSse4aZ4mHwe9lgNKnjSfp
         YBEgfssFb0miEgQ7WQA774edyc0JIcN3ilh9JJfqxZoU0s0ZwICHcyjBX3qrD4mAdoIK
         PKZgZ6H0ryuRuwGbt3mpY/NmT7H+bHuQB3e9KPE7AyPjwkaocytvP4cHrRqYj0mH8ikx
         7v8Ko11AyeSMmd2BaJs+Dp412OxeWAZPiasiMd+pUgN2//pi6rB/zQZuKrlcwpntJ/Gm
         f+XQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZC8U56EgLMN2T1JE5YgP7yC79Sv6cERtuVUMzbpMc2LW5Oetls
	AjiHdiGAbpsOx/lzAKTrxqI=
X-Google-Smtp-Source: APiQypJVF6oIQjB4iRmssseUhwJ8lTDRgxpEuWRmMRmBNnVuXroC/2q35+JPG8oqYfKkpZvnYNnCuw==
X-Received: by 2002:a9d:730b:: with SMTP id e11mr26702614otk.9.1588133843103;
        Tue, 28 Apr 2020 21:17:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4418:: with SMTP id k24ls3834309oiw.3.gmail; Tue, 28 Apr
 2020 21:17:22 -0700 (PDT)
X-Received: by 2002:aca:ec51:: with SMTP id k78mr479518oih.114.1588133842348;
        Tue, 28 Apr 2020 21:17:22 -0700 (PDT)
Received: from m9a0013g.houston.softwaregrp.com (m9a0013g.houston.softwaregrp.com. [15.124.64.91])
        by gmr-mx.google.com with ESMTPS id h17si699856otk.1.2020.04.28.21.17.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2020 21:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of lyan@suse.com designates 15.124.64.91 as permitted sender) client-ip=15.124.64.91;
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY m9a0013g.houston.softwaregrp.com WITH ESMTP;
 Wed, 29 Apr 2020 04:16:35 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 29 Apr 2020 04:15:05 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 29 Apr 2020 04:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e39rLoP6bfVOywP319I6qDSwLoWOKnKD3qGnJ9GqdtfMpy0HQgR55ccDl8oK++hxp2RG6OVDLkFLj3bnLCqqdXOGSCHYhlqtJUUSNHkrzPw6VHbv+w4iuQFOmenMkzo+ciDQCgEaw4Ln9INP2zvAlvQmjbPCOlxP72HAmwDtSRIoBABrtNpshYeZ5Jl2verVUIcLr7jlcpICw/X+w+XJ1+q4JMQrf17zMoLmszja6SUzC08BQxbYqw0ri6bM6coygKwe9979bEVR9zOhMxeyN+fL1SkvlPNR7/VWvqzKMg5scRtpx/3Ugy3ph9MZeSn+yLRsLAzWxAzU9IAh5LOm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4jDUeRmR57Z9uP+5LH5Ii+/NenpmlpZ8r+y+zXcBdk=;
 b=davt6lA0+2cGdVbR17YqXg0sFeRwkayTIpjB3xL942jOejJ4O/Wqxu0eGUjaXmaneUfhRi3nmMudELL/JR4+o4c6tHzxy07ft4VvOYXc8r1zzkG4AtHjlPxMMCWt33P9rmsq8IPxx5A7I5O1467/IcuJp5wloBP+9A4yNMi4cB6Vqega2AWaRNTL/GSg9F1emwe1mfNUlB0xLtAC2TsYXoR2K7i2n87vNTTrmMDZkCRts2gMcB242nudNHTHnfO5Yj/kdcXedX9wkNWxoBjDmoTZ0J5cRzinMW3DAma4krHy25vQGxtQWdqS39Y/+iiqsXKTwZIW1+7O3B7Y4tSN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB3047.namprd18.prod.outlook.com (2603:10b6:a03:105::32)
 by BYAPR18MB2373.namprd18.prod.outlook.com (2603:10b6:a03:12e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 04:15:03 +0000
Received: from BYAPR18MB3047.namprd18.prod.outlook.com
 ([fe80::2d27:6a4b:3a2f:1ca1]) by BYAPR18MB3047.namprd18.prod.outlook.com
 ([fe80::2d27:6a4b:3a2f:1ca1%4]) with mapi id 15.20.2937.026; Wed, 29 Apr 2020
 04:15:03 +0000
Subject: Re: [RFC][PATCH v2 0/3] IVSHMEM version 2 device for QEMU
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Claudio Fontana
	<claudio.fontana@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
From: Liang Yan <lyan@suse.com>
Autocrypt: addr=lyan@suse.com; prefer-encrypt=mutual; keydata=
 mQINBFbyz+QBEADaR8Yu14AwXWT5R7fkkcVG7eLpgTeRD9+fh3UYhd8FSLF7WiDNIdi66f1i
 FsXUjrKKV+9PGEYMUFsk9w3ZTaRr392BxsucU/4LQSHRwOjGFW8+7a7Dd9NmqqKki3kyT3PF
 2qJUZovRLQ8sZ0YLQTvMkKwpJmDs2uGJdbbZBImDiJLRJ1AVQpFrDgnYZ/xElE9h7lCNQMD/
 JdJURupbzbDnTzmWxE4XCjtANk+smx3s7t6811IjUNWOzCYUYH+T9ne7Y+AWYy5xIfL6R5zu
 uITArsHulAgxAGQjpqyXoOJKdNTBlHl6za+H1Qj41YPolCGPd6uMqUkKAcdViWHKrPeR2HO0
 cvf/5hiecV1oRPa3k7Wxyd9dbc7EEBOdzWDiQdXQfWhmte0ADcMsXC2SjNHHHw7s6EcNbuDh
 oC9rlnDbaIvC577iiNxMnA5u2/lXWKj9FNPG3iz7IRYLyJi92HQBVWr9wd6F8iLdAcHFUV+2
 k+SnL91UKFtxkaIX+uN2HTWLdlLjO+00pZDoM22N2oDLr6rW6YVdcfAETxfqMugZhE7c3SKu
 eWG4PnjWcKOXuLUyIb9ExIfrYwIngoRnA6qOcGCw/lEP2c7SLwIFSbJa9Tcgbo3u2/biDU/h
 FnooQdUmfdVgB+HklsO/J67A2baAtKB81NWnYjX9jqMoZYYdkQARAQABtBlMaWFuZyBZYW4g
 PGx5YW5Ac3VzZS5jb20+iQJQBBMBAgA6AhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AW
 IQTzhoUnviFkRZgOdcyA9NwaGwJxswUCWLBQdQAKCRCA9NwaGwJxs3OEEACM+xXLNdGcK7gb
 Fiso9FhyAK3DaDpcoupzHgPoDyUI0s4824bTljAjWOyyUI82aGskThYv4bkXxcruj772yRtZ
 mt5GDfClakqM8YIgyS1s0N0kGD90HCKXIt3+r6QjV484sqfWpVobT+Ck4b8SeVY6X4o9klb3
 qIS7GiVA7iIDzBVyOETaNkdDybBDWB8P/lnRwzdqGt8Ym8b7lfrfQFpG2/FsKS+8OrJMVdgW
 XqfrEFBya0bylSlVecbD2LX503rICQAu3MdQfLlMlaC3nbNapQ3ltiqJKaNHPObvxq2JDd8+
 M2AtFRTz7RxOXdmLt6xfWrehi/valhnWiD96PTnlb4n/bs9J0qQWEBXKD43hkFcVFm2TRTQv
 m78UA4n/1bY1q86+ERoiPKkyPsGOuOHhffbD7fDbr+sgti6QYvK6VvVyK226ADhKeeWExtpr
 aLGEm+ybtiyOm7Orb/1Ge74XMkMZMIQB16CHprSH0+kPqyPNFsJ9nEG7W8nHa7G9aPCgZMVC
 4ZTBu4H8zk9yHM5rzCxmiMfz8OnQIFGeI2NnKGQCV9gqNizIESbwPZlDVHTcakwTSRgXt/mR
 TGJplrqBc1EJsYu2sNDDn+j802K0H9Mo2WsFmjfigKVEiMJp7jLHsSKA4MMtbbR2y9NSFjSu
 gdcCeqRSLGQsoDbUV0O6ZrkCDQRW8s/kARAA9Ej/HPD+YlSNpKOhkLEjMBaDMM0z/dcJ6Rdr
 BpQFoV6WFlT73vSLOro3dqU71PKu1q7QjDq3bvUhusouhycKfAoK/h+n5fjhbeWSILl/ysFY
 sQ/ixFMmUNZ63apfaZS1Q8XiUBldhL1Dm3FkIZkI09KfoWCLi+0rmfn+E1NoOkGly36i4abR
 vso/PZUzChkl6CxhXFHn0OP+u2cjh1TcQkhqblYy99Bf4w7vEYwnSeKe4Z7zUvNDNs7Px6D0
 GJ8yzBOAGpppF9bubZNtADJ9eJsqEF9ZFPGc6KsHtLowRWHcLeRtJuyfVZJNwUYqtaocKgI4
 9qjX46sD1VTZtEkMWw6oBUUNquRbF873bO6XeAuiKrc+3BBrMBCFXSK5hNVj5YxBo8PNNjta
 Sq8GK59OyUTrr9OCFN7e/j3HTKzCRLGFhj6Vm+OJ9Z00ar4Kqk7FMye4wO64N1wN4L9Uugrc
 GWoIfek+SGhG1E/W2u6K0QeymbnhdRPJ05D5SKHsqlk/A3W1EcTo6vl+fvZv3XaK+fQ7H8m6
 JdETY8dOmgB8AoMa54qRnGHX6oF11lUVQBPEe5gNZ1Z+J7BDa5NuGDcSPYgNcep+JcthY51W
 B9ISiXwIIDMjyEQltSaAkiV1vWAU9woEtq6No10vzGPoJMCb0OJgmG65TbtVAguqjMPK+VEA
 EQEAAYkCHwQYAQIACQUCVvLP5AIbDAAKCRCA9NwaGwJxs7LnEADHfpwnauyHmtO+Y762g+nf
 V1na4H8BqT+YbeiIaj+oFxUY3Mz3hy2rpkQ1DXHH/WSOdgR6VJu6q3gt4noq1lP+K1hxDcAW
 PzoAwoZtrqtAaqa2jdZzHWlpT8KRg8/vflUa84HIwbsNYnHBmtt5/U+Lp3HFuAcibduL5pQ3
 uNN0EOFcOpm9O0NTosAmeVQ76Z3be1MYvLbehMTT4D42ncrnze4PlGZ2UJAJ3C+3JxtJy2zs
 GtZF6fYq7Y4f/CfW4SbLK0TK3UqXF0W7jsgpp5cgnICpWhrHHDFLqlxqVeWgjPK+Fnz71Sv0
 0tW+csCEBzPTwc6okANHCYlELMRmKf5aZ2iFhyzuD8KChuJ4OEIRa/2dIla7Ziz62kSAYU5L
 YFhV/4VMU+4f66BrTqnUbLzy5MkFbVd61uh1CdkK6oaXL5YTTaGeoobzsM9SYbMkhDGUxmk0
 hYcpxIIKc0cHUxLrtDPXr4ZuB7sJRzYR1M0qFZBizgBTrOukADLK9uNd2aUqNWjUIMga+pbH
 Q1g0H65J10a4iuOR3RSn6vH6d8nPx2cXF3iILiotXAlnXRMiSUVCaj7fUiHbTzJoLrIZHgKS
 FxD1L5a88oh3+JG8u9BlJLwK54zcKQZxKEcFzhffXyZ+qMfVLaebg2+AZSJ6LF87yC3kXnGL
 yMQQ+LPXfanS4w==
Message-ID: <04fc6cb7-b02d-d8c1-1fdf-6b3c8c211284@suse.com>
Date: Wed, 29 Apr 2020 00:15:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <cover.1578407802.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-ClientProxiedBy: MN2PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:c0::40) To BYAPR18MB3047.namprd18.prod.outlook.com
 (2603:10b6:a03:105::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:a000:160e:228::ab4] (2605:a000:160e:228::ab4) by MN2PR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:c0::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.12 via Frontend Transport; Wed, 29 Apr 2020 04:15:02 +0000
X-Originating-IP: [2605:a000:160e:228::ab4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02335703-a2a4-4249-9385-08d7ebf3e438
X-MS-TrafficTypeDiagnostic: BYAPR18MB2373:
X-Microsoft-Antispam-PRVS: <BYAPR18MB2373BBA79E8D27B677200698BFAD0@BYAPR18MB2373.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB3047.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(53546011)(5660300002)(4326008)(186003)(2616005)(31686004)(6486002)(52116002)(16526019)(54906003)(110136005)(2906002)(8936002)(66946007)(66476007)(36756003)(316002)(966005)(66556008)(86362001)(478600001)(8676002)(31696002);DIR:OUT;SFP:1102;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNEJ2hBtj0cRrHLIPQaeWSEXlus5QKgPfvFcQyKfULaPxt1RZE+ixxjdfK86YYdR8P11uB42oxy3npmo38C2WJ0xGcTbGByW+McgvZnw/pe8EQNcrWsZj4Q690SEW3BPVCrweSgmFkitudbobXGFdPQDAz/Fn8KC8J0L/PP6RPCNhXQfwCS/+mpj+3ocPbG8DS2rwuibrp7ij5kybn1jiQthofYmWC1vuSQCrCVG0OXtaJ5r5egAgswAYrXyJER1bikJdGn+x+K1kTfp8mlSWKPCh+kwTncaP5+Vus+S23k+WONfOtzKnsQNq0GSafMW/dCqsOMsNe37kU6zMtFrK7PpQv48R43QHQsW9FJaEcJ/ko+K57dbqmqhFXfj/MKgTuIfxX8yU7hE2Pnxffoj2E68bn6pNEcVPH0Hi7FRQaNzKIRNd4IEwW7Nsx56c7mNUHE9iLDwFQCVsJ5nKItCV7qY3lnKaMd9OI2LFc9TZMH94Z4qjbA+Yz8+U+O+Kl/ksao7E31v835CaB4J4OMknA==
X-MS-Exchange-AntiSpam-MessageData: mnjmy5i4+FFPyciBrJGFMZY8+wwXL4QF1Jv91tmypoVw8PXnGYpYzv65SHhE4IoNaOtg5UyUGGfOeyJt8t1gKjWxXeMC3Z5LRRXjicHYcwzxsIyw/th1p/Sw4eyQ7Zd6AdMMPrU5rfEhjKETALaEzsCMFj51O+e5CPTqGu9+RB3u5bQfx5Ak896tm3GrfsTDrwXadde5rdW4a3iyz75U7QtgbYL4KbL45uW8irWSSYvc+Ebj4oWZHERaXOtwOrfaapPvJ23hnB7V/TeTDM+u27tGSQapeY+IyrnewJovpMLFSR1Uihywdw8hhntc4pLEvjaKcP5KVAlDu3DD6LxKDA/Quo7GnUjPIXricm0ATtHpx/sDM/Q4rCWZJK7vLy+fMOpo/beP1xnMGGm2blSyohss7jHWG246B9cs6WNsD5gT+X+3KGxgiMDeuFrsz8qeUeqogaxc+01+yHitl/rmCND7MvvS5LECD3M6vMiVrfDmOi4z/EwWhad5DJz2NECP1/dNmxiqTnLA+7EbJCm6be+AJJPCZ8873W+SNP5lgSdez9t61o+UiaFDSAg3hx0XMMJ/pedHcnvGi6zK7QrTfwyMRazSkdXThYQLpwG80+0pE6Pt4HxNlt5JtzKWGFwHLm9eanwUkXtJ7yP7n22tlIdeP3MGBxFv1O7KNe3h2d1VU/5yk4dY/5+0ag7bFaXJXeJ77nIgaOjefd9AhJvDl4M2JyAYd+x63Em7T/KMwUEWeb1TpxFCNfpWbXU6be7qnF4FWG8B7ir0+RTxdvOF10mcLTBFebpdBpuLQxbzGZoWct1NaQ5rOpUWsKn9njBRW+e4pJLPUITmJGtqK76Abg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02335703-a2a4-4249-9385-08d7ebf3e438
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 04:15:03.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kP2h7HBV6lrbkVh8n29KVq7arvnWuBDNY1tJ+cCIuPyjD0TA54LzxSejVTw+m6xt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2373
X-OriginatorOrg: suse.com
X-Original-Sender: lyan@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       arc=fail (body
 hash mismatch);       spf=pass (google.com: domain of lyan@suse.com
 designates 15.124.64.91 as permitted sender) smtp.mailfrom=LYan@suse.com
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

Hi, All,

Did a test for these patches, all looked fine.

Test environment:
Host: opensuse tumbleweed + latest upstream qemu  + these three patches
Guest: opensuse tumbleweed root fs + custom kernel(5.5) + related
uio-ivshmem driver + ivshmem-console/ivshmem-block tools


1. lspci show

00:04.0 Unassigned class [ff80]: Siemens AG Device 4106 (prog-if 02)
Subsystem: Red Hat, Inc. Device 1100
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
Latency: 0
Region 0: Memory at fea56000 (32-bit, non-prefetchable) [size=4K]
Region 1: Memory at fea57000 (32-bit, non-prefetchable) [size=4K]
Region 2: Memory at fd800000 (64-bit, prefetchable) [size=1M]
Capabilities: [4c] Vendor Specific Information: Len=18 <?>
Capabilities: [40] MSI-X: Enable+ Count=2 Masked-
Vector table: BAR=1 offset=00000000
PBA: BAR=1 offset=00000800
Kernel driver in use: virtio-ivshmem


2. virtio-ivshmem-console test
2.1 ivshmem2-server(host)

airey:~/ivshmem/qemu/:[0]# ./ivshmem2-server -F -l 64K -n 2 -V 3 -P 0x8003
*** Example code, do not use in production ***

2.2 guest vm backend(test-01)
localhost:~ # echo "110a 4106 1af4 1100 ffc003 ffffff" >
/sys/bus/pci/drivers/uio_ivshmem/new_id
[  185.831277] uio_ivshmem 0000:00:04.0: state_table at
0x00000000fd800000, size 0x0000000000001000
[  185.835129] uio_ivshmem 0000:00:04.0: rw_section at
0x00000000fd801000, size 0x0000000000007000

localhost:~ # virtio/virtio-ivshmem-console /dev/uio0
Waiting for peer to be ready...

2.3 guest vm frontend(test-02)
need to boot or reboot after backend is done

2.4 backend will serial output of frontend

localhost:~ # virtio/virtio-ivshmem-console /dev/uio0
Waiting for peer to be ready...

localhost:~/virtio # ./virtio-ivshmem-console /dev/uio0
Waiting for peer to be ready...
Starting virtio device
device_status: 0x0
device_status: 0x1
device_status: 0x3
device_features_sel: 1
device_features_sel: 0
driver_features_sel: 1
driver_features[1]: 0x13
driver_features_sel: 0
driver_features[0]: 0x1
device_status: 0xb
queue_sel: 0
queue size: 8
queue driver vector: 1
queue desc: 0x200
queue driver: 0x280
queue device: 0x2c0
queue enable: 1
queue_sel: 1
queue size: 8
queue driver vector: 2
queue desc: 0x400
queue driver: 0x480
queue device: 0x4c0
queue enable: 1
device_status: 0xf

Welcome to openSUSE Tumbleweed 20200326 - Kernel 5.5.0-rc5-1-default+
(hvc0).

enp0s3:


localhost login:

2.5 close backend and frontend will show
localhost:~ # [  185.685041] virtio-ivshmem 0000:00:04.0: backend failed!

3. virtio-ivshmem-block test

3.1 ivshmem2-server(host)
airey:~/ivshmem/qemu/:[0]# ./ivshmem2-server -F -l 1M -n 2 -V 2 -P 0x8002
*** Example code, do not use in production ***

3.2 guest vm backend(test-01)

localhost:~ # echo "110a 4106 1af4 1100 ffc002 ffffff" >
/sys/bus/pci/drivers/uio_ivshmem/new_id
[   77.701462] uio_ivshmem 0000:00:04.0: state_table at
0x00000000fd800000, size 0x0000000000001000
[   77.705231] uio_ivshmem 0000:00:04.0: rw_section at
0x00000000fd801000, size 0x00000000000ff000

localhost:~ # virtio/virtio-ivshmem-block /dev/uio0 /root/disk.img
Waiting for peer to be ready...

3.3 guest vm frontend(test-02)
need to boot or reboot after backend is done

3.4 guest vm backend(test-01)
localhost:~ # virtio/virtio-ivshmem-block /dev/uio0 /root/disk.img
Waiting for peer to be ready...
Starting virtio device
device_status: 0x0
device_status: 0x1
device_status: 0x3
device_features_sel: 1
device_features_sel: 0
driver_features_sel: 1
driver_features[1]: 0x13
driver_features_sel: 0
driver_features[0]: 0x206
device_status: 0xb
queue_sel: 0
queue size: 8
queue driver vector: 1
queue desc: 0x200
queue driver: 0x280
queue device: 0x2c0
queue enable: 1
device_status: 0xf

3.5 guest vm frontend(test-02), a new disk is attached:

fdisk /dev/vdb

Disk /dev/vdb: 192 KiB, 196608 bytes, 384 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

3.6 close backend and frontend will show
localhost:~ # [ 1312.284301] virtio-ivshmem 0000:00:04.0: backend failed!



Tested-by: Liang Yan <lyan@suse.com>

On 1/7/20 9:36 AM, Jan Kiszka wrote:
> Overdue update of the ivshmem 2.0 device model as presented at [1].
> 
> Changes in v2:
>  - changed PCI device ID to Siemens-granted one,
>    adjusted PCI device revision to 0
>  - removed unused feature register from device
>  - addressed feedback on specification document
>  - rebased over master
> 
> This version is now fully in sync with the implementation for Jailhouse
> that is currently under review [2][3], UIO and virtio-ivshmem drivers
> are shared. Jailhouse will very likely pick up this revision of the
> device in order to move forward with stressing it.
> 
> More details on the usage with QEMU were in the original cover letter
> (with adjustements to the new device ID):
> 
> If you want to play with this, the basic setup of the shared memory
> device is described in patch 1 and 3. UIO driver and also the
> virtio-ivshmem prototype can be found at
> 
>     http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2
> 
> Accessing the device via UIO is trivial enough. If you want to use it
> for virtio, this is additionally to the description in patch 3 needed on
> the virtio console backend side:
> 
>     modprobe uio_ivshmem
>     echo "110a 4106 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>     linux/tools/virtio/virtio-ivshmem-console /dev/uio0
> 
> And for virtio block:
> 
>     echo "110a 4106 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>     linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img
> 
> After that, you can start the QEMU frontend instance with the
> virtio-ivshmem driver installed which can use the new /dev/hvc* or
> /dev/vda* as usual.
> 
> Any feedback welcome!
> 
> Jan
> 
> PS: Let me know if I missed someone potentially interested in this topic
> on CC - or if you would like to be dropped from the list.
> 
> [1] https://kvmforum2019.sched.com/event/TmxI
> [2] https://groups.google.com/forum/#!topic/jailhouse-dev/ffnCcRh8LOs
> [3] https://groups.google.com/forum/#!topic/jailhouse-dev/HX-0AGF1cjg
> 
> Jan Kiszka (3):
>   hw/misc: Add implementation of ivshmem revision 2 device
>   docs/specs: Add specification of ivshmem device revision 2
>   contrib: Add server for ivshmem revision 2
> 
>  Makefile                                  |    3 +
>  Makefile.objs                             |    1 +
>  configure                                 |    1 +
>  contrib/ivshmem2-server/Makefile.objs     |    1 +
>  contrib/ivshmem2-server/ivshmem2-server.c |  462 ++++++++++++
>  contrib/ivshmem2-server/ivshmem2-server.h |  158 +++++
>  contrib/ivshmem2-server/main.c            |  313 +++++++++
>  docs/specs/ivshmem-2-device-spec.md       |  376 ++++++++++
>  hw/misc/Makefile.objs                     |    2 +-
>  hw/misc/ivshmem2.c                        | 1085 +++++++++++++++++++++++++++++
>  include/hw/misc/ivshmem2.h                |   48 ++
>  include/hw/pci/pci_ids.h                  |    2 +
>  12 files changed, 2451 insertions(+), 1 deletion(-)
>  create mode 100644 contrib/ivshmem2-server/Makefile.objs
>  create mode 100644 contrib/ivshmem2-server/ivshmem2-server.c
>  create mode 100644 contrib/ivshmem2-server/ivshmem2-server.h
>  create mode 100644 contrib/ivshmem2-server/main.c
>  create mode 100644 docs/specs/ivshmem-2-device-spec.md
>  create mode 100644 hw/misc/ivshmem2.c
>  create mode 100644 include/hw/misc/ivshmem2.h
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04fc6cb7-b02d-d8c1-1fdf-6b3c8c211284%40suse.com.
