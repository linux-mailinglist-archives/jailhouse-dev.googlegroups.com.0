Return-Path: <jailhouse-dev+bncBCQJLJ72Y4FRBMUXSGIQMGQESEOA3RQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98B4CE960
	for <lists+jailhouse-dev@lfdr.de>; Sun,  6 Mar 2022 06:50:43 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id t17-20020a05620a035100b0060df15e2977sf8853877qkm.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 05 Mar 2022 21:50:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646545842; cv=pass;
        d=google.com; s=arc-20160816;
        b=eMlHGfvj2VOdxRn/pmiT+eINmn70P+C8pjeO1vmIzEuDG3YDFOulbyxbbx8b1IXo1r
         hjX/Aetx9vH4/LCE1r/fUgzh8MnRnxauRXU31TIDZqAgCNa/0UhJYdKzVPVyHDEiK+C5
         fgU1ACmJL6gOyiK/d1JvqMdocHNRgtoFJdu+MtQ0oH199a+xGP0MLCGnnNdjH9GIozei
         BDH8d4SlrFi/iMNzRq5TBwt2SlCI9CshS+LkNTEJEgFYzE4pga6wVk0TiduA4Zb2RwQJ
         7r55H7O5qOQRXIrtzqLlRqxCJOpleUzTHLJRnabaVHqVsg9W8Ojr9brOro9vFtibzR4U
         Q3Sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :sender:mime-version:dkim-signature;
        bh=CAqB2I6Yf0F52kzm3n//Eq0X3xsWLynd2OuyM2wSEbs=;
        b=wTthzyGGeKbMNg1NRRZaf9S9uVZSj2RKnEmrPhpNl9DYzWupGWa8o8PviMu/vnhC8w
         AwRzCqpK1psCc9qHRu5uBknjkp4joZWJD8/SKCrzZLi8/HOmXtBhCw3BtFV0S70+011f
         2XsnL9kHmnqWiDdfolWEbqV7hnykoTaKxgxpqfJQ8oxH8mnf7jvwLwZYZci3bSBPA6ma
         9w4YuGXHvVtfJoEzQbWLa12PY5xYuNUgur52NqKOR6lq3CgWVqBSIraD/MUgUkFPhpMG
         uB7M8Fd8mdpcdQLw4cm2drHlaL/DSvmEzC/J1lG4iFXIVvoFRBn1ZRPYNne+Mhi/ePHb
         xckg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gH1zSac9;
       spf=pass (google.com: domain of madamarawaaa@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=madamarawaaa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CAqB2I6Yf0F52kzm3n//Eq0X3xsWLynd2OuyM2wSEbs=;
        b=DuTkih5kDyYvFR6VZOtQRqAx3oeB5WFJ+KaLeaC7YmhhQx54c9qB/S+bdCfend7umo
         VB/ZETp/FLQg+E/5QeckoAOQrVp0C85UVj1fmb6ejpv6OaLHJSa8I58mtnKrKmlYzmGF
         MBIPPKxbA2T8jT3J3jHBaOrrHYiISQG8scXgoh942kMmmmMxb/0zcppDZBYzt1vaZ46W
         oOtFNClnwVSo/iD7akogcaa3ZgmQJ7kwcOLkOdmK0jzdPaJS+2y5eE8cH+hhZn5Cv6k/
         JwUcfxOyaa54VuYZD6Q0LYNSDUEpNVfKFC1/wyMv0NgY/PjZvkWwGhyf5nJA27Zj9PdZ
         KmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CAqB2I6Yf0F52kzm3n//Eq0X3xsWLynd2OuyM2wSEbs=;
        b=RkeThCM4BHo3AHr8NfKJ/3VYTuRFFRv0R2po8/ainrFWN7DZa3fgh9tiwIppivwkUS
         0kwIRJ/dxWNxzrt0MoZ+AhS2X+8AvA+iVT3E4zg7sz98sH7k2rmFIjAFHEpPv0F4jrA+
         lUTitGxLaCa96w5Jz4E890PyejQwMAFCxx/wfx2KwaPuFA7N8M0HYrF6gfbmTs65uUWN
         P6SRz9kLhkzKAFmIW+3ODxSqbH8o0PZD2Mq5ls1Dl9GqljlFHN0fZZlMu0W1Hrw0eWfc
         ribBRpcrdEPL0OSNsV8oDzUtXdILWS+T02AoCEAn4j061Rqn/8BDzBF25Gubu5ZXIAFY
         4YrQ==
X-Gm-Message-State: AOAM532Zu5cQG7QdwzpET59hkRJU7M35ExTK0kJidmBWNUiysLXXa/hm
	vpiI7DKEUxtNzF4Ahs1VIWU=
X-Google-Smtp-Source: ABdhPJygw8uX9AgA+LoHEX4oLwhrWrh7Q7ju7anGsKba7hc1bdNfpGfqOLbwswiKNkLOEcassIM+Dg==
X-Received: by 2002:a05:620a:13f2:b0:60b:d595:6db1 with SMTP id h18-20020a05620a13f200b0060bd5956db1mr3628270qkl.366.1646545842671;
        Sat, 05 Mar 2022 21:50:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:e209:0:b0:477:a7d6:5f83 with SMTP id g9-20020a37e209000000b00477a7d65f83ls4896646qki.0.gmail;
 Sat, 05 Mar 2022 21:50:41 -0800 (PST)
X-Received: by 2002:a05:620a:38d:b0:5f1:91db:9513 with SMTP id q13-20020a05620a038d00b005f191db9513mr3525140qkm.85.1646545841872;
        Sat, 05 Mar 2022 21:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646545841; cv=none;
        d=google.com; s=arc-20160816;
        b=gsFQMGYsZoJJIGwAdFGCbjMfP7in1V1EgQoqAbT+ziyueg1/Xoj/vkDXrcY4lqDzRA
         am/3XgU0TZoDKeVWbN/eDTDs6CXXs6Zpq4gHIcl9ep04fByVsffrehXWl8+jjmZmVl2n
         8O3KOuL37NZoeGqhqdjfScQ8utpoGchV6Tn3fN77NHqWzqNPofRPzfkoQzTEBgppFBNZ
         /3bb3O5rM+u2siKGQ1s8t5+Grc5T4do0Hf030qmUW3VhtcwuEpCYChJWb1tmXn0UTkrq
         Dt2A7boe3Tbq4vQ7jZF6Ns4wLKE+AhdqQAn6WOUCcbg5U463EH/OoeFUH2N5Id1Afjam
         Pa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:sender:mime-version:dkim-signature;
        bh=VaaSLAJ+hgNGNq49WyPsh3ndDLo+mnrYcswrOHpJSv8=;
        b=DIq7/YMNnBx4i9iBEYEhUqL/i+Lr63IwP7+Nr5OYj2wDxyjugbWA/bTChTS4F+yvqN
         ocpRk+Ot8+n8EzZmgnm3/KOl+1EWXTHkc1OscSdk7bg0vkWh3mpFnll9yTcW/yC4G0+I
         NRX3V5ISwUDRGO2MwDFlGH3q8R84uwklljiKMOV2cD8ppp7k7T5ZGyGsHuVQOq8h/Y70
         931gcxbs25eAUXwXVpP2pqpymSC/LgYaoPo6ksFcKzg/Oy1uWXfHYsqJCKdMEMIl5wfW
         nT+GOvHcUQ72brZ+KpbbJ5J/k4sJc8rT7vaTui0A9vmpz6ZfKWjj8/z3bixto7E31HG/
         yR4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gH1zSac9;
       spf=pass (google.com: domain of madamarawaaa@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=madamarawaaa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com. [2607:f8b0:4864:20::1133])
        by gmr-mx.google.com with ESMTPS id g11-20020a05620a278b00b0067af44a3800si172947qkp.2.2022.03.05.21.50.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 21:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of madamarawaaa@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) client-ip=2607:f8b0:4864:20::1133;
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2dc585dbb02so68014987b3.13
        for <jailhouse-dev@googlegroups.com>; Sat, 05 Mar 2022 21:50:41 -0800 (PST)
X-Received: by 2002:a81:9210:0:b0:2dc:27d2:292e with SMTP id
 j16-20020a819210000000b002dc27d2292emr4542327ywg.20.1646545841625; Sat, 05
 Mar 2022 21:50:41 -0800 (PST)
MIME-Version: 1.0
Sender: madamarawaaa@gmail.com
Received: by 2002:a05:7010:7044:b0:211:4c69:46e6 with HTTP; Sat, 5 Mar 2022
 21:50:41 -0800 (PST)
From: Ssan Elwood Hara <mrs.susanelwoodhara17@gmail.com>
Date: Sun, 6 Mar 2022 05:50:41 +0000
Message-ID: <CAJRRPJ_b38PVwWiD_OCdo8UZd9YJv70oKVUhbNjDH+AGTQCykQ@mail.gmail.com>
Subject: GOD BLESS YOU AS YOU REPLY URGENTLY
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: mrs.susanelwoodhara17@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=gH1zSac9;       spf=pass
 (google.com: domain of madamarawaaa@gmail.com designates 2607:f8b0:4864:20::1133
 as permitted sender) smtp.mailfrom=madamarawaaa@gmail.com;       dmarc=pass
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

GOD BLESS YOU AS YOU REPLY URGENTLY

 Hello Dear,
Greetings, I am contacting you regarding an important information i
have for you please reply to confirm your email address and for more
details Thanks
Regards
Mrs Susan Elwood Hara.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAJRRPJ_b38PVwWiD_OCdo8UZd9YJv70oKVUhbNjDH%2BAGTQCykQ%40mail.gmail.com.
