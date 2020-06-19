Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJN7WL3QKGQEWS4RYJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52F2007A3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 13:21:09 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id i11sf3578147edx.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 04:21:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592565669; cv=pass;
        d=google.com; s=arc-20160816;
        b=sIEwOMGWKnvFmqWijNbyRFYbDW7foK8AIn8d+w3kwjY50pK5Lm0MTG+EdYFI+iuGqT
         aMN+QJAT1HjXnO2MgntKXsLCMlR03b3aIv+uujTHrkeD7yZELkPYrtRf2DsWRnZQeMq1
         g2zLRW4waOMedArlQwTr1y+zX80d/oTg9BAxNVTt4hQppt51zfr6hTMYISkBMlR155Rr
         WjYHrgY790HDbXroGcJYeawuP3LvtUIDBy3DXN2vggSBfH/eKnJmKYm1kxqtXAONbUK1
         L1XEKewcyegdaaweW/8bEa7GUSHns/WHemvAHZ7Xi2w3jsN1xCPwTbU5p6Tu2rT/c93B
         2Aig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=yKDiF7Z6tUPLd6mUtbbERMEaALU9i63ZQ4umo6Bo99A=;
        b=zyRapy8lEyOTWJboDEk734o49Fo4+xpmL8Lg2nmN/xuaxk9x92HYHx1DRWiGjIpS4o
         CMVutUxrA+z+X+pNc8vsRrBDYFDp/V6423p3u5xpqKINxkyOKKXtaWfoBRgXeUbcZDlu
         BR3//ueD1ERGTytmKdYgnIinAVRiNj39GXpaAYL/x3rI1IAzmd1s7VnapOLkSDuXMAfw
         vKxG7XQTAfyb88sHKsuzMcvv3HSDxCzF5FmfdZ/I+5tPThXpyclLBwKzvKLCQ9WHy2MP
         wpPF0sCHdCX2SX0etSSAzAnuLIC6Y0QzEzUcVtGGzaSW6eqWVQ1NN6bQHT7OVUzhb59e
         jEpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yKDiF7Z6tUPLd6mUtbbERMEaALU9i63ZQ4umo6Bo99A=;
        b=H7JQtwKJ9A54L/MywiYqz/vRwHpw20XYsUX3SrlQQlUMqMBySFQj8TAF2Ta4UpWZ4A
         IKj0GFakawL8fAp9n281g/961T7JI1PL+bEyzaE3QqadND7gfpfibi4DdFFjLgBeSCHh
         DP1NBW8agKm8Np4gs7WcNs/J+Hjw8QiqSbM49Pm5o86CQUypI5HYf/i1F1L8ptwJt+Hr
         +755tBY8V4u1rmW2zIcGZF81v0t4spguIMG1IDTJTl95R+7VIwdLayNC4/svBV3nmf/3
         CJeThcPzLWghTOiJAlkMpNPeADvMQW7CE+UvKKGySDVGwmWzTIW0Q4II1XyejR7HFg7U
         OHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yKDiF7Z6tUPLd6mUtbbERMEaALU9i63ZQ4umo6Bo99A=;
        b=Rjgp5+q8u8M3ATsediO3w6n8Pe5fKLSlHhof5QkHfK/Mj6r0VgbtGYu63PTcwuGxnq
         hmh1JfHeDIF4eWdYq+RNfAGW+zHAMCuIrnAMeE8aHUuNcWFU32TZ5TFpO5aLeNCHld9W
         VMCNviL2GjGE+ZwPTWtT8Nu0lq1OaZpyoedzoo4yMQJOdfb13hGpaapPZYVqiprX4Snc
         2c7JU4fQRT22risfVVJ2k9cKkdk0wJYcEl0KdfkgCEhu8vjlBnZ0XXaKgG7iv1TLnGKv
         xLMOruN3pVegRofK4ybhthTFQptdp/adcBW7iUGfu6GRm2usVrZBHyjrU5OFwwFlCv3j
         tnQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533lISii/bfYuKGf7mWxgMGy6mAyMxixYH5AIXIWRQm8dkOpnR/d
	nuOfZy+vSq8U1AgMZC5zke0=
X-Google-Smtp-Source: ABdhPJzlmovamV6vj2e+enP35OADHCYWF2EydrLzvlFsk2+eW9SQT1suXE7U+ZmmdWJzLVHxKMqjWg==
X-Received: by 2002:a17:906:648e:: with SMTP id e14mr3109972ejm.308.1592565669523;
        Fri, 19 Jun 2020 04:21:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8c6:: with SMTP id o6ls4180556eje.11.gmail; Fri, 19
 Jun 2020 04:21:08 -0700 (PDT)
X-Received: by 2002:a17:906:7253:: with SMTP id n19mr3300430ejk.31.1592565668814;
        Fri, 19 Jun 2020 04:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592565668; cv=none;
        d=google.com; s=arc-20160816;
        b=HInsW2tCpD89mqpkDt0FXkgqqvXCL/OBBMUWWq62SIF2fkK52c/CqOl5gRU/SQsIUp
         2ezV+CRlaMHWqO3MzODnTq6mlN42nVe9+W2m4n/O/odBvXgO+MwLrMXXcT66NLPHp1O4
         OLCw9jCCvR0sL8SFLWxUzFFZkVoNoq3+EYZldaDGXwCQT4NOfnkUM4tHyfcQlVm+40bs
         O+MTTw4GrjW/p/yUnZ0+YEEIz5iHnyjwdoyBXcxSbHLQYMmULDZ+C96C5k4qbjMibuYa
         sUp2TdZUYlEzoV+k6D11e5Re+4cV8ziWwMl0zDrCB6udiS8bLgcOgQGoY2gqJPVvPgze
         FTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=V4LOkMnWSwtaT84/O11k7sEjhIEn/EKVdeExMGrZSOc=;
        b=JPI1bQSjiqcnQCqpTcNWT/bir4Bcuw76TihA/h/0mddsyT+g8VNatIxI195IjlmaFL
         2GQ1NOMhH+G38Y204tt37NcndHj0Z1E2k/eqsaxcATIj4a874NzEHyYgGa/o7Xb0Id98
         iDHQdlwBf7ibt/gC5vqKpsY1N8cK8tDH/okwim1Wx8frhtyqQlBsRKiTPMCRqaczq69J
         pRHueYPijr9PaTADB0YV4Y4hvqzP4WkS0DaGMIVxENtMYia8nqt1PAPQQ5nBoC0b0j5J
         ju7t/0hqxhmwHkUJTyGQ2cOzjk3r82luPlCSnT7NnHWm7ou1Qt7AIZ/ZhZqw9bLgDi3S
         x0cQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id bt20si305521edb.2.2020.06.19.04.21.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 04:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 05JBL8Sl010669
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jun 2020 13:21:08 +0200
Received: from [167.87.31.88] ([167.87.31.88])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05JBL7Al020496;
	Fri, 19 Jun 2020 13:21:07 +0200
Subject: Re: [minor bug] pyjailhouse: config_parser parses/imports trailing
 zeros into cell.name
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <01c3bb6e-fef3-4910-826d-8d0d30ac94bbn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0550f88f-cb13-0423-99f9-d9ce574fdd74@siemens.com>
Date: Fri, 19 Jun 2020 13:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <01c3bb6e-fef3-4910-826d-8d0d30ac94bbn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 19.06.20 12:06, contact....@gmail.com wrote:
> Minor formatting issue that shows up when piping config check to a file.
> (no patch available, I have no idea of Python.)
> 
> jailhouse-config-check prints /cell.name/ in some occasions but it
> contains trailing zero characters, which are also printed. I suspect the
> cause to be in pyjailhouse/config_parser.py:165.
> 

Thanks for reporting. This should help:

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 6b9d9066..47350c6f 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -162,7 +162,7 @@ class CellConfig:
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
-            self.name = str(name.decode())
+            self.name = str(name.decode().strip('\0'))
 
             mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
                 self.cpu_set_size

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0550f88f-cb13-0423-99f9-d9ce574fdd74%40siemens.com.
