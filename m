Return-Path: <jailhouse-dev+bncBC44VTVY2UERBEGSTWCQMGQES6DNMEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD4838C133
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:02:25 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id z14-20020a2e964e0000b02900e9ad576f5asf8473139ljh.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:02:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584145; cv=pass;
        d=google.com; s=arc-20160816;
        b=xuhXM4YbJLDv2yslRA+aJQYmVDSL+rE50+sSfmUvgbKWExbt0/fzPEzbccc0i82hOO
         SkI2ylE6Xq9a+nNlcbpXw815cCjLtojPPMxbnxBmBwiuCtr6YOGArJmC6Koljhny2T12
         uesgSrbTPQkTD6h89MdeZENeMG88Y5r4duNG76P3FT4lMT5maTbgoB6gn/iItr1GgwBG
         Ykw94BjDVrLxeQH4mJVcUBrkXwvEAJEOC5EdLJHmyTbewVEMXXjnRaVAXrvNme+MPSrH
         Pgc1IBUwspv8b6zMydMy4hYMVcr86q87ZrSl8ICHBU5FWa9WvLnJAhPlgE9rYtOvtuxK
         BH4A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9l26uJxvAfbky3H+DyAxFrPo9R8JRyr/av8djTiNoKc=;
        b=LhFSHk9OZpX3WScVWLZ1Nc22LI2JjyLnWtKiCsMoD3z8NzfwBaeyRYOomgWAKm3UIb
         uHWqRpgdJn5BBmEqBcPc8P3tS0nApW8kEqyjmqr/mvdSB48133NIw6LdqLFEO+KPJWb9
         o5NIOnOepPb6Wzg/qCGnFMOJWw48qTG4pmwmea0bpf8fqTPeyhoIu6F+fVf7rG9oqKg2
         D97TBqdoqvhxmFCxEKNA3thLJt1IlK0rHpM2xWQCLUFsFxiOHT4Qup+OIXQH6q+KfCdS
         fl9Pd2hr+o3fsPdlhtdAG6tJTu+se8Ae/5jJIfe9qgiP0J7an3Ky/9xV/yGyD00eKH8g
         n44Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=NuJM92cU;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.77 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9l26uJxvAfbky3H+DyAxFrPo9R8JRyr/av8djTiNoKc=;
        b=nffntZDpfBCc+AuHNOHCq0DUDUg0cPPKi55vAAhoB+UfSy9Hi9+weE0X28a8dsvczt
         fjrlRCKflXHD7NpPIRhkBDJ7Fnbtc7Ofxt3F8m8I1+CA5f+IdpJUDtodX69o6Bhmlfwu
         qMJA5mkxjz/EIB9ztg1FR95DqEexGCGPINLiXxXRqNet/aeQefomzRDD4tdeFsFe9KQc
         N9KAbX1XNUQPfceFMI2IX57WkNqZ5MywWZbqh+VlwRbX00VCelWz8YwoaGcYhEHXHaXX
         O01mCsQ8M8bmerIbTpYKDXeW2vqHSeknj7tPoLP2LTYhK+df/XE08rj4iMCP8A+k704L
         H1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9l26uJxvAfbky3H+DyAxFrPo9R8JRyr/av8djTiNoKc=;
        b=fA/9NoiAl68EYQAQKxu6EO8izp9yY7Ddn6/dGE6RLvMsoBGBvmESX6ygwF6nRLBhXJ
         q4AI1ure5JqMXT4z5Nn+B3WR21nwzfJweJE0yoE4L17sO6cChyqWEtBElH8HT/a7+5+4
         qeM4TNN0CWZBR1Dfir7X6DrUQQJ/42E8/Va3mgt1Ad6sy0coHVdoJTUdrTmGLwmss0JS
         LfieZIBzi6Pw30Hrv9nwImhaneu01HbqFVaJZ8Dcu+pf/Sye4Rwot+trfoEXi79oXsLJ
         HNfpaoX1FhdLnxMHZP4r2xgacAvrgDBMgC7Yp8XuLRIK8Qblk69x5RYDzlsHSxS/4E1f
         29CQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uh5T9osJpHTDn396RP7EmMCoNk+HierODfJYkEki0c1+2bXsM
	sqQI+IrUPM0xcbQNuR3Srxs=
X-Google-Smtp-Source: ABdhPJz2cQFFB9q6EMOfuaQgHpDAl8M08FEUwMX+aGwYtMlQHXjyEslBCkTJqsMjhJjTeyn5dotDfA==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr5874992ljj.257.1621584144876;
        Fri, 21 May 2021 01:02:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc06:: with SMTP id b6ls1055391ljf.6.gmail; Fri, 21 May
 2021 01:02:23 -0700 (PDT)
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr5881257ljk.468.1621584143863;
        Fri, 21 May 2021 01:02:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584143; cv=pass;
        d=google.com; s=arc-20160816;
        b=toPIYkP+Fw41ASrOi8wEDGE5GuXAmuX9elrbY3SkpQNTYqrEdOqj+X4wjejscsdCrh
         40wPRUp5y+QFIFFT0ayjdZ9ZrPulsFIGRVDRQYYMv5IUR1JMxFsIHO68+pHghObGkXKY
         l3WJO6i3tgnl7/0GRs5OqPlN78pNkTIQ5rIcRBoEj7xfBPlG8ruRlOi35tmeLLdpTlQJ
         okD84eaFboYiVLwls7Qvdme4uT5MReDjCxVcFLgjUjhRm0/sQ7YtZUOzbSgJ4WXaR7fR
         VVROZ1x5OFRje7xFDwAnphk8ugu33hQ/TDGCIZBOX+Msvpi4KvOPmM30SMqrngdDDfE5
         0K8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sf8V7TGMwk/SczvPd/7vDu4TBQt5asuLCSH/Liu6KtY=;
        b=jyae3W+/ZSpg/oZ0w3I2IDf16vBELerlIsbwJKtrValihQo/Gve6S+aXllyX79sc7Q
         Q012bGydydueYBo1wG3JfkuyAB/jtDTi2yYCLDeM9iyq7SJyO3VTZ/gU6vcTmjRo8zJI
         M/VO7eC03PQ4AU3zwHeAfeViVEQzrtdnpTZCABBO2dCqtQON1ugUbHK6FjX2+CWNZ/Fn
         YdjzwboYqd4oQxQki9DPJGhqjkfdTPwW2706WylBwwlAO67XLvW7qQxgWQaPpq2bxzTE
         EXCM0ruQ50PwL6+VvJIvJlg7Ml7WmwH++IDmFBQAgJ+/8wNQz0ZfKrl+sA+NMt/ysK3C
         lWQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=NuJM92cU;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.77 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com. [40.107.21.77])
        by gmr-mx.google.com with ESMTPS id e9si268994lfs.4.2021.05.21.01.02.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.77 as permitted sender) client-ip=40.107.21.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL2dIsbJfol7Q6cd4dhSu0lYRB+MIVsmA1hE8ujrnV3MRwnHPby3PlBEzFHGOCs7+n5S8dmdTIfysC2BsTs+8XFdXvKQkdSFDJygx6BmOSlQ16fxvxgPAjc7Y24JJ1Oir5hOj//y5cFmedHJ0onotjFa32xYEAOxX+wPMG9nak4eEZ/BCs+6o+zIOhUeXGBYtYonaLLPHf1YBT0M+MO+bjuUId3dt89n/mIrHRw5dZMJ+bvApAIFfooRua+vuG+H8w0Tpisczav08z4RBFagrg5HCGDzxgN9Oan2WOTJbkL2gRG4/V/jhrEy0xqfMN9tc6Bkj+jWNJGrbSXWdb+ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf8V7TGMwk/SczvPd/7vDu4TBQt5asuLCSH/Liu6KtY=;
 b=Af7tTC1yZjyH2VLM0RwPfHmI0GWGC9jGGI5WanfvUgpjMykUDZlw943Jvw0E3iqBuuq9vzHWpFQebIhAX/SGsiXo+p5+0CulVKo0JN6hwl2oZb+kL305yKByWwhZ+jq9365UZ2d7b3vYRGgAFQ5Rxm5frjm5gr489s9qo09OdZxXBU5p97nwFQGsKh0hhncr2JthH3JRFzzXlhJwFNzL40CIB7RrnYws7QgHL+eshmESkgJRE8pXojp8fSTXQS5Y6np/bxqmriItqfYSCp9JnsjXG0FLKzjqd/7sJECA2YxGDt55pde+NTROzevrAvV71R9bw25Ir4OwS+sOMFmlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:02:22 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:02:22 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 3/4] tools: jailhouse-hardware-check: Remove python2 specific dummy
Date: Fri, 21 May 2021 10:02:10 +0200
Message-Id: <20210521080211.487380-4-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080211.487380-1-florian.bezdeka@siemens.com>
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1P195CA0055.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::44) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1P195CA0055.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:5a::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:02:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4d30dd-c2c7-4cd5-6d22-08d91c2ec354
X-MS-TrafficTypeDiagnostic: AM0PR10MB2418:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2418EE0164A8EBCAADAB86AAF6299@AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cm9Ly9TAxWDBWp2LUteA95tUygbJE9pSKkfN1iDrh7kauxD5WCfCRZmITmzMjRs0kYd+uM78zfJhVes9EjMJwv7+noLCYKYD+4SxvOkVCpB1akXpPxoqd++rBokWfWxR1T1aT9/RfFqRnavIrwDFzmIAXRhUSgqtM0xIBmlO+7+i5Br6TCZ6XGbLTzjCFDAukQjIe8vQ+Mzyo9sJdTZENRi/gGjF5H85JvBTTDXzTleU+OGyZlq3Hhyw5EnDu8l78ZLELReH5V45gaUzI9md9Zymv/hZi0wqYyggyxtpoZHgKKGYQA/SpI+LSyYaHIbS7yHPckzlXPslOAhq1XUZtKckgxYfY+uGnMSLYmrGhRJgMHJIoSaZvDld8Cw+HSb07+khuSis5T6i/E9bvUMz8AqN5228dNKEOtRG4jBZ5/3hzxAouCUc3R99EXw2TlSasqrNGVZzbemUw84duv98VMjE7EaakHfGeaw0Ny4O6vcx4AoEyXhJkcPTJj7+4yf6Qe5RZLgir5foWv4ZX6/3RotTiSNTjPzLsE/XyLrOfGvfLdPBUdu+jHSZIcpltsExrUupOjvZKM7xxw1F91FKOYJAw6iFU9XeGqo3wQ5C0CY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(44832011)(66476007)(66946007)(6916009)(5660300002)(8936002)(6496006)(107886003)(16526019)(6666004)(2616005)(316002)(478600001)(2906002)(66556008)(186003)(4744005)(8676002)(4326008)(86362001)(38100700002)(36756003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Of6xVWgOVPdWuPJ7Y0wJyTuzb7DGNDCTTJOuqcFoa1oAhwly5zCB+GitD+uI?=
 =?us-ascii?Q?vw98KEsrxNvqN1PYolspVCO9DfzcYUTEcaihPAQ9B/rM4UY7vsiKXbGagNRN?=
 =?us-ascii?Q?Yo3qyTvlsyCL/veU+734AfL8wmtoVcid+ui013YhwL6fM/qWB9m9xsUSFste?=
 =?us-ascii?Q?8WOumkExftHtXyPf+gNy0OGxzgN43OFVsA0bv07fi8w5y9614mktY4AZQHlm?=
 =?us-ascii?Q?WAYW9HqFj4OHfwycRGDsiRmQf0GDxnqRNxGY0ZpnZDppC+Zbdlig7kk/tkwU?=
 =?us-ascii?Q?1LqJxddnCWIQdBfkRVL4evQS6xYFV8hxJzAZwPUxCcqRCL+mwzQ3v6GDl6VC?=
 =?us-ascii?Q?cwkuEmYicPBf+bKbTIGjg0h/Mxv/mIGxfHYNtvXEM1N62p2TEV481iDMDXnA?=
 =?us-ascii?Q?E8LpKu6sxVs9NH/9YaxsCmpv1wFZYELy2CUWmpo/KUKiOPzaZHg8+MVOwTbl?=
 =?us-ascii?Q?axdGi85v9nmsEX1oCVj/vYjOlTM1iGEVU2FC741ZpjrwjmXStBB7MG7SYM3A?=
 =?us-ascii?Q?Gwc/w/s6xsd3AHri7+gQFT1xGWK87So3DviMq0ZjiIBRGsFgjtTHSC3PUQAF?=
 =?us-ascii?Q?SMOcpOkIqfAkgUQxgIQTh4NnNK1YIh5Ju9NCdOvjAb/2tkQUION3hQeRbqEp?=
 =?us-ascii?Q?kCFupwdCNOah1HP12I8lzKeCu8vrWTUNqY4mV8dGp44elfbMDZ2IFGw8l3SM?=
 =?us-ascii?Q?Xu/W6mJRlyEKzar6Lw3Rr78YzPBXJMwI18ctezyiX1Uh4QbreSVN3iqtudBE?=
 =?us-ascii?Q?2sga+ITh5bM0cuw6hGr9euAnhqjxH4hwX3CKS/QPanDG2AYLJRHoNaD5N1Pi?=
 =?us-ascii?Q?av7sMchq3MdqqPg1sPj3qW9Jz2hwU2rNofsHGFKqRm1NlSdNg0c76zTI9p6x?=
 =?us-ascii?Q?Ds8G46FZewVY4Y/CqbPhshyOxpnEtT6s4zQTYzewLqhz2htU15+4Y3EmxRoB?=
 =?us-ascii?Q?+UCf7vxy1Hmxwm+3zrHzMuGFdhLQ3o0D9y5NVTAZwTjIbXfzEFb6ZzPHbuDg?=
 =?us-ascii?Q?sJag1cfY+OyHKL1ROqCZTTE5qmIwEvfKJ+dB3kB1wEIIJHb/2DBs9q13AiDz?=
 =?us-ascii?Q?YVTqaURgaG9Egt/Iva5m12eKfjYIbHnW0t/R2CAVUn9EBLdhgqYd8HgdMBi6?=
 =?us-ascii?Q?IlSR2E8MsCGvQPQUtAZ2vHqmeiLJmBZ0eWCNtyCz+97rq5jNeuXVNYVkTNGf?=
 =?us-ascii?Q?ftRhOoS5adN34MqhQjgTlD+qIlKQuujqfVwHzOlOoDJen1A6DMrZMK22Po2F?=
 =?us-ascii?Q?anxZ7QWxEBD9p1B2MPZRsD2z9CYh9nWbLqIrO3cLxfkt6s/8oRwg545TlA5U?=
 =?us-ascii?Q?sIc9RHHVrtOS55W4rlze0HMQVo/C9v02H7P54CBAYicbtcYERn4hZH4UJ+NH?=
 =?us-ascii?Q?QRXpbze7XPEOivzentTNzVl1O0NU?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4d30dd-c2c7-4cd5-6d22-08d91c2ec354
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:02:22.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV9xXBmTYrSe5n5TSq1gYfm9gbtkgOvLXjgxekCRNUGVNws1ixR8fd/6lNtKtoyhLMyaqkU0OUDYLNI/bT1SkKkDVWcCBSmRrGUTsPdIOW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2418
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=NuJM92cU;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.21.77 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

We are now calling pyhton3 via shebang, so noneed to care about
python2 anymore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 tools/jailhouse-hardware-check | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 7a41b48e..1ed659c6 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -20,10 +20,6 @@ import sys
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
 import pyjailhouse.sysfs_parser as sysfs_parser
 
-# just a dummy to make python2 happy
-if sys.version_info[0] < 3:
-    class PermissionError(OSError):
-        pass
 
 check_passed = True
 ran_all = True
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080211.487380-4-florian.bezdeka%40siemens.com.
