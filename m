Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBD4K2HTAKGQEFXJYQYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0F18CD0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 17:19:43 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t16sf2211883wrq.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 08:19:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557415183; cv=pass;
        d=google.com; s=arc-20160816;
        b=XSmM0eE1bgkZtlmH8AVfzWMFHrEaSX3aZPRm0Mat2oQYHXKW1aAwpYaH3ugbZvL6f+
         P4jzzZULjqaiAZJ/19Pl4+VJmzzsOdNMVepK1754X7cOyFNE6Vx4gybNIiVr+WG+t7LV
         4eZcae564Xp0sWU8ut//sqSOtxGsAuIrkv8fwvne35xoKIAgGkEKuaDE3RTTe2M/iAy5
         +gZrF0bzL5UVxTrSoAc6AYy6kAlUAo69DKeLbXfFNOuMZiR4WGjPLFaZSh1rowrNeG2c
         9sCkGtM/mD/XwEBZ4EfoHhGctUrhMNECERwaZ/4eUJEhFfxV/Ajr6YwQngsFD33gcOBW
         ylzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:cc:subject
         :from:to:sender:dkim-signature;
        bh=SCerlKz7a8baYOMd84Tckxjae7d6ON6sDx54X9KVNnY=;
        b=Dr79dMyNAjaBlecWu/U+e+pcc+2qsDHBEuAMcZFCVzqgkzx4LcPAlwDIV+B0UtCqda
         Iw+qlWCcA2seIhw1BaM7N/yRjEZ/mxZ7k523dIjGzLdqfz3ENDL/qbQtaohX6uXfmoIx
         mh+rxoJXpWDSsmv7tS68YIduNMps0zCi1ERIOxlnJUQlA1O05GKOQIxsd1PpS9F9Haie
         Vx90H1t+uLZxs3zvlkF12gVwFYUcN1/oIhSHZCiZy5ZtCLOGLh4MrtXTvICuMbJCMhe3
         EUuBHANyyFXFTKiv2K40jH+EQVFZeRsH2ux/ZUnXFh+s4ZIDrXBRTK8oNpDfuzQXDlbr
         SiFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=h2Q5JW1z;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SCerlKz7a8baYOMd84Tckxjae7d6ON6sDx54X9KVNnY=;
        b=BWkIXPLmNcQWNiSGgQPFgVq7fOZNL2Q3NodrxRYUDv6BKdX6ZSAmzkxYJd+YN560t+
         svP8MR2MOvE4hf+Vyc+EQsGS3NVIkc++qoj3yOJ72y0iO5B6fz46wauZAyltqUh+h0lE
         qO3u5bqF6tz8mlPEbP67U9uIIvFfprC1y6DN+bzizQQyNPTdLzotzawQhhSGugiHZOMs
         qVaVo09UI9y9isTp7A5Y0M6zh8UprdrGipo+EYHtONT4O+jJ7/2nANacByZxYNtFrsV8
         8h++Ie8ugjJgcXAquYuqCTWnJPaPPbCXPG1gfdMDBm8abPgo/DNlMgV8L4qbSk3ugk70
         haVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:cc:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SCerlKz7a8baYOMd84Tckxjae7d6ON6sDx54X9KVNnY=;
        b=fI5DBAjZ2VyaseZMMO6l6BbDZ9csQej8k7P+5hazxOHxKWACTI6/7kgbEVvqt1hzXc
         67ZXtbCyyHzX+KdfavRpm39mloXM8/M6ePqfNzAIN366YNWrs/QF4ZJcr7NgTvrdqJVX
         fTfQizoWFFlMWTqK9UoYSugH3Wax9QctnvQNmub3mUypK/PKvZ/mSZsepOSmEQxr3Yp/
         wet1xr0CK8+s0Ob5JT9aoz32FqeQTDZTbB/a/nFjzsdTZcBfOG4sYHECIbH25XIqdHNq
         W5tOGVmsAJ0nRDICz3DdXKix2ZRGB1LOrmkpaYpQ5KWcJuWMU23XPqtVLMGkc9c7VG9P
         bb6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUiSwfB3RXGx5871EE/viX5epX9W3ZPwA0Rk+rpQWzSkjrm6B8t
	kEf9rJEmNoLB5u8Ucir7b7Q=
X-Google-Smtp-Source: APXvYqxbJ4WFjIiTei2QN/oK+FIZXVXg7dHF6N1IgXpEVmBVqFomKoEwAiOsPhTfyfeQVt4SU3MT7g==
X-Received: by 2002:adf:d4c8:: with SMTP id w8mr3875199wrk.2.1557415183575;
        Thu, 09 May 2019 08:19:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9f09:: with SMTP id l9ls650064wrf.15.gmail; Thu, 09 May
 2019 08:19:42 -0700 (PDT)
X-Received: by 2002:adf:edc5:: with SMTP id v5mr3804322wro.257.1557415182785;
        Thu, 09 May 2019 08:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557415182; cv=none;
        d=google.com; s=arc-20160816;
        b=FYk7Y5mnxy0sloaf3k8/URpuKyBF31FHwEtry2QuyLhYhFX8x0hIAMrTM2iIuAOkBO
         QxzJjF4eMVNbUqASDxDak0CI3QzPi9BXnXlufvuYd+QAitPOsPqqWTbA+zEH4HX+XiKB
         AnwJs5mrwRXXnx5T1V7eTHD14eBsq1kebbQHjJx7nA9PS0GvcLDZwRp98umvBwj0dSvC
         ycuM1GFExmMJxmvmHGNdpqjILgQi8w3s/wzicbS5VKFEzzp+6KPW0NFloOsUdSFLIwUZ
         KXej2OMjBw2svO2Uzi/+ET+XaUYjryMEbNhkuP4dtXI7dWmYz/IIPR4ZjRJFI7L7MJC7
         72Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:subject:from:to:dkim-signature;
        bh=bilPMmvewzs/KDcoD9m1OYz7yQ/wXFc/ZeSpqob748Y=;
        b=iAB+1P21d+QQxsvVogpMq3BnlxBSFJR0aDdYJbae/HZQxXPFdb6QjJfVJlZULeGe5P
         +als5Ge1sruhun+7kdl3y6E2B4e6srlAmvbmu91F0AIejAUAVPWA1CsUXqieCgWG6y5F
         jKVeNiG0ydgYzF6juXqMX33oIeDGo3rIpi6ceop+D8XE6HBh7N1AoH3YmeWAP1PlRw9I
         EbBepuL3OrFVwJ6w+lzRDUgGiy5SEEXYN4wlN3o25VLP2o1RQR1s50hCqN3Tn91VUfTe
         GFghhZa+ccgo0NFOanTzTzTAb1j6C1xbBAU8l6oaVxB4Z5D0aXO2OisV6VkAUV9eGsTw
         8NSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=h2Q5JW1z;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id f188si462507wme.0.2019.05.09.08.19.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 08:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 450H7y2s4Yzy4H
	for <jailhouse-dev@googlegroups.com>; Thu,  9 May 2019 17:19:42 +0200 (CEST)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 May 2019
 17:19:42 +0200
To: <jailhouse-dev@googlegroups.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: Running apic-demo trapfree without x2APIC
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <e5d2b706-ca42-9d07-3093-eb9ec547bf1c@st.oth-regensburg.de>
Date: Thu, 9 May 2019 17:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=h2Q5JW1z;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hello everyone,

while working on Jailhouse to run on AMD Ryzen without obstacles, we=20
observed high jitter (>1000 =C2=B5s; 40 MSR_OTHER traps/sec) with the=20
apic-demo. Our target comes with an AMD AVIC and does not implement=20
x2APIC or tsc_deadline.

The timer implementation in the inmate library will use x2APIC access=20
methods which will be translated by JH into native xAPIC access.

If we switch to native xAPIC access in apic-demo, would it still need=20
hypervisor interception?

Also how far is AVIC from being usable?

Thanks,
Andrej Utz


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e5d2b706-ca42-9d07-3093-eb9ec547bf1c%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
