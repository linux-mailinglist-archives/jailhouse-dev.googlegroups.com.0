Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB25ITHUAKGQELSR6ECA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BA47538
	for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 16:38:36 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id r21sf12096693edp.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 07:38:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560695916; cv=pass;
        d=google.com; s=arc-20160816;
        b=SvklrwZN3lGwZgY7+S+znd7KIfPRw5/XS96Ey1usEv9zl4K7o1c47VmJAryQS4fA9D
         8aH0avDqV6+is7OG0OC+fTHOf5zo9RGrYXfQMfsR2m1q4qqw9JMVYolxAJZ1eCjwjfRZ
         LPjjM+EJF3BnRdMaLBz6JP29RD3FMC98loyvjHW+t/rr6k22AGXluDQXlfmoL46DXa2h
         iHGFhpHQsMfMWYv41chyqUY/whim9R7wi22SOg7gugfpFh7pAGRKG7gM+GGyufLNatLl
         +clWKAYLWlyHkfE8pxKNj6hvPMcoAGRGxZUsfr60kNTIymWQmhtkJ5293jIC4RQjYhX4
         60XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=KMhu2lvKxtHICvERbfwL/QjTEldfsCcaefTS3e5j6Oc=;
        b=LRza1tQHIc3XMXpK8phAoJYa4f/QNiFy3VwcALOVqu07NZxnjLZ4scS9LHeOPjoj1a
         R/g6hjbytxRdNSz7V4L2yMr61pzOWcVXt5dEulBDjxMBBfpYotHNnhyNA6bPt4kxlAR0
         w+hQhkCzR20JSbjbWQHiynUUwg4gxP9SCjfyc33MotiSaZnJjxpyYHQ1bVJe26sbf7xv
         U7Eb8ghaNDqv8P2zztO3vp2Nfoz9emIhg7kM++ej8n3T1IZs9pUwymPUVoEa1XniBqMt
         uCtBZQadWAKSPe+IeDKFYOinNjZcSFJvIf2u2UWMWbC/QKqbj9heIRfeL5pAvyyg5eSQ
         yDUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=oX7QwQ7W;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KMhu2lvKxtHICvERbfwL/QjTEldfsCcaefTS3e5j6Oc=;
        b=bWYb6ZySIJ2xyb5Kl84DoeRm6HX8adOjCSjg4LZ9NaUuQE7MwSz2Y34VFDnVgwbqD+
         dYQT2lVrLt8TEwaklGtmhxKO/2aqAUZ6Xt0EI+Hn4d+8k2ChStTtd8cMALjyulKkx7rz
         KJ0Bn4pLxwvAvqGjGL7LNATXjYH/pmXIB3i1MbydCpj7KpnhMbPEf/B9GxtTBqK1AKfF
         jiMqhH07ockkV9/qXzgWG85Om+BODcq5izXk42gQfSihQOfdpOdi34zD+g1AflQIk50C
         Wn67jP+JFtifJWl1ME7UkmLn5j01aRBsRNWPZeF0nQB5W4zJFOu1oB9FkLMcMIDf4Okq
         D8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KMhu2lvKxtHICvERbfwL/QjTEldfsCcaefTS3e5j6Oc=;
        b=p12rC5Q/gh8sER1zYhGxYB8H411XqdC71L8mrbJjWzpynd9FYVxhXEL25JcSTaOsXE
         oU6sZpVCRgGvnuF6lnMZligk7esNYNH9hGi8mTSoSRGn6udxL3QZ/xMDBJLOHnEKye51
         pA2VpsMWsJ+XCHESQP4gvQuKPVInLICWksULXWmaQLkvkRn/0zoh7d1Saw80hsOZWUqq
         luAEn9vqaPe1ZB5aeFSNThOnYGX3kxXKaZxCd70wnS3bI83FjjLmaTXP5WJK+rDfUdUV
         7+CR0B0NIeLDrtbNMduk/hU8aKJ39W5MTeu8Qg6A/jglcNkRQbH0OtvtZHv0mssoPyIo
         4aFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXHujJ4O50hY9Ddupo7lwZRt9m9hOqrotkgoBd5hLJY+OK2fBeS
	Zi6XnUUVNIKn/8hZWrMX2e0=
X-Google-Smtp-Source: APXvYqwEvq+4kYtdwbk3jGqV/LuVcJq5gosjVjc2mrPgisfAlUECnTIbrLCZA8Dn2q+H5dYFzZJC/A==
X-Received: by 2002:a50:b187:: with SMTP id m7mr38245292edd.81.1560695916008;
        Sun, 16 Jun 2019 07:38:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9728:: with SMTP id c37ls4064176edb.12.gmail; Sun, 16
 Jun 2019 07:38:35 -0700 (PDT)
X-Received: by 2002:a50:b48f:: with SMTP id w15mr66726645edd.260.1560695915591;
        Sun, 16 Jun 2019 07:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560695915; cv=none;
        d=google.com; s=arc-20160816;
        b=sQbf9dEdP45vZmSQY6XeINTUPAz9x5VhNJh+bBjtPGaDxM2cdg8iiOyx4npr3MKKJa
         2o6HuG9z5VVQEOX+N0JjG/puk9cdUk6HPKkrSRHwVAlYak3iOK6Yv7U1TwmxJlsClwYa
         SNfofbs4h/LaC3uA690ZYMStIAINocVEgiU4ojzuGulMxGNLiw+KKWHGuUB4mObBOF6+
         NrTsg/aOrLMrSXKi+mofuaM+cB917RqzbHrmQcFu664TWy1hiXLyKU/C903s0UUT7nFy
         x0DVNAZQy2/6Tw7uzXqjTru487RXHHgij0d11pit42O5WqwbrPZ11Zot/rlJ/8P2n9vn
         Xq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=FW0GR1EY1LfeJlNWIjLbb9BfjQiigApZf1Tg8lOXg4E=;
        b=Petj3PJGpXfbdIbj12Jcp4OCUY4WWrGq8wdYVMdyi3O16YKOwsUotdxNsIr+mg5IX6
         pQQzn5DWLRpgWWi4O6j/XixpcyQ3tMHL0B5dDFrYqB31jtenLsFBFv+y1nIyRRY9WDv8
         TeFQgovk2hvhQSh8B06bDWYEMtT9y2/2/p6DcEZsY5z4MLPDUv0zWyyPmPGjZjsKqdrt
         yQu2CwrOATQafiMmE7VyhaFCzYIfbYLrZnA9iq7pspwm5k4EEN+660bU48QKJIBzNgoo
         WSG2SuVaEdHcNGHTMY6GJfDEJ1Wu47NdgtMTyvGOXba13EWqgKQFm+uX3AaeG/872GE6
         9O8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=oX7QwQ7W;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id h23si499668edb.2.2019.06.16.07.38.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 07:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M6Dve-1iZQeG4Bqs-00y8Je for
 <jailhouse-dev@googlegroups.com>; Sun, 16 Jun 2019 16:38:35 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] scripts: Fix header_check
Message-ID: <46a3326d-188e-bd1a-49e3-b081396f6850@web.de>
Date: Sun, 16 Jun 2019 16:38:34 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:/feJmQGurdbwJasBAGa8XJFFACEJlf4rvsivv8UfNVt+d5TeOs+
 kIOLaOEG8acbWS1CJ1+uhWnydbTYC7pQ06dmLtzjOZy6kMM99+5w/CUU3eeTtJyznNG4Cxe
 WJ0cpzMbUpvLuKnqLA+z9ZGFFiUxe98MciNy5Bl7uLvG+iupTXRLKq24kMmgDSENYsietIw
 /DwA1TkPHNW+4noJy5OZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P8fPh7wwmvk=:OWugb6yQgnoxyxr9EuKf4Q
 nqbm6UaUEQpfKVQaxXHVYJwZGWr7Yyl5xyE4C92hYNahXrYkZrtdSxkiKbO9kuVvB2/fxfHZp
 sLHkFXHT/dKaZwv2QH/oe1HOUREeKF4E0otd+q33bbuoOV661Vnv3xpOHM+4/izGagXardcXQ
 MJMljg0YwVGxqvg3jh8nMPmsuHoy6maHIIj2cpWj5qB8BMeJ47IfrM1AfmlOWYQEIv/Dp6jWp
 ZwSqH+RsA+kisk1QHIoPgFOQoAYDV7Z2X92+HXQ+Nl9qlgDbFWN8gEVuMk4FIJHqrNlc9Ptb4
 D4L52zcynSfQGfECVCkKjFPcRJIEgG7tpzTdoefZIcJsJ+vskMmoUiJC4nHDpXFhyB2wRp7yd
 XaQ6gXx9GUjApBQiYrGSps63JFShqFR7w4E+KjR9BZwXruDvUBDvEO/7R4nFxHTXN+G/EJNNA
 iWr5dHixHoH7zdU7R2l2Mc0bP1eB45HS+73lDhDQ/jZNnKWdOTARI1XpLDgxSe5/OLiBzbqpO
 GaWYiim6bqdWiThsioehdhJV9oTikkBXxJyTjl1eSrlIlJVcMonwWF32bQNOtrAY/oYcjzo8t
 NndAZHi4ybJj2qy84U1MirCJP6nfZVWr+OtUEpQOWAUEsu4V6eH4f8ZljIK/eBISUeHqfHu5g
 zjNBhhR0Tn/4F9AOHY/FgyaDIx5ViivbtrQemK/NeCN8plkiulQXniSXIDC51ipgF0wDbLaKQ
 OrecCwLOao/OCA9FkzRAG9aPC2OX4Eo+18IudoIaUDZGIUvOh3v5eDAbpMqkBmIpPd26UwDLO
 ebDnV03O3iTJIl8TFALM4ksrHnDvWQ/l6jXHfhFGtVlmUtd5CzVJ+HtPVyYTYQiGaT1D/WNqV
 Z0K1RvH7AQXPvnC5vYSV7yrO0eprrzXEDnO94skZsLnWVVloIIU5FgLIk9wPHdPTCM3sRYiua
 N29wQ7jstuKHIxK4NafV5g+bhrS7bxNy9i8HhlyVXJoyrFWoOlRXe
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=oX7QwQ7W;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

jailhouse/console.h also requires types.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/header_check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/header_check b/scripts/header_check
index becb11f8..b51f7900 100755
--- a/scripts/header_check
+++ b/scripts/header_check
@@ -31,7 +31,7 @@ test_compile()
 	header=`basename $2`
 	prepend=
 	case $header in
-	cell-config.h|header.h|hypercall.h)
+	cell-config.h|console.h|header.h|hypercall.h)
 		prepend="#include <jailhouse/types.h>"
 		;;
 	jailhouse_hypercall.h)
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46a3326d-188e-bd1a-49e3-b081396f6850%40web.de.
For more options, visit https://groups.google.com/d/optout.
