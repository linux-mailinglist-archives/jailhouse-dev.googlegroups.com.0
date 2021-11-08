Return-Path: <jailhouse-dev+bncBDB35KMNSQMBBBFEUOGAMGQEKXD52HQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B4984447AE7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Nov 2021 08:30:13 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id s18-20020ac25c52000000b004016bab6a12sf5990950lfp.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Nov 2021 23:30:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636356613; cv=pass;
        d=google.com; s=arc-20160816;
        b=fyXQDQq7EsvBtNXfAatJliERmfKY9jh9BXlJcGfcIvqae8HKdkTh5a6ruQ8yQ2FSsY
         IkxAZj++3aIINaLed9IOGXQ3NvWG1+1lteVjgbQkfoUckNAAlTxhx8aPijukO7zACGab
         b6MgvVWKd+ylypEukSt1PVKN788QbuHjihjAGyltWCotSeuxPnhAgLA0zeVWMSUxzJWk
         E+bNfvIXhh3GihOgU7a2mENfnqa1dle/qCGkJL5zw6wZIeqcOSaFEVyZDizwUyJcSnBk
         MUm7KLZzk6x8FYZDxThAquIfgLqKxUR0ENVGqf9nHYiNUPWT80hryzuUFgLPNzm4iHdC
         PiBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=Si8N7l3AgEYYz+jatoJztUJBS0q1jgtOqDaTAjRn0xk=;
        b=vJL8BDi9LvFO8mF7rgoSpqmXkMpARV6CT5h1FWb7C/9xlMYMfQfqgUMbCqnsxBTFGJ
         d5Zlp5141m0ahq6Xt6kmqJeurHvIRd2rpBjYCHF7iBytDM7mveGcrDw67blrkMreIlfQ
         b7lp0ZvjLaXlm7CSfUA53h5aQvZ1mavBGzA+HP3af5uOLgWSz6e97/qQjh8SndbM2Ff6
         awZ3YLrLBqVvIjvVk1N6IwHndSUueSZLasusfLc0OMyTKysolvg0r+05sxb9sq0onnYd
         8Ds6cDlAFlfSZnKltTjYphPWeF8dBg1ZthsMWVoC9nkKHAU6aXeSuWztkR6BKT3sp6Tf
         Q53Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o+4nzd6S;
       spf=pass (google.com: domain of ziskoraa@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) smtp.mailfrom=ziskoraa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Si8N7l3AgEYYz+jatoJztUJBS0q1jgtOqDaTAjRn0xk=;
        b=CNLWnRC8QCEn1wGgm4uG6Fr7sIKwGYNgSAPlrC+mk/4av/qqq/vDdACkW+eheASvEI
         mWkOY8Earn+P9KFy0daEsbRM+gqpNKnWz2QkUWSasc4yNgveaaLUYSAHSFO5sBZVIWk2
         0Gd9o/NPNWb4Z2YKqjhkvspE9fd+21zUieJMaplDQrbpuY3B/zU1SqxjwiBhJqbrrJA/
         9kvRDDvCP+Cdk5VDftTivr+nt4uI/v1p3MPeZuakAxhdjC6dwYJWCFUqF3YaKbT889nh
         i9CTit0y3u0KF+yiqr6peTDShX5rTck3ZfKC2bDjirSITw96OC34YI0h9KTJq/L4g5HE
         rXtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Si8N7l3AgEYYz+jatoJztUJBS0q1jgtOqDaTAjRn0xk=;
        b=UEnS/HDrswqGfmlqnyUDiz+IOX3VWQv9sojdc22TRc/7wmGgYsu9Syb5N1R+IrD61u
         vlSpMucQhradxYD/vBWJoghKSQWFFwhDGTNmHFXjzR/U4nsoW/LX+0s2+drFz3VIb81P
         9dpCG5q9Q/cEitN+JW/QPxPKg5Y49JTljbDNZwpb4lVbB/3ipb5ef2yq+CZs1u4RLbnv
         lkiAimvGMSlFGlQGdnej3xI05HMRBw4TqgrVoTJTrJce5yInx/In5XI2Z58HIuhCFldz
         Stq2bXzn4OlljacwaGWwotitG5CF4I76fLEOirjErcX9+Wmrl+Vn/wjrccmrfOXQw735
         osyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Si8N7l3AgEYYz+jatoJztUJBS0q1jgtOqDaTAjRn0xk=;
        b=WBeVP5On/f/tfRlKJc3jlRvKkcCGBp5EJvs0RiyTmJ+sGFvAvM6wy5xnE2wnyqysOV
         GLFmQo/QRrH7Grb8kQXjvoWxxZHa28eQKP4Gu3GjZxD/92xnHR8f70yCl7kMDhpm84Ve
         2+WKjkS96Mc3QNXxkcNWSgstdGsodSR7UucCjP9Ynnf5VEXpQ9TXDTOKiTAwT8fIWY9d
         JHSY2j1jWqI4x77sGtFE+4GyELI6fWU9iZlHcZGVBZvy6TZ350AeG7L5nfeNk2aHAuXT
         JbqAHlXjzQIEVFU+6dxvVD6NVaNBZBWzVnKxn4d8BtTfyNZOR7OeyHlCaFuuK4dOvxSm
         yEig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532S3pWMDBDEjLpkdV0vEnXw9yRC3up9zJBDrjTe95whcFeTfVj4
	NeuGdmiZtYcBxkykdfXjr7Y=
X-Google-Smtp-Source: ABdhPJzrjROldckPBMUwALNR8HPiSvkgbxGv6yul1joR+05XBCrVJQFEfNR2ULLV57J9k6hcju6u8Q==
X-Received: by 2002:a05:651c:1250:: with SMTP id h16mr15937266ljh.324.1636356613300;
        Sun, 07 Nov 2021 23:30:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:31d4:: with SMTP id j20ls174489lfe.2.gmail; Sun, 07
 Nov 2021 23:30:12 -0800 (PST)
X-Received: by 2002:a05:6512:1296:: with SMTP id u22mr2289865lfs.92.1636356612198;
        Sun, 07 Nov 2021 23:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636356612; cv=none;
        d=google.com; s=arc-20160816;
        b=gxZfFhLLd6diicpaqAh0X0ii3gYvT7/wHcg1+fkAaNGxtopre3O9W/cACdtcD5mqud
         XH7RYqVglq/n3DNUSKJryRESfRyNOSt9k1R7cK2bni9lZ5LeHxf4jYwKIArRUPITNKNV
         b6XzFDPfy/QLzAEaHhk63bzrIWPyhBkWmaE0PCLNbw2ppZgenvMUHwLCVqP2YsGmnuFU
         2e7agf4pJfHuF17ITCZWk06jNdoUVc/dT7kLnAgssNpqIJjrvwoNARMAcY8oUgzl8NN0
         LUXC4SEbpWZRpdonP/gxRmclkdMfd1YivHgA99myT9ecQG/DWSUTFa/OAYg87UGV+/6l
         IRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=gS+G2bXPLTc8QV9oSOsVFPfildfSifO+gabOlUjPn+8=;
        b=jWyWD43mORRhhF/cF5LNlBp6PEMTefl923WEwamIJEno7dyxbv7yyGHq6eyt6wJ0Oj
         KuXzcIHfix5Uw4OCNieQko5CgWHBhNuxx/qjvzAY06jVKV0Unyjg3uvYEnfFGBJHj/TN
         9o8dqsSitzfzSAtuiH3JL8RYhfUTQ5aJvJOlW3ynijiiY/i6OZbTeMIzoV79B5ohsYyn
         r15mftNI1D2FXHCVYGhkta4dGHWGvziYWvC38uRprX+bJMoZ9fNSrKOmotu64vVR4RWF
         qxtS2Q5Ww3HkjJFqn4KjIcC7p5EweaEyEjWvTfXDxqFZOvtpFYzfs2ADtZWmTvldcva9
         wGAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o+4nzd6S;
       spf=pass (google.com: domain of ziskoraa@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) smtp.mailfrom=ziskoraa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com. [2a00:1450:4864:20::52e])
        by gmr-mx.google.com with ESMTPS id o22si548943lfr.11.2021.11.07.23.30.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 23:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of ziskoraa@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) client-ip=2a00:1450:4864:20::52e;
Received: by mail-ed1-x52e.google.com with SMTP id x15so27378147edv.1
        for <jailhouse-dev@googlegroups.com>; Sun, 07 Nov 2021 23:30:12 -0800 (PST)
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr35845675ejb.377.1636356612019;
 Sun, 07 Nov 2021 23:30:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a50:2501:0:0:0:0:0 with HTTP; Sun, 7 Nov 2021 23:30:11 -0800 (PST)
Reply-To: mariaschaefler@gmx.com
From: Maria Schaefler <ziskoraa@gmail.com>
Date: Mon, 8 Nov 2021 07:30:11 +0000
Message-ID: <CAJh0FjhcRBunSyXkcFFTw1ty7wS5F8sAS-GTNbzQc0AXaSJn+A@mail.gmail.com>
Subject: MY HEART CHOOSE YOU.
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: ziskoraa@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=o+4nzd6S;       spf=pass
 (google.com: domain of ziskoraa@gmail.com designates 2a00:1450:4864:20::52e
 as permitted sender) smtp.mailfrom=ziskoraa@gmail.com;       dmarc=pass
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

Given my current state of health, I have decided to donate what I
inherited from my late husband to you to help the poor and needy. I am
Mrs Maria Schaefler,a 57years old dying woman. I was diagnosed for
cancer about 2 years ago and I have few months to live according to
medical experts. Email me for my directives

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAJh0FjhcRBunSyXkcFFTw1ty7wS5F8sAS-GTNbzQc0AXaSJn%2BA%40mail.gmail.com.
