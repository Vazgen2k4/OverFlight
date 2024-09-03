import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:over_flight/resources/resources.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const maxStarsCount = 5;
    const horizontalPadding = 16.0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            leading: Center(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.menu,
                  width: 17,
                  height: 17,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/angry-cartoon-monster-face-vector-halloween-monster-square-avatar-isolated_6996-1459.jpg',
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 12,
                left: horizontalPadding,
                right: horizontalPadding,
              ),
              child: Text(
                'Where would you\nlike to go?',
                style: textTheme.titleLarge,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      enabled: true,
                      scrollPadding: EdgeInsets.zero,
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.title,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ex. Bali, Paris',
                        hintStyle: textTheme.titleMedium,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.border,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.main,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.border),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      padding: const WidgetStatePropertyAll(EdgeInsets.all(14)),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.textFieldOptions,
                      width: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: maxStarsCount,
                  itemBuilder: (_, index) => Center(
                    child: IconButton(
                      // color: const Color.fromARGB(255, 32, 154, 215),

                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(2),
                        shadowColor: WidgetStateProperty.all(
                          AppColors.cards.withOpacity(.5),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                          AppColors.cards,
                        ),
                      ),
                      onPressed: () {},
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                            Icons.star_rate_rounded,
                            size: 25,
                            color: AppColors.stars,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${maxStarsCount - index} Stars',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Place',
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: textTheme.headlineLarge?.copyWith(
                        fontSize: 18,
                        color: AppColors.main,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: 240,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 240,
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.error,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            index % 2 == 0 ? AppImages.paris : AppImages.tokio,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Paris, ',
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'France',
                                        style: textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '1,620 Hotel ',
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 11),
                                    Text(
                                      '4.6 Stars',
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.stars,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 8,
                left: horizontalPadding,
                right: horizontalPadding,
              ),
              child: Text(
                'Favorite in Malang',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            sliver: SliverList.separated(
              itemCount: 200,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, index) => ListTile(
                leading: Image.asset(
                  'assets/images/Room/${(index % 5) + 1}.png',
                ),
                title: Text(
                  'Spencer Green Hotel Malang',
                  style: textTheme.titleLarge?.copyWith(fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
