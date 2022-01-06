Return-Path: <jailhouse-dev+bncBCNYJDE55YMBB4XC3SHAMGQENEARLLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id D1995486971
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jan 2022 19:14:10 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id e21-20020adf9bd5000000b001a472da8091sf1443565wrc.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jan 2022 10:14:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641492850; cv=pass;
        d=google.com; s=arc-20160816;
        b=KGhpjyGzNEtMSsF1kdFkCm5uFMrEPPq+FIWX2xz7Ayp1hCVwTnVtts2Z1L0UmmUs70
         Wexz8YiVpxomDtFcUNcnVOeZjIY0eDv6BRO7ojQZEbhKbR+vHPW9hpCnN9UPHf/p/MY8
         Q2dSpwhN9GweiqmLFNWSxAjLvKdTBdcq+QdKxBevpzP+Wh9T+rwwSxDhbGLP86BSE9et
         EPZhtNVh99lXbEk7OeNp/8U9L8f3RrxSLp3tF0cijKBK4xZthSrhxAReLGa+ploY1uxl
         MQvynXBl8UfsFkLsuNBZn8Toj0j+ndQ2+T7ieexvae9kZy4AWXijb53Yvi7w9Mmo2vfG
         ezGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=bJ6ZZro1kvrWVLTgRnloqU/144pCK4BN/tUfQeSy17k=;
        b=IEzD0JR5QHsWk0/SeCZnDAY6zt9AlW+sPD6Itm/jFVhVAmWjO8EaZN6xdPDENX8QFu
         KeO7Bzhvxx7/FKm0DbrxEt9NTVY5phKSn3XlNCb7ldmjmIuvqBjKDRzeFsNBBxPjnsJC
         kgHNaBj0G+soXNoIxO8zqSR2QVGBm+o2dz5UvsrtMxNb6KXQkMko12/rJ1ZAkub4Y8RJ
         eCZRN8/5g7+dfTzp7UxXa2udImWng+IAsJ367hnRq/S5+BpnDM4qQqdZT50YDrXp8xRx
         qHfHfLYaGTWVb+CEcTiT61PCVQYLCWUysO7B6Zkd+clYgvP8zes51JXHjakk6qBqUrtc
         sAWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dwns0eDs;
       spf=pass (google.com: domain of j06217505@gmail.com designates 2a00:1450:4864:20::12a as permitted sender) smtp.mailfrom=j06217505@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bJ6ZZro1kvrWVLTgRnloqU/144pCK4BN/tUfQeSy17k=;
        b=ZaZwzOqp5s43JW+qh+3ltiiyjUWNlsH2PqFVlfF2bbeBBMoIeVvDGOsr5XtiwVcepW
         9QrZ372NalU8AUnjvlZKe0prCj1Bp3jAbwQ1liqNPUr+l1bgNs06SKP5wm7dq4GGpYSs
         9SUYUV3YcqXXpJ3hEIga0aDbI4hwdEL5H6QXGMU5K//AKhUYr1CA5OVLOVfqaqn/S/I6
         xmgHtX5Y1cNqiUsuGmyqu23JqHf1qza1/+KcWBOCJldlAYObBf4gca3RKjwHKxCYbWHo
         FCmIdUVu3TYJg0jCABJLvYKgErqaR6Jo0McFXhfAYZfxYfoH1AAeX2QWso+ZQdHx5Iyj
         6NQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bJ6ZZro1kvrWVLTgRnloqU/144pCK4BN/tUfQeSy17k=;
        b=k1tqxb0elcDk2r/ZXjuZjqW/P7qTZBrYqyGdH1jv12vH2x5qNogncR+jSJqQhVDo90
         OKBh4KD2siBufbeXfJE7/lo1Itny2gUni6fOc9H2faWiLYQ1VX9hqGUIy2AtmGkOH9k0
         1HskBYqMSZC/4+KFHIXjqLqIn3TlaYF2S3P48ouR3VOZnfFt7k++uEz4QLCIu8Fljk4I
         JVvMsbjTzzbQ6qXlkyHKf0Mil9r+KLQy3jSmdFkl7P5mGW+/4lU1H8YkrQDhg5ssFt64
         nYLPEtBwwt7hPSFRgXmKUIgPftwTPfJEUZ0ffYOkBXaeLBdKnXI3v/cDCpCe/sCq9RzE
         F7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bJ6ZZro1kvrWVLTgRnloqU/144pCK4BN/tUfQeSy17k=;
        b=Qcr0KHWcF4pN0tbefYUKYFt+laL1nfkSyZwPggIoDq7kSPB3BOFQf8YWIJ0kAsxKoV
         +ZeNoFyC9PCqIjTcVxjUJvi9dtxDKY4ClF+F8bCTHqPZVc2FoYZOclsct4mJM5s+8PUi
         VtLcsj302x6d7eeXSlMK7StyoeW7LGrNLP5O/MF9YJpTBej07bPh4EhMfoifNUxaE24j
         T9HXDS2yf2Ig41Nyh8ZvTukfFU7Y9XVDB1vjXjRDunaXDgj+rL6MVJg7SoGtv0292ujE
         wStGrY+1oqz45Id19x2XT+PMx1qk7bvL+ptV0K4peOAyMWypve+Svi6+LQDxo188PTIx
         spMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J5To6u0U2jW5/dATq1zQPwFnx0gqqp2IA/oQfY8tvgpfdYka3
	0WYH2hsAapBMwf8Fe9cSWOs=
X-Google-Smtp-Source: ABdhPJzZ5ArpVo1AI5OSVnM2r0kZHvkLfCOuOuyXLATDiWWFk7R0Fn+qEtqt0ZQ04QEhSSL1vZxrYA==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr53184296wri.566.1641492850489;
        Thu, 06 Jan 2022 10:14:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c27:: with SMTP id j39ls1098239wms.2.gmail; Thu,
 06 Jan 2022 10:14:09 -0800 (PST)
X-Received: by 2002:a1c:f205:: with SMTP id s5mr8180092wmc.33.1641492849428;
        Thu, 06 Jan 2022 10:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641492849; cv=none;
        d=google.com; s=arc-20160816;
        b=mhk8j8zgrB+EJSPIFVNBmKz6zhzooVQ5/58XykHD9aRyZL4P+gfSuHcPH+GCv9sDNg
         Z6UOAdD5rlcLn+cBjS9rweZCd05wVnIVgFvNTJtSkVJFyPZTM81y+QSaMUHAlSoh3W8/
         1gYvNDWKvLQULXQ/kIYxAp7vgMOa6LZAuW5vgdT+I4lacTVxaWhsNFkET7rz+qedNviG
         Q4i/1YAj3hCdreTow8nlxDL/xPCuTey6dcfZM626r/GImpnVKsFD7NxFxtrAa9JwuHgr
         sCpzR+1MpzwPHahv9+bm1Mp3jHVtx6q/dLrqR7MmXTnzBp8M+fwNTFv1mRdXfHsONPQN
         YFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fTQ4UiMGcoCDaHmhQtr6Oh4iovKc0f8av97bAhvDmLI=;
        b=mN0hJVqxmkEl+PJBdG11AbzKy+UvkY3xSp9vpPISR/fOm9YRFIRPsTT540z+JoD4iL
         QPAifUySEz0bWL49ee8OHNmpmpFDC9Uw+VG7IPifui0mLSONGkQ6B5hDgExK5DOqgbLx
         r6QQB2p6+ZcAYZlroQaCQJiBPWzPPJCBD2JvlzTpCZqmbEOJ54idC12RqxQyxS1t+rN0
         CEw96iyghoIczI5/HXz0ZZbWOqNE39ddija/1sJ7dEXayDLhR19KkuzKsPQwxrQn9lB4
         ZB5WMmL4vuOBhmjvfy4o4/AbrKC+8EHSgLYf0W44yeWdeM/raFQPTdhfcjziYGRIEtIm
         4/MQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dwns0eDs;
       spf=pass (google.com: domain of j06217505@gmail.com designates 2a00:1450:4864:20::12a as permitted sender) smtp.mailfrom=j06217505@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com. [2a00:1450:4864:20::12a])
        by gmr-mx.google.com with ESMTPS id e5si167035wrj.8.2022.01.06.10.14.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 10:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of j06217505@gmail.com designates 2a00:1450:4864:20::12a as permitted sender) client-ip=2a00:1450:4864:20::12a;
Received: by mail-lf1-x12a.google.com with SMTP id x6so6710895lfa.5
        for <jailhouse-dev@googlegroups.com>; Thu, 06 Jan 2022 10:14:09 -0800 (PST)
X-Received: by 2002:a05:6512:3b26:: with SMTP id f38mr54736422lfv.374.1641492848980;
 Thu, 06 Jan 2022 10:14:08 -0800 (PST)
MIME-Version: 1.0
From: yacine  8447904 <yacinebeker88@gmail.com>
Date: Thu, 6 Jan 2022 19:13:57 +0100
Message-ID: <CA+QAkA_Z9=ZkvjsMpoTqNOf_cni+gzNtcpTufat+x44ym2G5tw@mail.gmail.com>
Subject: hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002a38c405d4edd60e"
X-Original-Sender: yacinebeker88@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Dwns0eDs;       spf=pass
 (google.com: domain of j06217505@gmail.com designates 2a00:1450:4864:20::12a
 as permitted sender) smtp.mailfrom=j06217505@gmail.com;       dmarc=pass
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

--0000000000002a38c405d4edd60e
Content-Type: text/plain; charset="UTF-8"

My name is yacine can i talk to you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BQAkA_Z9%3DZkvjsMpoTqNOf_cni%2BgzNtcpTufat%2Bx44ym2G5tw%40mail.gmail.com.

--0000000000002a38c405d4edd60e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">My name is yaci=
ne can i talk to you<br></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2BQAkA_Z9%3DZkvjsMpoTqNOf_cni%2BgzNtcpTufat%2Bx=
44ym2G5tw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CA%2BQAkA_Z9%3DZkvjsMpoTqNOf_cni%2B=
gzNtcpTufat%2Bx44ym2G5tw%40mail.gmail.com</a>.<br />

--0000000000002a38c405d4edd60e--
