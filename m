Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBTWBYHYAKGQELGRHOPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id C82381301AB
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jan 2020 10:54:22 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id h30sf15521937wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jan 2020 01:54:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578131662; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fw1pFL2CeA37/gYarehm985snb/kPk4+T0UU5nilGgL82zkjt1exUUE47qbc3CW8UM
         2W8BQvhq1NG9RqjtEF0IyGySC8LoBkBIHQ4PCYl9pr5fnH/jX52KRE0WtSeC9X3cF4DN
         EItStFmKVcHdrherdYX8BQ0iP9Rx7P88t/m2831ajCXG5QADbUuyy2vQEdsYqnwOSlp/
         PgYUC8dOcvZ6PXicNLgMwalmoCpOEXosLymhIdhZbdPJ1MXRXCTz2UH+owM3w6AIzeTY
         Fv2RIoOuIxewBVzGViAANTXOHWcJKi7hO7iIGk6he5YGNf9G90Wta6e7aQZErUyQE0J1
         hq1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=deEq7iNIAVxkWPeEY0JrgfvNYSXp/F8abGrxnBcDZHI=;
        b=TXC5jVK+Hp514kWVvSPRHrcubqId2Ba+EAJ3e89VxANP8MWWafpdRRKjztfewVFg6y
         e9b7kjouNzbtKEd+LcVuCk4JKAdYnqAVFJ0AVkvT9v/rp1DrbOJqiIj+YtiUhg2b7bx1
         w4N5YcKZH/OXaWhMKpVuGSNmvwfqygsuf6e5QpDJgthw8y2vcMzClYRTiRp4HsXCqHvV
         1H5EnxbKo1M3m+A3fLoZJ7celsRGIRxP++EWXmb0/W+3d1nutiOGCChIu6v80c9Dl1VX
         FC0vdwXDIekG859CoSkRdxGCONeiSuuKOMxzVrsVj0X4JFAcATl88mHJzt60nLldFYuZ
         1jeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YwuiK6NM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=deEq7iNIAVxkWPeEY0JrgfvNYSXp/F8abGrxnBcDZHI=;
        b=CKlB4JfirRuW5DT2BOtp7Tz1cGsF5F3WKWgmWyzfNgY3dyzx6opIis6laZXaautwrj
         VimK5O+UGQiT0iYz0BlmxSgjLHgV6fSlc744/4V2GORWuE9aZoyoNq82fqOkXNTMKWZd
         q075qXjQIuxhKeLh7wG5VYiqDeSesAdXislhy6VGPCtZw7o/ZyJ8yeWWsjky5KA328bG
         MfLcyOUJKMv4H6I02nxpLOvTxrIjx0f753R+D2hYFBbq1jiGbqZ3JLjo2vidGh4yCWP1
         hunCN9ihC14LRdWuV1zbB5jMc53KbxxZWUlHmM/q8cdMAjEh5VfNBJKBXZN6V/ahVb8/
         9ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=deEq7iNIAVxkWPeEY0JrgfvNYSXp/F8abGrxnBcDZHI=;
        b=pQVVRmqpEkxzu/I4cK8xs+JMWBUyAmpfA1d7HTtF2+73AFdGYyx6zVKU2nZvnfa3y/
         FIzxQVdzTdz/FDAR9hIkmsLib4FhVFpKxWEH8c2ZE3TOGhQa73siNXpudNkPO12fb3iw
         yi2WzSH961dV/Cd7Px0CNCDb63qNF1Fer1PJYuy9dmV+3BDRIf8vSJzMzsykIcnFYpOI
         kjXL4oyIAdYm9xgx256HXZMgYGGeGubCDdIpWilnWPxekiA5G1j8z1p81PejneacT50X
         5O600DsnbLxtWfbQn8xrXXXPDRXGKpK5o/TBYJy3Mg6P6gSkzUygzqPfPr4A2MuHfbh2
         I4Cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUkyxWmfsar98E/aRW5ztC7ODwWLGmOuXEG2FC7+kCZVx9nXPy6
	YZ00l6I7uykZU4w353uMJmU=
X-Google-Smtp-Source: APXvYqxrhbaAO6gg0DUZfEgyPNoaod8NDHgrJcddwW2awt9vnz9rn90uu89A3iCXTijLrlWfApVgLQ==
X-Received: by 2002:a5d:480f:: with SMTP id l15mr92881908wrq.305.1578131662411;
        Sat, 04 Jan 2020 01:54:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls11570447wrn.6.gmail; Sat, 04
 Jan 2020 01:54:21 -0800 (PST)
X-Received: by 2002:a5d:670a:: with SMTP id o10mr96419940wru.227.1578131661904;
        Sat, 04 Jan 2020 01:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578131661; cv=none;
        d=google.com; s=arc-20160816;
        b=KjAl+xNUDHYTjkmArCHTH4rW4wv787S8TjAmj22XUyg4N/7vpP5M+qMHlWWs2IpBxp
         Py5QbUzSJnNOKkDV+7sQNuISt4nTKzpgmP2rTuPfBfYuuTFMy4Qkn3V6hEFVzxZBGwo5
         9CFKb3wZEMj3IQhFuxwRN8Jq0/8ulp9za/sic7HYUTPU6tIpdqIjcz5XDjkw1qrybnRO
         2HkwgEhnS4ze+/qOZDrXZDn+Ah1cGtXPC9zgiwDncyIFZLNOqkCqPAIOf3C02/UiJn4A
         hnhBFWpp6dbaMF3efro6aovv+tGXG/DtEzxo9ZxhE7ekrc9mwM99kYY2iXs3jB2bo4Vj
         DZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=fZs6MXhz77gldqpEaA5Krt02m0XouhRl7h1PYIuw8zg=;
        b=vWOEjHc8ZKqVpdVC6EiRgAoHN33SwOQj1L3ArNXAU0MoAU9aGVHzD5SYiiPoND+dND
         vY//gtenjRKkDD16O1kHKD9+VWAbbr38/9oeFj6BAyRHcz4zQZ5+3CnFR1SaubIjasAc
         rkV+b0Q9t6Dnyh0TuWYZ49ZCx8vP3ebUXoPQzNzE3/hTBFEM8SbsE3pT6yJiU+cmQJOl
         UC8iNifPlGBVUAzuisBZrB0ri+MNEclHhKAuSLBX15Myl7t2W5U1qzcS4o8FDJzkV/mT
         wdvUvuPoyqUQtAk3dcztB0YAQLcnsON2ocxs59wuYXzy6PLvE+z0j+jNw4SKAThxqgNl
         MfBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YwuiK6NM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id m12si2112796wrq.1.2020.01.04.01.54.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jan 2020 01:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MYNrh-1j9rpc1UX3-00V9NK for
 <jailhouse-dev@googlegroups.com>; Sat, 04 Jan 2020 10:54:21 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] .gitignore: Add new .mod files
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <d876af6c-f64b-addc-0243-da3a7632e7f8@web.de>
Date: Sat, 4 Jan 2020 10:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:6dH1HXqRS7eAnAYmaCy0RI/oR0sSADFjJo+n6cJIwV7lrRi3rNH
 t8SdI60+XKUktRTsv0mcKngsteiIE4TgwLjM+ZjqVJYd6FYniACxR0kYCV1U+klJCcT+7sn
 Crtwz/BWuB/B+Rpb69gbGkXyuDSNTQSn3c3vgoy3EAejCGGrAloW2QTKbD/QJnL5M5zytxr
 PmEJxT9tI9veInjlinY9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gwFjbCWCNjg=:hSo9MpJORl8elBB+gBsxz8
 NLRze5aIa2PVM/kx46X4RNFujLQsvuYPIuXIdzyydjtNd22tuPmuXuWQ95RBlX70lzqP1OlzM
 7/pIoj2IsYMnAGDziRgf6Bc1RmlCIpfrMhvQKiu7iUDMwPrgtS6AbmwiUSxmM79me7JI7JAzs
 lXZBCHvQ6xp4bai7jnPljz9RquaXMYXtelmfQabQWSrf6xhu57PNrIcEND1ymleL6WCXpB6kH
 TNLGtvoa51gYnVRO+7aJnRuYOzq1gMkWsw6WEYJKv3KhYPWwbGqloPJEWbMKFPdaTAuFL5hon
 Ep+iQpuWt8HhLwXaGH9FjExcHfGOOiSiNKnTWuqCGxSfyjHr9I0htKAYCSb2WiH95CRXDUv/n
 TRkKFsoCkaeJ6cerNvPOrJBqJuUxQWUQMXnFoTMiGkpSlash9/ryDXkIstntJsuozVZFOnE8f
 WcX+KAgSFr8sJBWHPwHvLkTIc/Z8Pij5c46d2vkvV6GaYt+dGbhA2GNVVDcyIlXDVEe9+h/ky
 tdxvN0R1XqIuySjcRzO+Fdjzwzg9Yr1W85Sa+spR7VqpDg6de/6gSq7ELhbUBeC+4f0OoDaTA
 oRamGJGJ6uNgCuB6SYgTC711Hahxi8M7u5yriPA/IBQVGdr+QDVbNlmiVZ8BIOQ9m4JWiSCXk
 +vVDMYpbwyC+Z4a2VUG87NTiN9kmOUir2ihvUUwLMRZMRsf+9kBNtYx6EcZpkNHq1iMRJm2X2
 YoVN23p5RsRSmXUZ6hsorndAIjMeuUO96G6ZjXrZf0/V4+9DsA+nFmkKEF/Dx69pZwKgZ5A+p
 OxAkhvUpeVMt8HE517bf+G3H7c3YCGb/eN2J7UaONUBxkj3J61dpsor+ZCiHBMY7v1/3slKZm
 gpuYzUWT/2KDmVNMexU8KeZorVphiuORq+UcnX2aeuvzp6oaY/muxn4eWUnI0sumttIISC0qa
 NZyk3LIps+c8L9HispMG9HJy3facCkK+tmHltBHkvSVVL5RBLdKBjeNGIdeAWX3tUUaS5WoFb
 R7rxsADyWlS3PNFHCic5eST9NtTgpyGRvs2OYBicvgw3fHaheWIRP4d77T24vnUOzeCrNnIRZ
 T7r/O/gdwXafBhEKuPvwckHo8xjHPB/WZh46HFHlbHoS1Erff0GBaEFLR2ImMvQ6vXuM8NwQq
 XCjY9QVbyvQIyeiSdMOm6NC3aBnSiQuSYIKXDOr46GXGJD6GlfoJ0loj9E30+Ku6ZpbiDAe0H
 VZYnvhcvTHn5+eyYepsPmY5Xnjc/DXF1M4vUIDAwBPuG0BYODp9UK6r3zYvc=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YwuiK6NM;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

These came with kernel 5.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
  .gitignore | 1 +
  1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index c8a96df0..75145605 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,5 +1,6 @@
  # Build outputs - only!
  *.[oa]
+*.mod
  *.mod.[co]
  *.cell
  *.cmd
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d876af6c-f64b-addc-0243-da3a7632e7f8%40web.de.
