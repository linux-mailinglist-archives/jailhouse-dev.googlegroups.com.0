Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XYZPYAKGQEACIUYWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 28727130F56
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 10:23:11 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id v1sf7285570lja.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 01:23:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578302590; cv=pass;
        d=google.com; s=arc-20160816;
        b=BJxw5wjAbwpThlA3IQH+zujA6yfGqEipQc8ZgdYQwdKb3203mrTB7OYoxb3Hr5Ja6k
         mIhwS/1723/uRrvtBeJxX4z7KKvaQmVnyneMjOn9d7DuzCEHqoyiqEHasJomUi4hlYA7
         v/XUNgaHkhIG/b4vXC++E0H5uT7UTBjlUNlwInh5hrYiaYlALVLi8V+eQOHg+pDtjOsq
         KObvw/BozcxivFBf3RKjD9+xex8HIrzE/YfrISVTC3Y27EAVXAJ4XdJ6DFoqtwBVWQcW
         7ibCKZ0ZpvscRPfSA3lB6q0XfTf0LyrnnSBBWdjruz7/OaT+NiMSVbsPUU/LrBMJtuzj
         ip1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=ifxJFdOEPK4ktpgjAHDwe6bLPN5JuYfjXwVtQaqf+dk=;
        b=WQXm4IqdV2JEKwP8IdB+Ybc3rIKvIn3PAFbctpZPySWjJvJTFJTWDoWRKJhVqpSFjt
         ZjHIi0Nx3xVzI0YycsT2e+Akl4FPcvPRstM/cPIGhH1UzU3so87aSKZI7LITksBXPfGz
         fQ4XYD4SJ6VwBYA8VFMvXvByrLwc6yOsKQJzC/brv9YW8JmP1o7mka10/IR8Bg2awVrl
         AIIBUnEeHVjTXSzlmjbtG22IL3LawyZZcmy6xJ1jtCfBMpmgjG3ILai+5rORdAYWxcT4
         yphopegXOp+NHknL6uOmLe0QaKA3ERRBmL8WiVWL6+NzslA+SD65BHwuowmVXJTNfuHJ
         JT7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=LX1W7xNX;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ifxJFdOEPK4ktpgjAHDwe6bLPN5JuYfjXwVtQaqf+dk=;
        b=TuC/X0MybEaCbCJgvfueJXxw+PJMotRkn5MVx+ncRxBhoK67o5srsFOqDo+yjYRsto
         lRsuJsvpa8VzvfuhCzKufJj3Egytxf5JrYHzFNvICGQTYgMpIx0wG+DDoSdmc/5rwDVX
         Q2ml5S8hHTDpBCaz86p/Bv97aK3qE0Woqb9waSVhXbA+7zf+SqOn/lj81SOcc0s4Fh8v
         J1zkj9Q9fBVSj1tdkk920irhf/sbc8Q0e3f/yoSZnr1eZBRxH7lGed5sumwKiTqbUBdW
         fHtYi9/jPkWFyEZn+BUPRHczxrEsCt3IpWS9fCTm7Y0MbOKlF/cuPed31wF2411s0LwT
         k87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ifxJFdOEPK4ktpgjAHDwe6bLPN5JuYfjXwVtQaqf+dk=;
        b=r1v+F3nqf8vxrunL7DqCElwSdM0+vj5Cz95N2HNzqKgyqa+IYHtxpazn/lIT3bpXjJ
         sfypK/MIwENZ3GFzUP6ev8Q1KFZyVa2URPwMrpPzfYzFHJyu+OI3/V2N9zNvmIrVTOVh
         sB/HG0zjdPho+A6TUGlzL2pjjBnxN6GYhnkYBJpemFsSzpgc/JGpYKmyelgYcHZriv6z
         sIvxCGUNXlfPRz2EvWuKQissbeGuDB5Ms0tdSpTKin3okY7iqzkR18N2jiW5busMnqkx
         hwF5ZwSpWcfXt3YBklufLT7JwWCFsIVl58rHzZB4JNwAJ0PY+G97QzFwVrsebQ11X0nj
         A1FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxWZhzIAjxuQaE7if3ZTiPVM7NB0OwM6fAvC8+u7r+n+I7A6mh
	AevMcwRotoi8wkuZLlsUjCU=
X-Google-Smtp-Source: APXvYqzeKn59xkTIyBexpEZvEe6wXORkv0vGzR0SR5OLC1fDJXP3IhuiGIeASvIhGw3evjjozVABfg==
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr42008051lji.11.1578302590702;
        Mon, 06 Jan 2020 01:23:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:5856:: with SMTP id x22ls4106954ljd.11.gmail; Mon, 06
 Jan 2020 01:23:10 -0800 (PST)
X-Received: by 2002:a2e:9015:: with SMTP id h21mr41861448ljg.69.1578302590054;
        Mon, 06 Jan 2020 01:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578302590; cv=none;
        d=google.com; s=arc-20160816;
        b=wkGUvWMAMsZwR2cG7xjh/j0vSSG+KHVQWvQ0HXZuUYfkK/HgF14SX3n9l4H+KUn+gh
         ZDSBdro3OYigb8sdQdSFTnv5wChpe3du0bjM6gFt7W6EF2A5fJXSCztOHy8RVaQ1d246
         a+FCiIQV1lvwr/n8SDjSK/Odw4HGYkmwODc7aarSCEYLZpMs519zGpzOUjMSthe5ppQC
         qciHpW8fqWEe9YvBbIq1BMXUoQF87O+rbVC54C3Y/8tGd5v+pYDdUV80/n9i5jI+HPAK
         CMgKFUQuIQdPlAVvcEIiHjhP7EXJ0V3xMxHl4ewdpdQGcceV5bDDEfYY6/8Qh3Yps0Vt
         KqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=ONtdUStYC74m+Pa0xh/UdT/mP1vw0T3CoWwB0mEpxyU=;
        b=kBYLmwk9F6Dl1jtowSTVA0QqgVkxtWY8otpVuE7xh5SN9SWsbXhCekDCdu3O+7XqwD
         M9najVpv5IYAhyICbMIoJOfdv08ABU1ASex/WtSMYKu3AR3x9iGuVJFV0e5xegDoiorD
         sMJggsWR9WyaY5RLdpRFQqWbORI2YGvCZ60N7UL25Q/dJVeBfoiSQXnDODFh0AC7eZnW
         OKJCHIHQXeBtDrgj+6bocOUpOHPL1U+Tcpc2QYmax2FUAP5GgJChYPRgPyBHDm60zcHo
         l9k/QOiXsvbuUz0OkVu5+yK4kNJ9m/FSwVVsZK2c+2pg/VVUWPR1FIGegebanFh3XubB
         PA5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=LX1W7xNX;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id h8si2177839ljj.3.2020.01.06.01.23.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 01:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MCqkB-1iwtB81Pql-009kGB for
 <jailhouse-dev@googlegroups.com>; Mon, 06 Jan 2020 10:23:09 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: vtd: Protect against invalid IQT register values
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <57f1f17f-7d30-25d8-45c4-cf10b96930d6@web.de>
Date: Mon, 6 Jan 2020 10:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:E+pELKvKPYZLaQ0Wp1iYAXHrqihWOodi4lZYs/pZ+QgcqafxQkc
 XoLnEY9wxtj6wj3wPeqF0AV0ifXwiR/cThzZ3otM8Flcjmyth/Tb0FYLY9yr8OHwzkxS5hm
 N4hrfXJ39vQNIwOpGXP2yEZutjx3wNB3vDFwDiqiuQ25NjemoNZ3mfxVgpwiAYkdljtidll
 cOBbrrKfA6VB/zyhOX5Hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:40wD36uDv8M=:BVd+W2C5mKTnOiLXkT+do9
 VbO5sm7ywX/qJTwemYRwhPLjkx2vxSP+5UyYHgI5En0NJ4xVhyMEt6jmeDuVgdZS6yT+/Yffq
 AXjya6nMWOdISGo/QBjkv+uALRAcFazCuBStdYO7L46pO3wvgLOZYCyulr46EKdgoD6NfVkNF
 cDUez5+LWUyT+Cu1j55m+JomF6/j40Fb99tbiexo2wJOLov36UX55dd9C4+7cdX9HtNO/5uxg
 M0+R1vHen7bW7SZ0kI13Kt+KSQ/Z5dvInp4ViwddJoGsHUW4QK06W+wop/RYz/NzV8f+vP1fO
 6SGOw6/V907Npl+qeYr2qfMS4PDlxRS9BndaB1ro6f18r8qXTzcEdLTLAYa398k2bo/5Ivi/E
 GeI2dpMN8q8PskUAC8JZXG9A1phDLyHZHg3nE+M9Jo5N4jMbsxFe06iZhTa5NlG6Bf485vlCA
 /3smCjI2YxfwmFzfM9ytJiFsU/EKvQY8irKjwXGZWoo7gEy2PIF9zQMzp0IgdVnVCxMZhJZx5
 /X1nA4jhcAtjQsAAm6oJbyEYerUfHPaIB1t7Gzuf3j0b2HDkDh/+2IxpEcFEjnMEkQs6PpgCG
 fXHppNQ7LfRpkcC7urKwC9vZsL4z+covJd10Ge9YK+GICDqnE50/iC7+H0R0UubiTLpY1/Uzz
 2oWyWMl+5eHekjsTQ4wB2/f/4cBU2eXTqqA6PPRqvbjjyKGXmwvpAzLpSUcdGbLymfSvjeUXW
 v9TdAvfpW9uL5hcu4pRjiC6FG0e8yRmHdGnxUVFBvE3fliCKoyMi/iWgZ9HpeS2bgP/4VaRMB
 dVKWpuYcLUCSPOJXuRXRjjskNVam5iRgGRZ97L4woH0/3KBxXzjoyIWls6IasLeJM4onH5bfo
 RBYCpdZEM4jXG/cyKel1WwP8SMK88qmDJzSm6sZydc7jznFhhPrHEkKOgcn9hUz03wc39EDyi
 /dDANjiUnIk2rLIMl2qU9v63yGeiP+RrZs26E5m3AAX3GAxcUuhPDHN+vlhM4iE8LB/dwW8xm
 BYMsInNtFzWUZ482+VcmIA0c9Tq7PgP4XaSqYLFVR/2feICxokP4uYw99TNrqWs5/b8MqMB2z
 Sa4J+TZ6a3BH5v0Z9FyWe5skuaDnJfx5+mZvAJQbhmd6ud2GFlxju0GyETf+ts/OUditCabd8
 P3+WTbnBf+cSHRrXde7v8swNk2Ncv7Nwd8K43lIqYceKvpKHUR0JWWrwgsjj+nYQSyqLm2qGM
 A/uddjlBeGudmHKxXM9qSCAOm1E2wWS5qez1Qa5NWkUSIrAMZsja2PdHnicM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=LX1W7xNX;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Avoid that we may loop infinitely in case the root cell provides an
invalid IQT with RsvdZ bits set and also all queue entries on the page
valid. While this would only affect the root cell, it's also more
future-proof to ignore the other bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vtd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 8689e509..5ce7025c 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -483,7 +483,8 @@ static enum mmio_result vtd_unit_access_handler(void *arg,
 		return MMIO_HANDLED;
 	}
 	if (mmio->address == VTD_IQT_REG && mmio->is_write) {
-		while (unit->iqh != (mmio->value & ~PAGE_MASK)) {
+		while (unit->iqh !=
+		       (mmio->value & VTD_IQT_QT_MASK & PAGE_OFFS_MASK)) {
 			inv_desc_page =
 				paging_get_guest_pages(NULL, unit->iqa, 1,
 						       PAGE_READONLY_FLAGS);
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/57f1f17f-7d30-25d8-45c4-cf10b96930d6%40web.de.
