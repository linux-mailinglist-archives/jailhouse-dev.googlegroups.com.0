Return-Path: <jailhouse-dev+bncBCL37QNOSUORBTMZQSNQMGQEVQFQZGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3d.google.com (mail-vk1-xa3d.google.com [IPv6:2607:f8b0:4864:20::a3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51D614A56
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Nov 2022 13:10:56 +0100 (CET)
Received: by mail-vk1-xa3d.google.com with SMTP id p144-20020a1f2996000000b003b59c25ff64sf2758667vkp.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Nov 2022 05:10:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1667304655; cv=pass;
        d=google.com; s=arc-20160816;
        b=n8TW+Vy+0v8E+Vp5WIH29+8JaEK5Tx30hCZtr90YajFoNZ4/egyku8dIVZT/Y9U0J7
         +szkA4svY4w5RDM7QVVs0Gij0yE3yJd224z4VbbKB2i+N0BgxEvHu3WY6UDoKbuiV4Mg
         kGVLKLn5WNPY9tqrByiJRcTRzh3WvKwNSJlTiSnRlCuOGRPDEO57yIV2fmCgQNuoNecI
         m6RPjelPJ8lZmGb+8VOBMZW+DmKHp1QuJ/vS2kUWe5QwXIRQCv5eKd9eSjxT3ZliSw8t
         SsJ0o8H7NfYaFwp4uVTtN8rhum/VjuM7oB8x+9Us3V7nCMevp/joUDZWCVfEjjEEZ+pP
         bfIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=phhCtB+OpmLzbDwilc1O6U8C5Bz7z7P0D3hK+c8L+G0=;
        b=0PqtoVu0o3ePR6O9HwUNElvhHYyjaSCrHZvHRjPPAIUsfnbCroX+lJ6aZE7BC9tI2E
         DS/ThN0YMLyyRXVHet7jEvVPnzfodgug4/txgsDPMLGNTryaBGrIu4EbxDMIhF8Lgyns
         p7OK3z3n0bNDWDJ3CcNThonfz0unZTOkfQp4Sx54+NBUsrAHLIbTvnicfnTvndwbJ8m+
         E3FPK5udcJECnT3gqpLfixAsgCU9+RqWXRdM/YAOauhWhbpyaWjlEnG5SkVSMM+g9Vnv
         MYQSr+EkDeovzY/xKoNUIlU6o0TyATLSCa8LPB3zL0zGN9NvKrUkXxlckqBjCbQmCa0V
         OdWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=IpZoTDvw;
       spf=pass (google.com: domain of jjosemaverick@gmail.com designates 2607:f8b0:4864:20::62e as permitted sender) smtp.mailfrom=jjosemaverick@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=phhCtB+OpmLzbDwilc1O6U8C5Bz7z7P0D3hK+c8L+G0=;
        b=rXTxToyBEdvLxNfE2ekX1IgwzMJS0M/0Pe2gQ5S05zbsahh9Ciumch78Xuo70HlfVj
         +bBSj9vaW8S/QAN333acN8iPcRzc6JZl09/IyD1yZIt7D/CPZbs3WJR32rZU9TQep79v
         6X73fUQbh5AUGeM7E2B7bQDCoDDLQsCRviXeZ4RtuNEUquAJ1vcgKfU+aX701SvqJu+/
         CkZS0FY7bPVk6nbun0w/sPX5z0/cT7WxvxC8rq9oFYuSB1JNO9Vi1RDGx1fFLkeKya2F
         ddCFtCaoiwYPAzLmpwJQ0SUQIe8JkJY4ysvryHv7zg4NVTrIfmLMLeA5grFuDbjho2OD
         a5gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phhCtB+OpmLzbDwilc1O6U8C5Bz7z7P0D3hK+c8L+G0=;
        b=A8/OjAR7fXhKbUhGpQ/T1RqlF3FVEzap5T6nG2CoAGhi1oBQYVtlSFyz8vm+0JEaG4
         SEHM6UZTsVyv9JdgId8KvEFrVsWWejEKbduXIjsIHCQJLAoA/wjOMQCl4C+mE61wOtF5
         9a3lyFl7EWq9OD/KcJ5+RsSSAXDG6TKCKYtVeLRKgCbdPyfZSrW0ngwAVTf7nMjTpQTX
         pXt3A386xwMno6S4tsz1VAoaT2t2X9J1xTt2t2FwkgB76TeM2qkzLwL1W/nc5KSYDTTQ
         C5f2BfOfVNWXwWeU+PVCgqjGrfO5KiImg2x2LKuL3UDwzjlLgjOJWz3GqRGX7vwDi6lA
         K5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phhCtB+OpmLzbDwilc1O6U8C5Bz7z7P0D3hK+c8L+G0=;
        b=gsWwcHn+LlB1/Lwq1xgnwrbmAPs6YRQI+r2qglNGyDHKPA8UEW1R7jNjRuaE/VkLRP
         htK2xTtpW5qOz+sbNdnMFDmqDNUClf71i0UP7mdoPdrBumwTp5gA/4nRzIFdiLVR08ap
         KOpLitxFrONHplAIdxdPNl5BKvh2QJz3i/CKh4719nJsMRHBkBlOyMqDVkWI5/gKeNKC
         tv5bd5m03mh2F41263oc+PMbWybpqztNaCUKKChvzJQftfFTrjm1EXyPufkISbMgQinR
         KiJgfd+G2ssg+SQAuvQZWE8VNge6SW/GobOchit7qTdxK1amjI2+mF0vCw/TYGUKB5L8
         lbRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0JxJM2MOdJVrBigsMeXOlTKXFfXl4OMulNtVRDkKH1C6td9NrK
	b3HoEDOg77OVlQjBrTHv94M=
X-Google-Smtp-Source: AMsMyM65Bm/AlxjbKdqgwjSon0sB/0P1BJ7eDWiVlMa+SYV4u5IAIOSMo/PSp2yzTXL0GcoVQYg6Gw==
X-Received: by 2002:a05:6122:6b2:b0:3b7:65cc:8ebc with SMTP id r18-20020a05612206b200b003b765cc8ebcmr1091740vkq.5.1667304654293;
        Tue, 01 Nov 2022 05:10:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:2fd8:0:b0:3aa:886a:3a0 with SMTP id v207-20020a1f2fd8000000b003aa886a03a0ls1272367vkv.0.-pod-prod-gmail;
 Tue, 01 Nov 2022 05:10:53 -0700 (PDT)
X-Received: by 2002:a1f:a6d8:0:b0:3aa:65aa:a0d3 with SMTP id p207-20020a1fa6d8000000b003aa65aaa0d3mr7298292vke.14.1667304653212;
        Tue, 01 Nov 2022 05:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667304653; cv=none;
        d=google.com; s=arc-20160816;
        b=j2n20/HGVmfdVhtAx+IFS+NCH2ihTq7x29YEN+BCKp42tYu/tpyWLAC5gwvRLYEYhK
         Rf+oeUMjkS5wriUJDwzj/Jed/MP1oAhhvbW3PybM9IfpOJJOB7qN9yrMzNOdrGCvFTpY
         ytrPe/17i/HJk8ce8KUa2Tb1f6I+4tsl50xyam1SPDB3E+AcyBPiFQ2s+y4dVz4iC435
         AgzOjsAhoh5S6gZGHzTu9ymqriV1aQELmTrxhGriwINsw+i2eRKjbINW5pY9mK1C84Qn
         e05mZDk0NcmB1RElMbY5Nklno8XwpRvfM00fzrRq2mvhC4brH9Wv/tH3vS2gof+5aP2Q
         QJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=D4jV2DarlRM3PUUI4Q8k7E6mU6+2O0JTL/nA8YozfFQ=;
        b=UpKhA6aT8OXxxeY8rF15QPVATP9uy2Bs3BRiC8Rd73U3R06dHf1D7R9CJqfMqiwDR+
         Bs5QzvZy5c2p/A1derW09/8Xwl/Hvw5ItiORbO6591FLZUCGXiiEZ0UebEmA48RKnIgt
         QKS83t0A4XavYokisBlaSeQiP1yMkFRnFDMyFRigNo0RJC6CzwR7D8QHF9s7p7h2KR57
         uyEeHjqT7URgFlBhmzNlpltDJ55Sir19NZ4cYArJ678IL2eflgURiudAFdhPwHZbmrLO
         xTQV95shmQT25nP4d940Z1EQEMMseX/2SrdU1SPLoY6zHfz+9Xqip8Gi5ZOpW3wQIW8y
         BaeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=IpZoTDvw;
       spf=pass (google.com: domain of jjosemaverick@gmail.com designates 2607:f8b0:4864:20::62e as permitted sender) smtp.mailfrom=jjosemaverick@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com. [2607:f8b0:4864:20::62e])
        by gmr-mx.google.com with ESMTPS id 197-20020a1f18ce000000b003b84561b5c1si231118vky.2.2022.11.01.05.10.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 05:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jjosemaverick@gmail.com designates 2607:f8b0:4864:20::62e as permitted sender) client-ip=2607:f8b0:4864:20::62e;
Received: by mail-pl1-x62e.google.com with SMTP id c2so13351349plz.11
        for <jailhouse-dev@googlegroups.com>; Tue, 01 Nov 2022 05:10:53 -0700 (PDT)
X-Received: by 2002:a17:90a:7d13:b0:211:b993:8319 with SMTP id
 g19-20020a17090a7d1300b00211b9938319mr37981114pjl.139.1667304652368; Tue, 01
 Nov 2022 05:10:52 -0700 (PDT)
MIME-Version: 1.0
From: Nikolas Samson <jjosemaverick@gmail.com>
Date: Tue, 1 Nov 2022 12:10:40 +0000
Message-ID: <CAAXvvys73H=J7TVe_Mczvmfe9ujTmVDx=VKuXnsAQ6eMPvWdTw@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000089716a05ec679d03"
X-Original-Sender: jjosemaverick@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=IpZoTDvw;       spf=pass
 (google.com: domain of jjosemaverick@gmail.com designates 2607:f8b0:4864:20::62e
 as permitted sender) smtp.mailfrom=jjosemaverick@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000089716a05ec679d03
Content-Type: text/plain; charset="UTF-8"

*Hello, please I have some important issue to discuss with you; there is an
urgent situation which I would want you to collaborate with me*



*Please get back to me as quickly as possible*

*Thanks.*

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAAXvvys73H%3DJ7TVe_Mczvmfe9ujTmVDx%3DVKuXnsAQ6eMPvWdTw%40mail.gmail.com.

--00000000000089716a05ec679d03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:12pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b>=
<i><span style=3D"font-size:14pt">Hello, please=C2=A0I have some important
issue to discuss with you; there is an urgent situation which I would want =
you
to=C2=A0collaborate with me</span></i></b><i><span style=3D"font-family:Cal=
ibri,&quot;sans-serif&quot;"></span></i></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;font=
-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><i><span style=3D=
"font-size:14pt">=C2=A0</span></i></b><i><span style=3D"font-family:Calibri=
,&quot;sans-serif&quot;"></span></i></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;font=
-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><i><span style=3D=
"font-size:14pt">Please get back to me as quickly as
possible</span></i></b><i><span style=3D"font-family:Calibri,&quot;sans-ser=
if&quot;"></span></i></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:12pt;font=
-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><i><span style=3D=
"font-size:14pt">Thanks.</span></i></b></p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAAXvvys73H%3DJ7TVe_Mczvmfe9ujTmVDx%3DVKuXnsAQ6eMP=
vWdTw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAAXvvys73H%3DJ7TVe_Mczvmfe9ujTmVDx%3DV=
KuXnsAQ6eMPvWdTw%40mail.gmail.com</a>.<br />

--00000000000089716a05ec679d03--
