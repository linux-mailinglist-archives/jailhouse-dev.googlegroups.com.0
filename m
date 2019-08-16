Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2XJ3PVAKGQEQIPKXJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 26116907B2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Aug 2019 20:24:43 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id u10sf769156lfl.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Aug 2019 11:24:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565979882; cv=pass;
        d=google.com; s=arc-20160816;
        b=01a6jhjJBro3wg5/JEnpdpK/BeIfQmr/V5LbDpQVSCJubS2lgTWZBL1pOzY1NghWJY
         bX+QppPp+0DFNpCRdsVWQYwYHvn01OFAY22joOtDz5euL9J9239EumSl55Ajf4xOobZC
         ybNSyI4VYlS+Ev2Icl7WR99/oXIixo4jfHSpDxCT5ZN9UmAW94VzXt3fY9A3rW0fi/qX
         T48Jxzo6C068VwC5PUxCRIukWkgDam7jWOdZEPuYQfdlGJQUreyNO0qu5/fw/p803Qcs
         PYFRJKp5tsNIFlv1NMOaszv+3PDjm8jlikhxmgYw8D0tsmIJJO6a4cJgbcF1pbM3kNr1
         42YA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=HJDfqmNBlnI2TB2ZnJgoQPbrjL+WbNocUKf0zs8WRtE=;
        b=Tdu6ELUfgTfHVYBRTC/M4rHxOaoEduWagCzrKlBVfWZHSXa9yRg05+HqGf24kPoxIi
         d1k1BWHg3QP1Wx6gOYGsONl+EYVDC3kVaaAcvrOcejz+K5HbtDZUl6KZCJuz2/vk7tlS
         aMbP0ykigLEVa/4QQsJw3UrBhCjrEpfV8E3olFhymhZoF+ebNzpds3Q3dSPPu40fw1pQ
         L2QDLPTMx6c15+5ewP2mLIVxYd7L0mHqGInf52kaZHgCcHRsmZyD53yIZPSup7we4kD/
         4u8hR2/O8uPI+JkZy/UwUJPNKIbgGAPOrGEZUHau7dTFa/TURPeCk+Zcn2pVHRn8+12X
         m6qw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sJ1ZVYXD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HJDfqmNBlnI2TB2ZnJgoQPbrjL+WbNocUKf0zs8WRtE=;
        b=A43dOZjg31CTNleBQwk9Cm9hvBgebkSUppRb2Jn3RqfHmPWKpfamuQCfMeuhklFBeK
         94RmR/Ix641tww6ydLZLxCNI2fVdo32aBYS1I6v1PC7KhTd+yd+kAnuR9oJbqhB9QEyu
         O8IqC2uLMT4XHYQwQAi+/709VJe7Pib/SpYtRFgtLujJv24+tRB2nnkXQ9n6jvIEGiZG
         qCr0oPAHrMLWnBN7rgXIuckDYH82sgiLem6bU6fe+kGMlUz1zrRkaNxUAPrUqvvXgPnE
         J5HTxvsAudx3ryJxvPaDZxHbm+/YmRJLButiRQEM+Gm4cmGNj27Fn3ovEN758pKTGp0g
         bh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HJDfqmNBlnI2TB2ZnJgoQPbrjL+WbNocUKf0zs8WRtE=;
        b=A89p1uvLdrXYQGoFqwK9y82IKFjYLp+rhZCba5ZSzfs91mTGtrqL05ea1BMU7WuuXg
         AzvDE6+9niUHvSArMqsSq7deYmwf5dIbQ7S9im45K5RlV3ggSN5WbWIOgRc0Ky95EkW5
         e7NS7guh/Ethx9zD0Ky8v75lF+knAybMz2t/Qh05I7/GpZrPMRUK9IYtOf8dlzi7CvA2
         +3yqBqt1U2ME5qb7sIAUbzGhGA6wBl7F2XBaDTG+pPM6EdVorR/vNEUo3hMrgm/teSa9
         MZJmK5U1kGbw/aGDQJ1T1WeOQoWSAuvfkuxPbH90r0XIAihpW3AKEzvHZvYtZjJnauLx
         It/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUwol7zDxMwGVNHDLPTl2hsl+MjquTJ8UIjFM0BSwU5KvhKESo4
	SmmiNGiRjgVkuHgDnU7H8Yw=
X-Google-Smtp-Source: APXvYqy78EdQhQsZM4PR40varoajgXtK1CcLjfnHmlc8zeDkylRvhMFWxdyDWHhShI/BoFW7uQCpyw==
X-Received: by 2002:a2e:429c:: with SMTP id h28mr6091374ljf.7.1565979882640;
        Fri, 16 Aug 2019 11:24:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ca54:: with SMTP id h20ls857497lfj.10.gmail; Fri, 16 Aug
 2019 11:24:41 -0700 (PDT)
X-Received: by 2002:a19:ca4b:: with SMTP id h11mr5654581lfj.162.1565979881719;
        Fri, 16 Aug 2019 11:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565979881; cv=none;
        d=google.com; s=arc-20160816;
        b=Sl6dtZpCE5CjTs76+RVDtfrfmZgnrQADc3RLbOXN/KLuvooYThzYP/QJdp6gBWRUna
         vDKd6Al4qnd+eN2tcCbwvukJeEBeoI1/UV2xHBWN1aA6YvJ2lgBU+ET2Fx5p5bOWKZ/C
         NzkttZUPtRXWoZtRX0GgzrQCY0+tHO0ETL+Fyx6JBgIqGC8H+OtFU31yL/pkZdWMdTEJ
         lprOBDd/P5FauJu8gT3tniRmgSv/MTNjEmHLySjEWnT8Su4gs8NAUFYBQwA0j7eEj4Dy
         aldDH+a6RZALxo+y1cchz9OZJS0cf9HGwCOoVSucIvtHEyS61zVoPksb84dHw0xmjryW
         n0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=OKoOjzk3cBloIg8Q5KW+ejjm+nU4vBi6/ql9a4vbxgw=;
        b=C/HtL4rJdq7h+LV1LnAiUyplInBkKDbX/+QsJwCzP9+oscOJXT7ABC+g6NOenKfbVP
         B447NB7PdTH4AgHbC4rhsv+cn0Kt/ncFz1nUjowMibqGP+yUL2W6YDR7G/oYeD7YBCIq
         el+YllCNKt18gojh12oCgudQw7ySR6Rprl3KY1GAgX+YZ/O1024aYK2WsVGQBeYXtsLp
         4wLm7FNixOvice0nPW+x5ElNiJXUxGHneYIn+1pkkuNDhOUxMLmXVUzFAuaUqELQ2RRB
         iLnSdTFsrONIARCwWdtuswmm1sWyGVOJrjymPH70rneRbYkPJnV1wMuxAeNEQadQIg5G
         FhiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sJ1ZVYXD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id t23si394296lfk.2.2019.08.16.11.24.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 11:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lbrk4-1ifPZM3OxI-00jH8R; Fri, 16
 Aug 2019 20:24:40 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] driver: Fix backward compatibility of lapic_timer_period
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <33316540-6f94-515c-4199-aa5d046d2953@web.de>
Date: Fri, 16 Aug 2019 20:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:yxD960015MNU2HbhxrRQo+D2OFOs3ZyFVqIkQ1zcdScA9liIWT1
 m+FEXruGQLncihOFzQkQ3Y6RRacq7vDr0pHfcKe10yQKOcce9uDfF9Y2k25JdDjRgOZ9OJs
 RckuzFd4/WZ5cCKn4aCp/tvt3A2e+Wl1iPgW+nF9sNakKIP2vw+XzUnU/rvT8wqByTOHPgQ
 LcOqv6dSxzCnYqGlQpDgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LlaByl4vBCQ=:Iw+MBKPpqpI7Fq1rim8NwA
 dgH2i8mh1vVCPEgsROWtAfomt9aVurZzjCJnP1ZL98Qxd0gm7T2LU2yXQcQbo+SwLyKrqrwwe
 SIXwxuDBBuzvtd3QjZX+UnpsE4eDmhJPi6shNLt+4WoXEzf7GPb9y/kyXMHQwNlI+o21XHWv6
 uIbaPliwy06W6pYm7/UiIwxGuB1RiKhqrE3Ddxv9nO+BA1ryTg+vA4gVGuDREardv6ZkLiq6s
 /rU/YVGbXwYuiSgHijYDxxt0jtPclFJJ8/S+Ms+ZMyhopZvDKYcBC5V/BOmxjewGZ6sQtu3O+
 VvhJ7mCBRdDkZ3Yih4eNbSIwKsENJlQBvqseGDmHPhaA+SGlFfZjUcXeqMGo5QDHoDv2X0ia1
 0mfuzqNEOSrWoqYv8lYaTAfPQDECC4GMjSzwKm4ZxCHdcBNL2onZEFSMQKoD5DSjZA28Tx8cB
 cqM7UUAKw1+O8EyAacUEDd2i+TrC6nLWMNOYySshC6JYXQ3h7gFINen4VKDhALv0TSVkfdIHX
 9L+izezaza+YmXoauyXu1LMGYrfE02cPt9b0OLI+3uIQTpB398+svPAHRXOyiRzIb2D7ZpYGs
 3wB5ofPXzFqNzqk3VWNzLSQXUfsXr1bLjZjHAV6ozd1vV+dOJFGStSz3Pya82JcJMKdv3X6kg
 wJS1dph+24SzUDI6b1HaUqFMob+cr+NW8EbNlXuAxzafOE5xE4ZMbzAtCJA1JFJFBegbkzKjO
 4+gOdytxPmu5HR1vhv2k5/tTPIzT928ra/bs6JIIVVGVcERk+bBDdrcgmIsyXKUgniT6OLKDt
 KpSnXF85GhT9vgzL9yZdnnw808Yu4GPUSEDkWim8xhrIPfYQEQzUpSw0P9WgJYYvSNiEPWOjw
 /jlnTMTinpIJ9AnOa9HdBOTSM7S/xXhik75Un7ZX3g4LbDVhLJVRibYUl5HR4+PQU4tk0ImdG
 WGxo4asJtEhcY0eQxKyAvXKjEScJO2mVdgm+lUlWBCOdY+Vj/Hxr688zSi19BSNSnk9BDzB6q
 PRnj8JWDRJw1mHuc1O303cn2ooJwP4ymov8YyNN2AexVC7P7PoY5siO345tjBrI947ymB6vek
 HsHZSczX8ZjKTcap2cC7Fp9PIVDq/XY0+S3Ju05L9Xl8mbIEFs3e6Cz4fMOXdBhgILWqiKEG6
 wF9F9aSqR4qTRtM3KcvXAlw7P4gITot1yDKXGtvLiOMskVeA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=sJ1ZVYXD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

It was not enough to only rename lapic_timer_period back to
lapic_timer_frequency for older kernels. First, our macro
RESOLVE_EXTERNAL_SYMBOL was not prepared to be provided a macro as well
and was still using the untranslated 5.3-name. And if we do not want to
break up that macro, we need to map lapic_timer_period_sym as well.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Fixes: e7674ea7425f ("driver: Account for renaming of lapic_timer_frequency in 5.3")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/driver/main.c b/driver/main.c
index b3896609..a9bd3384 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -102,6 +102,7 @@ static typeof(ioremap_page_range) *ioremap_page_range_sym;
 #ifdef CONFIG_X86
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
 #define lapic_timer_period	lapic_timer_frequency
+#define lapic_timer_period_sym	lapic_timer_frequency_sym
 #endif
 static typeof(lapic_timer_period) *lapic_timer_period_sym;
 #endif
@@ -889,14 +890,15 @@ static int __init jailhouse_init(void)
 	int err;

 #ifdef CONFIG_KALLSYMS_ALL
-#define RESOLVE_EXTERNAL_SYMBOL(symbol)				\
+#define __RESOLVE_EXTERNAL_SYMBOL(symbol)			\
 	symbol##_sym = (void *)kallsyms_lookup_name(#symbol);	\
 	if (!symbol##_sym)					\
 		return -EINVAL
 #else
-#define RESOLVE_EXTERNAL_SYMBOL(symbol)				\
+#define __RESOLVE_EXTERNAL_SYMBOL(symbol)			\
 	symbol##_sym = &symbol
 #endif
+#define RESOLVE_EXTERNAL_SYMBOL(symbol...) __RESOLVE_EXTERNAL_SYMBOL(symbol)

 	RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
 #ifdef CONFIG_X86
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/33316540-6f94-515c-4199-aa5d046d2953%40web.de.
