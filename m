Return-Path: <jailhouse-dev+bncBCL5PDOG5IGBBHWAROCAMGQEDDAGTNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E4369539
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Apr 2021 16:56:32 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id t126-20020a37aa840000b02902e3c5b3abeasf11849643qke.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Apr 2021 07:56:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619189791; cv=pass;
        d=google.com; s=arc-20160816;
        b=bOQBNUtZQBHEu4wpTfF3o5NS5V6xRENhfMvf4oSjGxg/WNPPUIuLyzR5BVe0edo7oC
         RnAlYvlo0Xb+yT7o+dWbfHC1Qc8MHqhCeTtrBJ1PysJxLlX16rn+HOJo5mAR2l0MEb9S
         nOR7ivgY1dSUJ4WDDznUT/dHfAq+pPc7azEoJBu0SJvdqvi5PZ7z+mz1HxSxJz9PdKYF
         UQyB8X7d6ubJ0dMMfsiaMF1ge99Vyw0cgyN73Q1fXOuPmOx52kIgBKcsYU/Yl7uUdqJn
         3w0zkGbV7ss+lEc6KE/Khh+VYGThg2+Z+GsHaM03tqHiyyAjp6VTMPXo2qqV5ztEq5nT
         fELw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=3iQBKsdHlonkUyhjHCUQ7Q47RfzPrty9Nlrlz5UpedM=;
        b=bbRTZE/nZvVD6IDK9zqoyKJCy2adzfG7s91nJgbqmmoYuflwmssvlrLpbXbP0rTopM
         qC7TzlPqbgoP9uI3nwxdoaBMgXbcSwH1TFhpCiX3WdFilhpDob18QhG6i7GNXtlHXLs5
         kuCG8aHEt3HZkybju+Vst0XdoVEoJAuVUyy5ZKvfpJojSV28gtHDaiIeamJRTglBzXfK
         3qYAhTakf9z4VpdINgvC7ZFmVlhTBcGxomKkf3iHW5Slg+iH/THPeYp9kmw3I6j+fAXo
         eMfPBn4V5UtlOkPspruEpESJOkV9jGFjcNzRep7sA7L1stqf+yjuUmOuQLtEpOd4WO3k
         gujg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f9E3j4+Q;
       spf=pass (google.com: domain of bayzalngom824@gmail.com designates 2607:f8b0:4864:20::1031 as permitted sender) smtp.mailfrom=bayzalngom824@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3iQBKsdHlonkUyhjHCUQ7Q47RfzPrty9Nlrlz5UpedM=;
        b=ixsokgCnxLfS1nQZeBVFUOBnPAMLid5opMJZSgXES/CUrvz/ZmouyoJQ52u4koaR/t
         fl/wnH+vgJZJHHk5fJNtkXYxkX7Zf++/AsBrmyLGWsbK/el5R5u++Ym+NwyoEh3Mj2Bx
         3LSudKc8vV1jxHIy2t+MfwEo88Vi5QXDIwQ7aXHntBrKV5LMpok2GQncwZkO4LgnYMDr
         Vnac2Zc73OGq24dpiQNXtSIcjZohIPOGNQlq0mpfo07r+yySdKhYzS0fHb1clzjv1ycn
         v4b3nLmLmAI2fkfmq8CcoTZ+tKs4YBKfNP3wnKIvkQyMmjBhNRlHEkJhd4KXjuqAJmqx
         raLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3iQBKsdHlonkUyhjHCUQ7Q47RfzPrty9Nlrlz5UpedM=;
        b=rt0DrsBgU3FlIhTVaYTSx+DB1Nn6eIs6taFfj1pDDmjzHp60VG5uZBz23GS0X0Yocs
         1zthusThKoPPxkpG2bk4KW6dgUTdzbdF7Jk6j6BE0z9yiJ2tUKzfmbeh1VZbCdc6AAE8
         PSrZ3cBdWSuMiP6+KUd5bjIhwzOeMyHd1rvp5UztMkJt1PKndks31P9sFrlKMIImHyB0
         oNdHO3yNngbXCgpDGfipskntqrr410WtKlolQ2faGKupI6wA/cmsz0qZtm/SbUj06kww
         sfrFUesaot0MNYe/HhPlMg4GSX5c7Kdx2k8IFz1JfnDe3sD/Loy0FIvqhc346gmozhM8
         dPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3iQBKsdHlonkUyhjHCUQ7Q47RfzPrty9Nlrlz5UpedM=;
        b=k6wDUv66249VEU+8ClQKHv2nGYku1H2qBOGNp0UH/aGZXQvlOQLUw2z/aEtz7ZHIWB
         CP37D//l/WPNMHMkwKKJWTbxWkM47suVQQM8sVM9qgfzlnNnGA8QqLZNl6NosV03HjW8
         GqmLgpPdL7zR563ZgL5sWVFhs2R9dLZnLZBKS8e5aKRUBD5bwekzyxyqedKeaRXd1mql
         7CyuVb8PRyrCkaRafEqhXCgEuJ5iKBQs1tdmRWt4qxo9PJ91w+VU06nT9wV88iKLB1ZF
         Sqw91YZcnX/h/tYVqAmx7+OjJQYU1GNZPy/Zh59XDG+PmBIwOAHQ7T6SqZZ2NWa19ggW
         ldhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NvTFSsABJ5asgxmTt9fdcWkIX0XwyAKm8xHYiGJdtRA1xaJ9C
	W11EOWLciay+wc6sPXZYAQM=
X-Google-Smtp-Source: ABdhPJzT4t7BTq0ShacMLnu9bnwiDmzgRErNLMMXbc/+ruJWE8JZBGcn6btvXltHBwQ7RISeulrKIA==
X-Received: by 2002:a0c:9e0f:: with SMTP id p15mr4797355qve.33.1619189790953;
        Fri, 23 Apr 2021 07:56:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:7a82:: with SMTP id v124ls5172352qkc.3.gmail; Fri, 23
 Apr 2021 07:56:30 -0700 (PDT)
X-Received: by 2002:a37:a74f:: with SMTP id q76mr4460290qke.433.1619189790323;
        Fri, 23 Apr 2021 07:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619189790; cv=none;
        d=google.com; s=arc-20160816;
        b=p7F0PgNDN3FxSBQljESOsI0amUmpSg03LnUm38Mq6Q/UC9c3ZeFGSm6Qk0kLLGYvla
         vzj3/aSjayM8nxBNOkr4WY3+bIOGQ32eixYp7MC71QHz71cQqhAet4K/7HYvvB7pCw6N
         Ud4cGz34m5JN4jqhJVMc3cEEuVfGeMTFFVYTDMq3wj5evZqgpMVUaW3KNQ55CLr5v4cz
         m75o70Cbf0ql3JXkaH2vYRF91oCFqI2Ir56xdZlqaumNsG5AOeHeGV7VdJfhkC7cTh/8
         VxMsPeEL0IQ35BjuKIDbMKe2FbPOPzTvIBqrYBocTjK15/hsUBPXxgyfA0ISW6GQHHlN
         jlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8fhPGSZsXf3jUx4LYUSJC772SccX9Zkk8AyxTTXrobU=;
        b=0kkDo3T0huKtMQD/YEzepDs6Tfy59hvoqG7yOVW5hqWZpJVZ15qCUJ8xktm60d83VD
         AElPj3/rFXKPh/BSigyepEOMAR+7PDZJ7F4meIlfFpcQswQ9MGUvb+H2StDIoNoJ2+5o
         3VRhg55zk7qN5eYVB2cph+r7bKordDRYU+3JFACazkbr+nLTqxupS7KV5DVvDm/wrNqZ
         zx/U6TZxUMhtk93S3ONAMvvllFyD/GdeNZQxFP+KjKYhAknGsd30wKRzU+ce2oGD438t
         fhL7SDmpxRMUsMg0BMULzNzjhKPoYOfQuRR5RJG8QD2uAFJwRqXg4N/J5eGrgV/iHtiv
         qzGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f9E3j4+Q;
       spf=pass (google.com: domain of bayzalngom824@gmail.com designates 2607:f8b0:4864:20::1031 as permitted sender) smtp.mailfrom=bayzalngom824@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com. [2607:f8b0:4864:20::1031])
        by gmr-mx.google.com with ESMTPS id c72si774634qkg.6.2021.04.23.07.56.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 07:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of bayzalngom824@gmail.com designates 2607:f8b0:4864:20::1031 as permitted sender) client-ip=2607:f8b0:4864:20::1031;
Received: by mail-pj1-x1031.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso1333227pjg.2
        for <jailhouse-dev@googlegroups.com>; Fri, 23 Apr 2021 07:56:30 -0700 (PDT)
X-Received: by 2002:a17:90a:d201:: with SMTP id o1mr6232665pju.230.1619189789608;
 Fri, 23 Apr 2021 07:56:29 -0700 (PDT)
MIME-Version: 1.0
From: Karen J Brown <karen.j.brown211@gmail.com>
Date: Fri, 23 Apr 2021 14:56:18 +0000
Message-ID: <CA+QsSgkJCpkQ-r19YXd6y-RiDcqsBew5RpdYVMmki+FW4DUb7A@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003bccda05c0a500d2"
X-Original-Sender: karen.j.brown211@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=f9E3j4+Q;       spf=pass
 (google.com: domain of bayzalngom824@gmail.com designates 2607:f8b0:4864:20::1031
 as permitted sender) smtp.mailfrom=bayzalngom824@gmail.com;       dmarc=pass
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

--0000000000003bccda05c0a500d2
Content-Type: text/plain; charset="UTF-8"

 Can we talk please ???

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BQsSgkJCpkQ-r19YXd6y-RiDcqsBew5RpdYVMmki%2BFW4DUb7A%40mail.gmail.com.

--0000000000003bccda05c0a500d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">



































Can we talk please ???







































































</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2BQsSgkJCpkQ-r19YXd6y-RiDcqsBew5RpdYVMmki%2BFW4=
DUb7A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CA%2BQsSgkJCpkQ-r19YXd6y-RiDcqsBew5RpdY=
VMmki%2BFW4DUb7A%40mail.gmail.com</a>.<br />

--0000000000003bccda05c0a500d2--
