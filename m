Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIEUZKOQMGQEJBJEPXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71565ADBC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:39:13 +0100 (CET)
Received: by mail-ej1-x63b.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fsf17065766ejb.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:39:13 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672645153; cv=pass;
        d=google.com; s=arc-20160816;
        b=LFzyDo9SnQolbhlh5vLERyJ5+7AW9lu+4S2lF0F2yG2zTzVMjqYT4gxl7agtCiF7Vu
         s1tNWf+X1S3yambavC0JGFUGJUfEChcnz7Xvwq0YScYAF5v0nzavjLR44jvqwXPtxZ4m
         qdMHFJW+g12wwZWIKiTXvB4UMzr/qsuwE6dvCF5/7iog+RMVtAa5Cf7gXWcMQJce8rBo
         c6D1NzIsIPBsYpE0NhjAL+pHpQopg7ieIAjvdbiXicnHUw1fB95iAqn6gvBC3D1r7Gr+
         xCFJ3YOawipZr+VJSTlA2yL0IVW05xXiDnihQk2SaqCwguHmUk249PzuensriGJcX3ix
         RgUQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=IVwGX+8wvVM9/h2PrmHoTsfh+YbhvNCXiVk0GPXBoWY=;
        b=ZxEhhlbwI2oXgaJk7ZVG5AtRlgxBIjoBYLNXUqAld2dd5oYqerMk3Ul5amcxINaTdk
         jtnnpqvHN/dOUYjo6pT33zrX6sARY/7P0Wp5/IXhHJmjIyO/Qima2d3ibSMJiC/EXjlN
         ore54w+67RezYLAXK8Hm7edWVDThc2M1MWgt8aHL788TqJOFPqH0jf2YLwOy3akOeKnj
         tt8WMu2S+ce6QdA31aSoIytxOcnU05FvhXY2L7XNW1kK0qBq40FiRrQP5fnXeQol5DFO
         oqbj4UJsTh0eZ1BYd8DJMxcyNewhOBqj40FMsC0aktipVNd0QzvMu6qpHYt2vTOS/EEJ
         Hljw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hRG5nZ71;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.22.49 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IVwGX+8wvVM9/h2PrmHoTsfh+YbhvNCXiVk0GPXBoWY=;
        b=m74NuLGoJYmot7DKpMITtH2utBO5aEtzWfkJnxI3izHz/Qirtar3O5nq5SOrPKeJwg
         ufH6WbMDY1HstFdA5skSenoML8ZxKFS9QMPmQDF6FS1PbFatADqd9CGnbnu0e/FFHMAQ
         3iSN/y8JrlzbCJcGIHkkufH7eA4KgE80L2OZFwClVV97a2JNv8zZPNU2BnVIRhMyGHGr
         +aslU8RFQ01QHF/NAo/wPFIkoOdCxvxUKFbEAUBn1FpjsqRZhmvP6Z0ZPYSZvaKjya7J
         20dCYmKtjWYfPR09O7utqeA0ckWjLFBLNeOKfYgOuvoiP9JUqL2BDCFMTj4Ngi7861TG
         K4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVwGX+8wvVM9/h2PrmHoTsfh+YbhvNCXiVk0GPXBoWY=;
        b=GO2joW29mbmkFPYYq1sNYKN0dUqS4VqoGAClI+hxMPuDPxlpaikx853GCK50inWTrd
         25ej4E0RJh+h624ZwXrKCX1AGK0KATF/LZlKjNNImykbDtPkNjxsMdDGyrjWmSafG6ie
         2rdRBZP1p9EeNvAcosMrWbtsrT7omfCiqChDnWyEZEpLWOxg/Wflewfzsji3fJ+Tb00z
         nCTRoS8MZmt2qmbVSs7RPMO7xrX1jC2a2iUrKVHhk4jxRuE3FHGLaU6aeWYn84Sq3CiJ
         f7WSd44AeQcJEswmYxpRCJkAgwdSXe/5p07jdBhPl+KcS1x8RtO5v7crYlA/imAauZ7Y
         o0+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqBMn7e59ShM3TF9xjGCNSMdv9HZBJgUQn6+Yg1TgUvHtkyG6WX
	8ArUGnfrbRY9PtAMUMHD/lA=
X-Google-Smtp-Source: AMrXdXvQqWltQVQ0oaH2lFrilQoq8DHX0OG8jMh2Yi4khMZARckL5RbtlqLOirS++ru/5+5D5Xw0Zg==
X-Received: by 2002:a05:6402:e94:b0:47c:30aa:a7c0 with SMTP id h20-20020a0564020e9400b0047c30aaa7c0mr4184584eda.11.1672645153179;
        Sun, 01 Jan 2023 23:39:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40d5:b0:479:6c1:ef04 with SMTP id
 z21-20020a05640240d500b0047906c1ef04ls3829874edb.0.-pod-prod-gmail; Sun, 01
 Jan 2023 23:39:11 -0800 (PST)
X-Received: by 2002:aa7:d40b:0:b0:48d:778:e6d6 with SMTP id z11-20020aa7d40b000000b0048d0778e6d6mr4707210edq.19.1672645151679;
        Sun, 01 Jan 2023 23:39:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672645151; cv=pass;
        d=google.com; s=arc-20160816;
        b=j+90f4QThm+tIT3zc49XDz7QcrsIhqLX9uOhXhw+wUq4Eq9qr8HgBm5pyykDDi/dAs
         p0jdi8igUXFcu5Y8N33MwCPxk2IlSm3otXWKnA4zt9Qoza0D35FVDP0G9MUFIT+rPNda
         T7A7cFSMbEiQghk/n3nzNLF0lAFc8kKcPspLSRbzrrFUrO2Grq8q9TDvBmCs9p3RMRGa
         SiYuCORKQ/7veGunc1EQyABgJzYMXvYLjXbnXc0EAfqQBmVLFDvOdcerEl5kk3015JdX
         NKWBuCPB1Lqjc2GBADcVsS7n4x3uEbyY0uoU0N7sEgx2cgx8JoJs3XTHDu2TWgpwwS+5
         0dLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=hjlXb+fIiTCRLrgnxNMG9NYqAaYtv094mx9Ei/w6pe4=;
        b=QLW5BQ3gOnWHf/N8KGU2lJJ/5iQKbl9eehBSR78Qm7GDgnIKfZ4iWyhRGGpDcQmBXv
         p7z8/A4Az4S7y6GI62vQGEQHJ2/OTyQSQnm1fJJdB5L7ev4TFIUzSItNtMF86xKra7l6
         UVwrs57zMqsXUDcg/6xLueDDYmImKOFlows/OZTtus34Ez1Q93lzOFXk5jISe5WTzHVE
         jKgr2qNVJgexRstv0sE8UXpXSMYF4hY97nsNpsqfMGB8TcQswu8BNjvqR8to9UPAb2g6
         zwDZRp/d5PBm8IxpbCpZYiQvieR/PUSY0laEprRik7ozp32w1Bv0qvEeT/9pUYNiHBxO
         tniQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hRG5nZ71;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.22.49 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com. [40.107.22.49])
        by gmr-mx.google.com with ESMTPS id x15-20020aa7dacf000000b0046920d68fe2si997422eds.4.2023.01.01.23.39.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:39:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.22.49 as permitted sender) client-ip=40.107.22.49;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMiuMCQywH9xOFSpFfpJkCJ6eZtb3Mb0Lki4hm52L+SKIrtXlv6JEvUemk/Xc7ZbTo6gIoUjbemVc1/E1+hJp7Qy+Z/gWgekyqPy+XZCgDEm4+Lu8YiuCJvK+FIGmuV65nIB5FrICKcCUfY/UvDewauHqm88GqUeQrHiCRfW3QQCM6krs753rmWS2fqyrqMA/zwzmJOVzhrags/oYSZE5XsVVNeS6JJQnI9Z5gnK/PIvBnwji3rJfTVHvg6W0dWJJ1VIeA0v3o2MaC8Cub6GmIfRXcpG1/+06HafDUOAmKTgg6uR/yYAWMwHDLQ1H8obEvkaIZ9X3MMyX6JYKlLBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjlXb+fIiTCRLrgnxNMG9NYqAaYtv094mx9Ei/w6pe4=;
 b=c3oaZAWNng3vhEJqZbZS34yyslc2gy0r9UGAjfWLZdZ/hxHr2TirqgCUF7//HyJAPpUdXoDOfwWB9Jy3uMk90QCATrXfaZ3NgVZg/doxPG5L1H8tWTMRNpMmWirkouGC5Nyye7t4JO+rnc4RHWICjFHM+Nv9B8dV90bKC0rmWXvP4mOXhk7EnwaWmLNm4xf9W3nasu8HbrLYo9RT4PNHmcLp9ljm8TRS9hrAVFQc6XVuVygPAXXGIFEkPfiDwIvphByvQBLkA4CZDLQzabbHH0jNd6g3esJUuM7vBNXOMLUzt5JwjTKy4T3t1wcLX2/CQu8lxUBTzrrFpI45RqGepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PR3PR10MB3771.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:47::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:39:10 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:39:10 +0000
Message-ID: <6bd62bc6-479f-314b-9cdc-d85bfd80a2ba@siemens.com>
Date: Mon, 2 Jan 2023 08:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Request to Fix JH images for QEMU
Content-Language: en-US
To: Marco Barletta <marco.barletta@unina.it>, jailhouse-dev@googlegroups.com
References: <48fefc80-2ba7-a1b0-e4ff-2d3d5113db80@unina.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <48fefc80-2ba7-a1b0-e4ff-2d3d5113db80@unina.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PR3PR10MB3771:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d725e6f-6831-407a-eea8-08daec946fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IASn5mXkc6LeUbl1zXQ0TohBLQtp/eoGW6vPn4+fMKi5THjVjFrJmn7ssTrSuuxNwC28rWLmyFLsAQQiwS2O2GfW91HnGSrJ81Z4Hj6fb0dgo+S7XYHo2oObmb/lEMInsnQcAU3ORr1KtQM9TGS/2+ma7Jv5T6BSONsO9NcyGVv384BhwtWyv7GzMWIwvsc2OZqh3bGDXTg0z+ncRj9+aBea/hLoIgJNXGtKi4EA1SJGFe8pfo3eW4KeVZ12bfcwMKBM+ipo5H31nWBThFE4XYnrf+b4KFNidDIdPaOIv7zsBovYcVUkUiNRavF+MSDEM395dCuwce4rDtfMJe8Bu+C5g3YBQzyxlAyCaa6gKM0IRk2ZtSpEykHuOJOWQk12SXjhg0pZdLgbFK4sRVmudHpVaOBjOsL5mN5stgbdufxuaY3QQ9lXSOQZBGnB0v91mBUL+UXZnCmQQ/55XmtQb3R8sh6aZ52Ibqcm+4Idb5WWnBUNzLWtfIEgKGraK20oJW/eWDM0+/2Noon05amlFGFlqUxx4XCz2tPbhEbjHCIPbY6PiNaRGXevyFwq/5EiBnAzv073H22vxwUKMrtPLhS1rkYy3mX+b0WAPx8qsYuwRhUZI5mklWfMgSE5i2zA7TD8K3rlu3yPralQTyk4kmGEFj59ZVyv1SDmvznj0IJgeNjABTGlqovByaqNDM4nCw/82Chhe/2OpZgUVfSQJA453YflrmaDUYA6nlZBr7EDyhP4KEyeK8Fp8yJz17eWuaziNZdejCEi92gArmXDStbtcqtldO+30at4VdX1Fsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199015)(36756003)(82960400001)(2906002)(38100700002)(5660300002)(8936002)(41300700001)(44832011)(31696002)(86362001)(83380400001)(6486002)(966005)(66946007)(66556008)(31686004)(6506007)(6666004)(478600001)(6512007)(316002)(8676002)(66476007)(53546011)(26005)(186003)(2616005)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnIrRUJGTjBhbk5ibmliSGJXaEdaRGczR3o2SlZZR0VXa3RrTTBKdWxyNUZI?=
 =?utf-8?B?bWJCNmw2aEdQQXZ6R2U4UmN3dSs1RnZqcmN5RUMvWXpXRWRmZktPOUJnQ0pl?=
 =?utf-8?B?aGhzQkM4a0k5dTAwK3pVTlZwTXk1NjNGVk5rWkFEbUNCZFR2TVljVS9PaWtm?=
 =?utf-8?B?aURFRG1ZL0ZQcCtqdHdmdFArUE16K1RScUpMQStYbmVhOWJSZ0k2akJuNEN5?=
 =?utf-8?B?WUVzcktFTmRGY3NQdVBKdndTazYxdFpnbkNRZGNhWWtVTktSbWFnL2lUd281?=
 =?utf-8?B?ZFgrbUxlL215YVpCeFRTVlhzRnYzV2dUdWRDMlg1YUJnMEtKQ2tMY2JMdk5i?=
 =?utf-8?B?TEZYUldwVU84dUs2S1plZXZ4RDVuZlJVcmVRR3pIUVlnUkNmV20vNEtlbUtG?=
 =?utf-8?B?VktGMzhJMzlLVE1xSGpLbzIrdU50UElkUVAwUHpIbVkvNmdTMXpmKy9UWXZp?=
 =?utf-8?B?N2xlS2Z0MmkrRnhwVFpmSElXdU44N1RkbGhFZXVuQ0hMQ2VBZnYyc0wyaEdj?=
 =?utf-8?B?bGZQckFlekxGRHNqY1g1eTJ0Z3JzdUVzbENRKzZsNzNFNTFBWjF5NUFtMTFZ?=
 =?utf-8?B?VEZrZ0NNTFJvdHhOQWNKaUptbFFFU0VIY2RBRlkyK0NUOWhMWk0vWGZMeUtB?=
 =?utf-8?B?SVdDeTNVY0NnNTFuMVU5VmhkZFZPRGxER0JrZmZlU3VtbkRXUFNrUC9TOTlr?=
 =?utf-8?B?dnJEYUIwcHR4dHNNS0lycnNRRFJhb05WR213SWdXWFhkL3VJdlI4RjhjUlY0?=
 =?utf-8?B?QmtUMnE2OCt1dGtnbDhWNmlEcnRiSmN2K290UEdyTTlDazhWY0lUbG4vKzRH?=
 =?utf-8?B?SExYek5neUt1eGEwZk9NMTd5Zkpsd3A2VmRxcUdCNEgzTUNWUjBQTW5DQnVM?=
 =?utf-8?B?d3AyVGtTd1BUVzdhZmljUDcvSWE1Y2Ixa2NPZ0MxTzhTMkh1RkJiS3JocTlv?=
 =?utf-8?B?dWtWSTlySCsxMy9NZUZxSVFPMVF6RDlIaGNGUitPSzJrcVJPcHJkWDA0S2l1?=
 =?utf-8?B?cEt5Q2VLcDgwTHVDNGRKek00a20zMkZ2Zm5RUnpKMGxKd1RuT3FNelJKZjhW?=
 =?utf-8?B?QzBHSEVqa2wySXFkU21HZkNOWDhuUXhyei9RWUZRV3dZRWthQ2xOK2pKbEpp?=
 =?utf-8?B?aVVMNFVBWmJTZ2N0bUhRcnRqbXhpY2VyYjB3K3poQ1RjR2pBU3kweDZXWFZt?=
 =?utf-8?B?aWFCRkZVdVBJbDZMRmh6SXQ0OTNmQzJ3Mi9OZXJ1QURFSVlRRUkrTFJyN3lz?=
 =?utf-8?B?UFZkRzk4SXVkZWs3YTRaSTFuT1VsS245WUs3YWZyRm5TTFVhZGdKTkRlUDQx?=
 =?utf-8?B?TzVBQVBIci9DVm5rSXZMZVhXNkpxUFd4VkE4bGllOC9pNmJsb2c4c0pqUGNH?=
 =?utf-8?B?WHEycXRpNjN2R2dUYUtOVUJ0Q3Rsc1UvL1VLYlRlQU1rUU9MeE93SXBBakdN?=
 =?utf-8?B?cTVMeUd4OFAzM0xUWFMySW1EZ0tsRDl2K2RjdC8zeGo3Znh5RTd0dFp6eG1n?=
 =?utf-8?B?VjBvRkZhT1o2MlJzcEl5cWJCUjMrUE5NRkgzRlVYc1UxYnJuMUFQV2VyV2dC?=
 =?utf-8?B?R1lUOFYvWG1NT1c3enNMNnRuZ0xJU3pqczJBeTQ1V21jQjRGTmtwSkt4RnpM?=
 =?utf-8?B?NnFISDZ5cUhHSXgwYno3cVVMRWlVUDhmdDFuYlYzaFd1emJaNTFoWXB6TVNs?=
 =?utf-8?B?OEs4cm9WL2Rvd01OanMrdGdCVFN4UENSQkVBK3kvaEVpRXNGZkVDSk1FNTBs?=
 =?utf-8?B?Q2c3a3dQMjNnRng3UWg1OUszYm5XWjdMMnBDMFYrK1VMUHFPTGFucVlJandM?=
 =?utf-8?B?OUhoZWpOQnVjYi8ybThQaFZ3d1NrdTlCVEg4dkxSckNET1lOL2dudmhXMGVo?=
 =?utf-8?B?c29ZbzBlWjU2UXc0YlE0ZkxXeGcyalFiM2V4a2R6ZVFRMmR0ZEdqaXZqUWJK?=
 =?utf-8?B?TjM5a1oxVThlU1FvL2FKWlA1Z2FsSEptSHBkNmJZYU1wWjBTR0ZOMTh1Y0Fa?=
 =?utf-8?B?RGNOZGd4bi9MR3I1N3pPUlRTS0xtakJ6UDNuendVbWNBT1NvcnAvWEdSQ2FH?=
 =?utf-8?B?RFJXZzJQeHJSQWN0WnlkMmExby9YS0NOQUNxWmFFWmVBemREMWNjUFVNeStB?=
 =?utf-8?B?RVF2NUM2OTNnTklzNmFRemJTMUF2d2tCYnNSYytUU0d4MjB3SU9TdG1vK2dL?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d725e6f-6831-407a-eea8-08daec946fd9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:39:10.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDlwLCbQzsFvn4fFvZAD0ZWxHIS3XdHmZIqFmqLevUEi6X9SUwIwiB3bMaTtAGfdJvky5HDO4zh2VLiW3mDHPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3771
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hRG5nZ71;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.22.49 as permitted sender)
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

On 21.11.22 23:35, Marco Barletta wrote:
> Dear all;
> I tried to use the repo Jailhouse of demo images for building a QEMU
> target (x86), as I did a few months ago. But something has broken. First
> of all the SRC_URI in jailhouse.inc is a git:// URI, deprecated by
> github (afaik). I replaced the URI with https and fixed it.
> However the build fails with the following log erorr (with the flag last
> version of jailhouse either enabled or not):
>=20
> ERROR: mc:qemu-amd64-jailhouse-demo:jailhouse-jailhouse-0.9999-next-r0
> do_prepare_build: Execution of
> '/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/=
temp/run.do_prepare_build.72' failed with exit code 1:
> cp: cannot create regular file
> '/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/=
git/configs/x86/': No such file or directory
> WARNING: exit code 1 from a shell command.
>=20
> ERROR: Logfile of failure stored in:
> /build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/t=
emp/log.do_prepare_build.72
> Log data follows:
> | DEBUG: Executing shell function do_prepare_build
> | cp: cannot create regular file
> '/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/=
git/configs/x86/': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of
> '/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/=
temp/run.do_prepare_build.72' failed with exit code 1:
> | cp: cannot create regular file
> '/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.9999-next-r0/=
git/configs/x86/': No such file or directory
> | WARNING: exit code 1 from a shell command.
> |
> ERROR: Task
> (mc:qemu-amd64-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse=
_latest.bb:do_prepare_build) failed with exit code '1'
>=20
> I am running kas-container on a manjaro system,=C2=A0 kernel v5.10.151,
> x86-64 arch. The ARM64 image is broken as well.
>=20
> Do you have any clue on how to fix this? We have plenty of students
> relying on the repo for projects at our course, it would be great having
> a quickstart for JH.
>=20

I'm on it. Part of the solution (not for build errors, though) are the
Jailhouse patches [1] I just sent.

Jan

[1] https://groups.google.com/g/jailhouse-dev/c/aKT7L2Hs6Ow/m/d8BzplwsCAAJ

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6bd62bc6-479f-314b-9cdc-d85bfd80a2ba%40siemens.com.
